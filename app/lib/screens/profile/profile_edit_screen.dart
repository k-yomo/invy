import 'dart:io';

import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:device_info_plus/device_info_plus.dart';
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
import 'package:invy/util/toast.dart';
import 'package:mime/mime.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../widgets/app_bar_leading.dart';

class ProfileEditRoute extends GoRouteData {
  const ProfileEditRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const ProfileEditScreen();
}

class ProfileEditScreen extends StatefulHookConsumerWidget {
  const ProfileEditScreen({super.key});

  @override
  ProfileEditScreenState createState() {
    return ProfileEditScreenState();
  }
}

class ProfileEditScreenState extends ConsumerState<ProfileEditScreen> {
  final _nicknameFormKey = GlobalKey<FormState>();
  final _screenIdFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final picker = ImagePicker();
    final graphqlClient = ref.read(graphqlClientProvider);
    final user = ref.watch(loggedInUserProvider)!;
    final avatarUpdateLoading = useState(false);
    final nicknameController = TextEditingController(text: user.nickname);
    final screenIdController = TextEditingController(text: user.screenId);

    onPressedAvatarUpdate() async {
      PermissionStatus permissionStatus;
      if (Platform.isAndroid) {
        final androidInfo = await DeviceInfoPlugin().androidInfo;
        if (androidInfo.version.sdkInt <= 32) {
          permissionStatus = await Permission.storage.status;
          if (permissionStatus.isDenied) {
            permissionStatus = await Permission.storage.request();
          }
        } else {
          permissionStatus = await Permission.photos.status;
          if (permissionStatus.isDenied) {
            permissionStatus = await Permission.photos.request();
          }
        }
      } else {
        permissionStatus = await Permission.photos.status;
        if (permissionStatus.isDenied) {
          final status = await Permission.photos.request();
          // Don't show alert right after user denied to allow the permission
          if (status.isGranted) {
            permissionStatus = status;
          } else {
            showToast('プロフィール写真の変更には、"写真"へのアクセス許可が必要です。', ToastLevel.error);
            return;
          }
        }
      }
      if (permissionStatus.isDenied || permissionStatus.isPermanentlyDenied) {
        if (!context.mounted) {
          return;
        }
        final result = await showOkCancelAlertDialog(
          context: context,
          title: '"写真"へのアクセスがありません。',
          message: 'プロフィール写真を変更するには、設定から"写真"へのアクセスを許可してください。',
          cancelLabel: "キャンセル",
          okLabel: "設定に移動",
        );
        if (result == OkCancelResult.ok) {
          await openAppSettings();
        }
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

    validateNickname(value) {
      if (value == null || value.isEmpty) {
        return 'ニックネームを入力してください';
      }
      if (value.length < 3) {
        return '3文字以上入力してください';
      }
      return null;
    }

    Future<bool> onNicknameSubmitted() async {
      final nickname = nicknameController.text;
      if (validateNickname(nickname) != null) {
        return false;
      }
      if (nickname == user.nickname) {
        // no change
        return true;
      }
      final result = await graphqlClient.mutate$updateNickname(
          Options$Mutation$updateNickname(
              variables:
                  Variables$Mutation$updateNickname(nickname: nickname)));
      if (result.hasException) {
        print(result.exception);
        showToast("ユーザーIDの更新に失敗しました。時間を置いて再度お試しください。", ToastLevel.error);
        return false;
      }
      ref.read(loggedInUserProvider.notifier).state =
          user.copyWith(nickname: nickname);
      showToast("ニックネームを更新しました。", ToastLevel.success);
      return true;
    }

    validateScreenId(value) {
      final screenIdRegex = RegExp(r'(^[a-zA-Z0-9_]*$)');
      if (value == null || value.isEmpty) {
        return 'ユーザーIDを入力してください';
      }
      if (value.length < 3) {
        return '3文字以上入力してください';
      }
      if (!screenIdRegex.hasMatch(value)) {
        return '英数字、アンダースコア（_）のみ使用可能です';
      }
      return null;
    }

    Future<bool> onScreenIdSubmitted() async {
      final screenId = screenIdController.text;
      if (validateScreenId(screenId) != null) {
        return false;
      }
      if (screenId == user.screenId) {
        // no change
        return true;
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
      ref.read(loggedInUserProvider.notifier).state =
          user.copyWith(screenId: screenId);
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
                      controller: nicknameController,
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
                          builder: (BuildContext context) {
                            return Container(
                              height: MediaQuery.of(context).size.height * 0.9,
                              padding: const EdgeInsets.only(
                                  top: 60, left: 15, right: 15, bottom: 15),
                              child: Column(
                                children: [
                                  Expanded(
                                    child: Form(
                                      key: _nicknameFormKey,
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      child: TextFormField(
                                        autofocus: true,
                                        controller: nicknameController,
                                        cursorColor: Colors.grey.shade600,
                                        decoration: InputDecoration(
                                          labelText: 'ニックネーム',
                                          labelStyle: TextStyle(
                                              color: Colors.grey.shade600),
                                          filled: true,
                                          fillColor: Colors.grey.shade100,
                                          border: InputBorder.none,
                                        ),
                                        maxLength: 50,
                                        validator: validateNickname,
                                      ),
                                    ),
                                  ),
                                  SingleChildScrollView(
                                    controller:
                                        ModalScrollController.of(context),
                                    padding: EdgeInsets.only(
                                        bottom: MediaQuery.of(context)
                                            .viewInsets
                                            .bottom),
                                    child: TextButton(
                                      onPressed: () async {
                                        final isSuccessful =
                                            await onNicknameSubmitted();
                                        if (isSuccessful) {
                                          Navigator.pop(context);
                                        }
                                      },
                                      style: TextButton.styleFrom(
                                        minimumSize: const Size.fromHeight(0),
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 12),
                                        backgroundColor: Colors.black,
                                        foregroundColor: Colors.white,
                                      ),
                                      child: const Text(
                                        '更新する',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      }),
                  const Gap(20),
                  TextFormField(
                    controller: screenIdController,
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
                            child: Column(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Form(
                                        key: _screenIdFormKey,
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                        child: TextFormField(
                                          autofocus: true,
                                          controller: screenIdController,
                                          cursorColor: Colors.grey.shade600,
                                          decoration: InputDecoration(
                                            labelText: 'ユーザーID',
                                            labelStyle: TextStyle(
                                                color: Colors.grey.shade600),
                                            filled: true,
                                            fillColor: Colors.grey.shade100,
                                            border: InputBorder.none,
                                          ),
                                          maxLength: 15,
                                          validator: validateScreenId,
                                        ),
                                      ),
                                      const Text("英数字、アンダースコア（_）のみ使用可能です。",
                                          style: TextStyle(fontSize: 12))
                                    ],
                                  ),
                                ),
                                SingleChildScrollView(
                                  controller: ModalScrollController.of(context),
                                  padding: EdgeInsets.only(
                                      bottom: MediaQuery.of(context)
                                          .viewInsets
                                          .bottom),
                                  child: TextButton(
                                    onPressed: () async {
                                      final isSuccessful =
                                          await onScreenIdSubmitted();
                                      if (isSuccessful) {
                                        Navigator.pop(context);
                                      }
                                    },
                                    style: TextButton.styleFrom(
                                      minimumSize: const Size.fromHeight(0),
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 12),
                                      backgroundColor: Colors.black,
                                      foregroundColor: Colors.white,
                                    ),
                                    child: const Text(
                                      '更新する',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ],
                            ),
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
