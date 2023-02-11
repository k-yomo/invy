import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:graphql/client.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:invy/widgets/permission_error_alert_dialog.dart';
import 'package:invy/screens/profile/profile_edit_screen.graphql.dart';
import 'package:invy/graphql/schema.graphql.dart';
import 'package:invy/services/graphql_client.dart';
import 'package:invy/state/auth.dart';
import 'package:invy/util/toast.dart';
import 'package:mime/mime.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../widgets/app_bar_leading.dart';

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
          permissionStatus = await Permission.photos.request();
        }
      }
      if (permissionStatus.isDenied || permissionStatus.isPermanentlyDenied) {
        if (!context.mounted) {
          return;
        }
        showDialog(
          context: context,
          builder: (_) {
            return const PermissionErrorAlertDialog(
              permissionName: "写真",
            );
          },
        );
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

    onNicknameSubmitted(String nickname) async {
      if (validateNickname(nickname) != null) {
        return;
      }
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

    onScreenIdSubmitted(String screenId) async {
      if (validateScreenId(screenId) != null) {
        return;
      }
      if (screenId == user.screenId) {
        // no change
        return;
      }
      final result = await graphqlClient.mutate$updateScreenId(
          Options$Mutation$updateScreenId(
              variables:
                  Variables$Mutation$updateScreenId(screenId: screenId)));
      if (result.hasException) {
        if (result.exception?.graphqlErrors.first.extensions != null) {
          if (result.exception!.graphqlErrors.first.extensions!["code"] ==
              toJson$Enum$ErrorCode(Enum$ErrorCode.ALREADY_EXISTS)) {
            showToast("入力されたユーザーIDは既に使用されています", ToastLevel.error);
            return;
          }
        }
        showToast("ユーザーIDの更新に失敗しました", ToastLevel.error);
        return;
      }
      ref.read(loggedInUserProvider.notifier).state =
          user.copyWith(screenId: screenId);
      showToast("ユーザーIDを更新しました", ToastLevel.success);
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
                  Form(
                    key: _nicknameFormKey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: TextFormField(
                      controller: TextEditingController(text: user.nickname),
                      cursorColor: Colors.grey.shade600,
                      decoration: InputDecoration(
                        labelText: 'ニックネーム',
                        labelStyle: TextStyle(color: Colors.grey.shade600),
                        filled: true,
                        fillColor: Colors.grey.shade100,
                        border: InputBorder.none,
                      ),
                      maxLength: 50,
                      validator: validateNickname,
                      onFieldSubmitted: onNicknameSubmitted,
                    ),
                  ),
                  const Gap(20),
                  Form(
                    key: _screenIdFormKey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: TextFormField(
                      controller: TextEditingController(text: user.screenId),
                      cursorColor: Colors.grey.shade600,
                      decoration: InputDecoration(
                        labelText: 'ユーザーID',
                        labelStyle: TextStyle(color: Colors.grey.shade600),
                        filled: true,
                        fillColor: Colors.grey.shade100,
                        border: InputBorder.none,
                      ),
                      maxLength: 15,
                      validator: validateScreenId,
                      onFieldSubmitted: onScreenIdSubmitted,
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
