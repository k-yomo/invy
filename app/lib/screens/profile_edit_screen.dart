import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:graphql/client.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:invy/graphql/profile_edit_screen.graphql.dart';
import 'package:invy/services/graphql_client.dart';
import 'package:invy/state/auth.dart';
import 'package:invy/util/toast.dart';
import 'package:mime/mime.dart';

import '../components/app_bar_leading.dart';

class ProfileEditScreen extends HookConsumerWidget {
  const ProfileEditScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final picker = ImagePicker();
    final graphqlClient = ref.read(graphqlClientProvider);
    final user = ref.watch(loggedInUserProvider)!;
    final avatarUpdateLoading = useState(false);

    onPressedAvatarUpdate() async {
      final pickedImage = await picker.pickImage(source: ImageSource.gallery);
      if (pickedImage == null) {
        return;
      }
      avatarUpdateLoading.value = true;
      var byteData = await pickedImage.readAsBytes();
      var multipartFile = MultipartFile.fromBytes(
        pickedImage.path.split('/').last,
        byteData,
        contentType: MediaType.parse(lookupMimeType(pickedImage.path)!),
      );
      final result = await graphqlClient.mutate$updateAvatar(
        Options$Mutation$updateAvatar(
          fetchPolicy: FetchPolicy.networkOnly,
          variables: Variables$Mutation$updateAvatar(
            avatar: multipartFile,
          ),
        ),
      );
      avatarUpdateLoading.value = false;

      if (result.hasException) {
        print(result.exception);
        // TODO: show error;
        return;
      }
      ref.read(loggedInUserProvider.notifier).state = user.copyWith(
          avatarUrl: result.parsedData!.updateAvatar.viewer.avatarUrl);
      showToast("プロフィール写真を更新しました", ToastLevel.success);
    }

    onNicknameSubmitted(String nickname) async {
      if (nickname == user.nickname) {
        // no change
        return;
      }
      final result = await graphqlClient.mutate$updateNickname(
          Options$Mutation$updateNickname(
              variables:
                  Variables$Mutation$updateNickname(nickname: nickname)));
      if (result.hasException) {
        print(result.exception);
        // TODO: show error;
        return;
      }
      ref.read(loggedInUserProvider.notifier).state =
          user.copyWith(nickname: nickname);
      showToast("ニックネームを更新しました", ToastLevel.success);
    }

    return Scaffold(
      appBar: AppBar(
        leading: const AppBarLeading(),
        title: const Text(
          'プロフィール編集',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        shape:
            Border(bottom: BorderSide(color: Colors.grey.shade200, width: 1)),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(children: <Widget>[
          Container(
            margin: const EdgeInsets.only(top: 60),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 60.0,
                  backgroundImage: NetworkImage(user.avatarUrl),
                ),
                const Gap(10),
                OutlinedButton(
                  onPressed: onPressedAvatarUpdate,
                  child: avatarUpdateLoading.value
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            color: Colors.black,
                            strokeWidth: 3,
                          ),
                        )
                      : const Text("プロフィール写真を変更",
                          style: TextStyle(color: Colors.black)),
                ),
                const Gap(20),
                TextFormField(
                  controller: TextEditingController(text: user.nickname),
                  cursorColor: Colors.grey.shade600,
                  decoration: InputDecoration(
                    labelText: 'ニックネーム',
                    labelStyle: TextStyle(color: Colors.grey.shade600),
                    filled: true,
                    fillColor: Colors.grey.shade100,
                    border: InputBorder.none,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'ニックネームを入力してください';
                    }
                    return null;
                  },
                  onFieldSubmitted: onNicknameSubmitted,
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
