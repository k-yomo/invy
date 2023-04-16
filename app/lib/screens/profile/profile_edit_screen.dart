import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart' hide ModalBottomSheetRoute;
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:graphql/client.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:invy/graphql/schema.graphql.dart';
import 'package:invy/screens/profile/profile_edit_screen.graphql.dart';
import 'package:invy/services/graphql_client.dart';
import 'package:invy/state/auth.dart';
import 'package:invy/util/permission.dart';
import 'package:invy/util/toast.dart';
import 'package:invy/widgets/nickname_edit_form.dart';
import 'package:invy/widgets/screen_id_edit_form.dart';
import 'package:invy/widgets/screen_wrapper.dart';
import 'package:mime/mime.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../widgets/app_bar_leading.dart';

class ProfileEditRoute extends GoRouteData {
  const ProfileEditRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const ScreenWrapper(child: ProfileEditScreen());
}

class ProfileEditScreen extends HookConsumerWidget {
  const ProfileEditScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final picker = ImagePicker();
    final graphqlClient = ref.read(graphqlClientProvider);
    final user = ref.watch(loggedInUserProvider)!;
    final avatarUpdateLoading = useState(false);

    onPressedAvatarUpdate() async {
      final permissionGranted = await requirePhotoPermission(context);
      if (!permissionGranted) {
        return;
      }

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
        return true;
      }
      final result = await graphqlClient.mutate$updateNickname(
          Options$Mutation$updateNickname(
              variables:
                  Variables$Mutation$updateNickname(nickname: nickname)));
      if (result.hasException) {
        print(result.exception);
        showToast("ニックネームの更新に失敗しました。時間を置いて再度お試しください。", ToastLevel.error);
        return false;
      }
      ref.read(loggedInUserProvider.notifier).update((state) {
        return state!.copyWith(nickname: nickname);
      });

      showToast("ニックネームを更新しました。", ToastLevel.success);
      return true;
    }

    onScreenIdSubmitted(String screenId) async {
      if (screenId == user.screenId) {
        return false;
      }
      final result = await graphqlClient.mutate$updateScreenId(
          Options$Mutation$updateScreenId(
              variables:
                  Variables$Mutation$updateScreenId(screenId: screenId)));
      if (result.hasException) {
        if (result.exception?.graphqlErrors.first.extensions != null) {
          if (result.exception!.graphqlErrors.first.extensions!["code"] ==
              toJson$Enum$ErrorCode(Enum$ErrorCode.ALREADY_EXISTS)) {
            showToast("入力されたユーザーIDは既に使用されています。", ToastLevel.error);
            return false;
          }
        }
        showToast("ユーザーIDの更新に失敗しました。時間を置いて再度お試しください。", ToastLevel.error);
        return false;
      }
      ref.read(loggedInUserProvider.notifier).update((state) {
        return state!.copyWith(screenId: screenId);
      });
      showToast("ユーザーIDを更新しました。", ToastLevel.success);
      return true;
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
                    backgroundImage: CachedNetworkImageProvider(user.avatarUrl),
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
                      readOnly: true,
                      onTap: () {
                        showMaterialModalBottomSheet(
                            context: context,
                            duration: const Duration(milliseconds: 300),
                            builder: (BuildContext context) => Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.9,
                                  padding: const EdgeInsets.only(
                                      top: 60, left: 15, right: 15, bottom: 15),
                                  child: NicknameEditForm(
                                      nickname: user.nickname,
                                      onSubmitted: (nickname) async {
                                        if (await onNicknameSubmitted(
                                            nickname)) {
                                          Navigator.pop(context);
                                        }
                                      }),
                                ));
                      }),
                  const Gap(20),
                  TextFormField(
                    controller: TextEditingController(text: user.screenId),
                    decoration: InputDecoration(
                      labelText: 'ユーザーID',
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
                        builder: (BuildContext context) {
                          return Container(
                            height: MediaQuery.of(context).size.height * 0.9,
                            padding: const EdgeInsets.only(
                                top: 60, left: 15, right: 15, bottom: 15),
                            child: ScreenIdEditForm(
                                screenId: user.screenId,
                                onSubmitted: (screenId) async {
                                  if (await onScreenIdSubmitted(screenId)) {
                                    Navigator.pop(context);
                                  }
                                }),
                          );
                        },
                      );
                    },
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
