import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as chatUITypes;
import 'package:flutter_chat_ui/flutter_chat_ui.dart' as chatUI;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:invy/constants/firestore.dart';
import 'package:invy/graphql/scalars.dart';
import 'package:invy/graphql/schema.graphql.dart';
import 'package:invy/services/graphql_client.dart';
import 'package:invy/state/auth.dart';
import 'package:invy/util/toast.dart';
import 'package:invy/widgets/chat.graphql.dart';
import 'package:invy/widgets/invitation_detail_fragment.graphql.dart';
import 'package:mime/mime.dart';

class ChatL10nJa extends ChatL10n {
  const ChatL10nJa({
    super.attachmentButtonAccessibilityLabel = '画像アップロード',
    super.emptyChatPlaceholder = 'メッセージがありません。',
    super.fileButtonAccessibilityLabel = 'ファイル',
    super.inputPlaceholder = 'メッセージを入力',
    super.sendButtonAccessibilityLabel = '送信',
    super.unreadMessagesLabel = "未読メッセージ",
  });
}

class Chat extends StatefulHookConsumerWidget {
  const Chat({super.key, required this.chatRoomId, required this.users});

  final String chatRoomId;
  final List<Fragment$invitationDetailAcceptedUserFragment> users;

  @override
  ChatState createState() {
    return ChatState();
  }
}

class ChatState extends ConsumerState<Chat> {
  int _limit = 20;
  bool _isAttachmentUploading = false;
  List<chatUITypes.Message> chatMessages = [];

  final int _limitIncrement = 20;

  late LoggedInUser _loggedInUser;
  late GraphQLClient _graphqlClient;
  late Map<String, chatUITypes.User> _userMap;

  @override
  void initState() {
    super.initState();
    _loggedInUser = ref.read(loggedInUserProvider)!;
    _graphqlClient = ref.read(graphqlClientProvider);
    _userMap = widget.users.fold({}, (userMap, user) {
      userMap[user.id] = chatUITypes.User(
        id: user.id,
        firstName: user.nickname,
        imageUrl: user.avatarUrl,
      );
      return userMap;
    });
  }

  _onSendPressed(chatUITypes.PartialText message) async {
    final result = await _graphqlClient
        .mutate$sendChatMessageText(Options$Mutation$sendChatMessageText(
            variables: Variables$Mutation$sendChatMessageText(
      input: Input$SendChatMessageTextInput(
        chatRoomId: widget.chatRoomId,
        text: message.text,
      ),
    )));
    if (result.hasException) {
      print(result.exception);
      showToast("メッセージの送信に失敗しました", ToastLevel.error);
      return false;
    }

    setState(() {
      chatMessages += [
        chatUITypes.Message(
          id: chatUITypes.MessageType.text,
        ),
        ...chatMessages
      ];
    });
  }

  void _onAttachmentPressed() async {
    final pickedImage = await ImagePicker().pickImage(
      imageQuality: 100,
      maxWidth: 1440,
      source: ImageSource.gallery,
    );
    if (pickedImage == null) {
      return;
    }

    setState(() {
      _isAttachmentUploading = true;
    });

    var byteData = await pickedImage.readAsBytes();
    var multipartFile = MultipartFile.fromBytes(
      pickedImage.path.split('/').last,
      byteData,
      contentType: MediaType.parse(lookupMimeType(pickedImage.path)!),
    );
    final result = await _graphqlClient
        .mutate$sendChatMessageImage(Options$Mutation$sendChatMessageImage(
            variables: Variables$Mutation$sendChatMessageImage(
      input: Input$SendChatMessageImageInput(
        chatRoomId: widget.chatRoomId,
        image: multipartFile,
      ),
    )));

    setState(() {
      _isAttachmentUploading = false;
    });

    if (result.hasException) {
      print(result.exception);
      showToast("画像の送信に失敗しました", ToastLevel.error);
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    final chatMessageSnapshot = useStream(FirebaseFirestore.instance
        .collection(firestoreChatRoomsCollectionPath)
        .doc(widget.chatRoomId)
        .collection(firestoreChatMessagesCollectionPath)
        .orderBy("createdAt", descending: true)
        .limit(_limit)
        .snapshots());
    chatMessages = chatMessageSnapshot.data != null
        ? chatMessageSnapshot.data!.docs.map((chatMessage) {
            final user = _userMap[chatMessage.get("userId") as String]!;
            switch (chatMessage.get("kind")) {
              case "IMAGE":
                return chatUITypes.ImageMessage(
                  id: chatMessage.id,
                  name: chatMessage.id,
                  uri: chatMessage.get("body")["url"] as String,
                  size: 20,
                  author: user,
                  createdAt:
                      DateTime.parse(chatMessage.get("createdAt") as String)
                          .millisecondsSinceEpoch,
                );
              default:
                // case "TEXT":
                return chatUITypes.TextMessage(
                  id: chatMessage.id,
                  text: chatMessage.get("body")["text"] as String,
                  author: user,
                  createdAt:
                      DateTime.parse(chatMessage.get("createdAt") as String)
                          .millisecondsSinceEpoch,
                );
            }
          }).toList()
        : [];

    return chatUI.Chat(
      showUserAvatars: true,
      user: chatUITypes.User(
        id: _loggedInUser.id,
        firstName: _loggedInUser.nickname,
        imageUrl: _loggedInUser.avatarUrl,
      ),
      messages: chatMessages,
      onAttachmentPressed: _onAttachmentPressed,
      isAttachmentUploading: _isAttachmentUploading,
      onSendPressed: _onSendPressed,
      onEndReached: () async {
        setState(() {
          _limit += _limitIncrement;
        });
        return;
      },
      l10n: const ChatL10nJa(),
    );
  }
}
