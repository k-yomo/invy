import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:invy/graphql/scalars.dart';
import 'package:invy/graphql/schema.graphql.dart';
import 'package:invy/screens/login/screen_id_registration_screen.dart';
import 'package:invy/screens/login/sign_up_screen.graphql.dart';
import 'package:invy/services/graphql_client.dart';
import 'package:invy/state/auth.dart';
import 'package:invy/util/file.dart';
import 'package:invy/util/permission.dart';
import 'package:invy/util/toast.dart';
import 'package:invy/widgets/app_bar_leading.dart';
import 'package:invy/widgets/nickname_edit_form.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

const defaultAvatarURL =
    "https://upload.wikimedia.org/wikipedia/commons/c/cd/Portrait_Placeholder_Square.png";

class SignUpScreen extends HookConsumerWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final graphqlClient = ref.read(graphqlClientProvider);
    final avatar = useState<XFile?>(null);
    final nickname = useState('');
    final isLoading = useState(false);
    final picker = ImagePicker();

    onSignUp() async {
      final firebaseUser = FirebaseAuth.instance.currentUser;
      if (firebaseUser == null || nickname.value.isEmpty || isLoading.value) {
        return;
      }

      isLoading.value = true;

      MultipartFile? avatarFile;
      if (avatar.value != null) {
        avatarFile = await convertToMultipartFile(avatar.value!);
      }
      final res = await graphqlClient.mutate$signUp(Options$Mutation$signUp(
          variables: Variables$Mutation$signUp(
        input: Input$SignUpInput(
            email: firebaseUser.email,
            nickname: nickname.value,
            avatar: avatarFile),
      )));
      isLoading.value = false;

      if (res.hasException) {
        showToast("プロフィールの登録に失敗しました。時間を置いて再度お試しください。", ToastLevel.error);
        return;
      }
      // Refresh id token to get new token containing user id in claims.
      await firebaseUser.getIdToken(true);
      final user = res.parsedData!.signUp.viewer;
      final loggedInUser = LoggedInUser(
          id: user.id,
          screenId: user.screenId,
          nickname: user.nickname,
          avatarUrl: user.avatarUrl);

      ref.read(loggedInUserProvider.notifier).state = loggedInUser;
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const ScreenIdRegistrationScreen(),
        ),
      );
    }

    onPressedAvatarUpdate() async {
      final permissionGranted = await requirePhotoPermission(context);
      if (!permissionGranted) {
        return;
      }

      final pickedImage = await picker.pickImage(source: ImageSource.gallery);
      if (pickedImage == null) {
        return;
      }
      avatar.value = pickedImage;
    }

    return Scaffold(
      appBar: AppBar(
        leading: const AppBarLeading(),
        title: const Text(
          'プロフィール登録',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        shape:
            Border(bottom: BorderSide(color: Colors.grey.shade200, width: 1)),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Column(children: <Widget>[
            Container(
              margin: const EdgeInsets.only(top: 60),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 60.0,
                    backgroundColor: Colors.transparent,
                    backgroundImage: avatar.value != null
                        ? Image.file(File(avatar.value!.path)).image
                        : const CachedNetworkImageProvider(defaultAvatarURL),
                  ),
                  const Gap(10),
                  OutlinedButton(
                    onPressed: onPressedAvatarUpdate,
                    child: const Text("プロフィール写真を選択",
                        style: TextStyle(color: Colors.black)),
                  ),
                  const Gap(20),
                  TextFormField(
                      controller: TextEditingController(text: nickname.value),
                      cursorColor: Colors.grey.shade600,
                      decoration: InputDecoration(
                        labelText: 'ニックネーム',
                        labelStyle: TextStyle(color: Colors.grey.shade600),
                        filled: true,
                        fillColor: Colors.grey.shade100,
                        border: InputBorder.none,
                      ),
                      readOnly: true,
                      onTap: () {
                        showMaterialModalBottomSheet(
                          context: context,
                          duration: const Duration(milliseconds: 300),
                          builder: (BuildContext context) => Container(
                              height: MediaQuery.of(context).size.height * 0.9,
                              padding: const EdgeInsets.only(
                                  top: 60, left: 15, right: 15, bottom: 15),
                              child: NicknameEditForm(
                                  nickname: nickname.value,
                                  onSubmitted: (updatedNickname) async {
                                    nickname.value = updatedNickname;
                                    Navigator.of(context).pop();
                                  })),
                        );
                      }),
                  const Gap(40),
                  TextButton(
                    onPressed: () {
                      onSignUp();
                    },
                    style: TextButton.styleFrom(
                      minimumSize: const Size.fromHeight(0),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      backgroundColor:
                          nickname.value.isEmpty ? Colors.grey : Colors.black,
                      foregroundColor: Colors.white,
                    ),
                    child: isLoading.value
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 3,
                            ),
                          )
                        : const Text(
                            'プロフィールを登録する',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
