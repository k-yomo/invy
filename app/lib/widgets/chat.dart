import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
import 'package:invy/router.dart';
import 'package:invy/services/graphql_client.dart';
import 'package:invy/state/auth.dart';
import 'package:invy/util/toast.dart';
import 'package:invy/widgets/chat.graphql.dart';
import 'package:invy/widgets/invitation_detail_fragment.graphql.dart';
import 'package:mime/mime.dart';
import 'package:uuid/uuid.dart';

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
  List<chatUITypes.Message> _chatMessages = [];
  final Map<String, chatUITypes.PreviewData> _chatMessagePreviewMap = {};

  final int _limitIncrement = 20;

  late LoggedInUser _loggedInUser;
  late GraphQLClient _graphqlClient;
  late Map<String, chatUITypes.User> _userMap;
  late String _idToken;

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
    Future(() async {
      final token = await FirebaseAuth.instance.currentUser!.getIdToken();
      setState(() {
        _idToken = token;
      });
    });
  }

  _onSendPressed(chatUITypes.PartialText message) async {
    final chatMessageId = const Uuid().v4();
    setState(() {
      _chatMessages = [
        chatUITypes.TextMessage(
            id: chatMessageId,
            text: message.text,
            author: _userMap[_loggedInUser.id]!,
            createdAt: DateTime.now().millisecondsSinceEpoch,
            status: chatUITypes.Status.sending),
        ..._chatMessages
      ];
    });

    final result = await _graphqlClient
        .mutate$sendChatMessageText(Options$Mutation$sendChatMessageText(
            variables: Variables$Mutation$sendChatMessageText(
      input: Input$SendChatMessageTextInput(
        id: chatMessageId,
        chatRoomId: widget.chatRoomId,
        text: message.text,
      ),
    )));
    if (result.hasException) {
      print(result.exception);
      showToast("メッセージの送信に失敗しました", ToastLevel.error);
      return;
    }

    setState(() {
      final index =
          _chatMessages.indexWhere((element) => element.id == chatMessageId);
      _chatMessages[index] = _chatMessages[index].copyWith(
        createdAt: result.parsedData!.sendChatMessageText.chatMessage.createdAt
            .millisecondsSinceEpoch,
        status: null,
      );
    });
  }

  void _onAttachmentPressed() async {
    final pickedImages = await ImagePicker().pickMultiImage(
      imageQuality: 100,
      maxWidth: 1440,
    );
    if (pickedImages.isEmpty) {
      return;
    }

    setState(() {
      _isAttachmentUploading = true;
    });

    for (var pickedImage in pickedImages) {
      final chatMessageId = const Uuid().v4();
      setState(() {
        _chatMessages = [
          chatUITypes.ImageMessage(
              id: chatMessageId,
              name: chatMessageId,
              uri: pickedImage.path,
              size: 20,
              author: _userMap[_loggedInUser.id]!,
              createdAt: DateTime.now().millisecondsSinceEpoch,
              status: chatUITypes.Status.sending),
          ..._chatMessages
        ];
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
          id: chatMessageId,
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
        continue;
      }

      final chatMessage = result.parsedData!.sendChatMessageImage.chatMessage;
      setState(() {
        final index =
            _chatMessages.indexWhere((element) => element.id == chatMessageId);
        _chatMessages[index] =
            (_chatMessages[index] as chatUITypes.ImageMessage).copyWith(
          // TODO: Fix not to parse json
          uri:
              Mutation$sendChatMessageImage$sendChatMessageImage$chatMessage$body$$ChatMessageBodyImage
                      .fromJson(chatMessage.body.toJson())
                  .url,
          createdAt: chatMessage.createdAt.millisecondsSinceEpoch,
          status: null,
        );
      });
    }
  }

  void _onPreviewDataFetched(
    chatUITypes.TextMessage message,
    chatUITypes.PreviewData previewData,
  ) {
    final index =
        _chatMessages.indexWhere((element) => element.id == message.id);
    final updatedMessage =
        (_chatMessages[index] as chatUITypes.TextMessage).copyWith(
      previewData: previewData,
    );

    setState(() {
      _chatMessages[index] = updatedMessage;
      _chatMessagePreviewMap[updatedMessage.id] = previewData;
    });
  }

  void _onAvatarTap(chatUITypes.User user) {
    UserProfileRoute(user.id).push(context);
  }

  @override
  Widget build(BuildContext context) {
    final chatRoomStream = useMemoized(() => FirebaseFirestore.instance
        .collection(firestoreChatRoomsCollectionPath)
        .doc(widget.chatRoomId)
        .snapshots());
    final chatRoomSnapshot = useStream(chatRoomStream);

    final chatMessagesStream = useMemoized(
        () => FirebaseFirestore.instance
            .collection(firestoreChatRoomsCollectionPath)
            .doc(widget.chatRoomId)
            .collection(firestoreChatMessagesCollectionPath)
            .orderBy("createdAt", descending: true)
            .limit(_limit)
            .snapshots(),
        [_limit]);
    final chatMessageSnapshot = useStream(chatMessagesStream);

    useEffect(() {
      if (chatRoomSnapshot.data == null) {
        return;
      }
      final participants =
          chatRoomSnapshot.data!.get("participants") as List<dynamic>;
      for (var participant in participants) {
        final userId = participant["userId"] as String;
        final lastReadAt = DateTime.parse(participant["lastReadAt"] as String)
            .millisecondsSinceEpoch;
        final user = _userMap[userId];
        if (user != null) {
          setState(() {
            _userMap[userId] = user.copyWith(lastSeen: lastReadAt);
          });
        } else {
          // Fetch hewly added user
          _graphqlClient
              .query$getUserForChat(Options$Query$getUserForChat(
                  variables: Variables$Query$getUserForChat(id: userId)))
              .then((result) {
            if (result.parsedData != null) {
              setState(() {
                _userMap[userId] = chatUITypes.User(
                  id: userId,
                  firstName: result.parsedData!.user.nickname,
                  imageUrl: result.parsedData!.user.avatarUrl,
                  lastSeen: lastReadAt,
                );
              });
            }
          });
        }
      }
      return null;
    }, [chatRoomSnapshot.data]);

    useEffect(() {
      if (chatRoomSnapshot.data == null ||
          chatMessageSnapshot.data == null ||
          chatMessageSnapshot.data!.docs.isEmpty) {
        return;
      }
      final chatMessages = chatMessageSnapshot.data!.docs.map((chatMessage) {
        final messageUser = _userMap[chatMessage.get("userId") as String]!;
        final messageCreatedAt =
            DateTime.parse(chatMessage.get("createdAt") as String)
                .millisecondsSinceEpoch;
        var readCount = 0;
        _userMap.forEach((_, user) {
          if (user.id != messageUser.id &&
              user.lastSeen != null &&
              user.lastSeen! >= messageCreatedAt) {
            readCount += 1;
          }
        });
        final isRead = readCount > 0;

        switch (chatMessage.get("kind")) {
          case "IMAGE":
            return chatUITypes.ImageMessage(
              id: chatMessage.id,
              name: chatMessage.id,
              uri: chatMessage.get("body")["url"] as String,
              size: 20,
              author: messageUser,
              createdAt: messageCreatedAt,
              status: isRead ? chatUITypes.Status.seen : null,
              showStatus: isRead,
            );
          default:
            // case "TEXT":
            final previewData = _chatMessagePreviewMap[chatMessage.get("id")];
            return chatUITypes.TextMessage(
              id: chatMessage.id,
              text: chatMessage.get("body")["text"] as String,
              author: messageUser,
              previewData: previewData,
              createdAt: messageCreatedAt,
              status: isRead ? chatUITypes.Status.seen : null,
              showStatus: isRead,
            );
        }
      }).toList();

      setState(() {
        _chatMessages = chatMessages;
      });

      _graphqlClient.mutate$updateChatLastReadAt(
          Options$Mutation$updateChatLastReadAt(
              variables: Variables$Mutation$updateChatLastReadAt(
                  input: Input$UpdateChatLastReadAtInput(
                      chatRoomId: widget.chatRoomId,
                      lastReadAt: DateTime.fromMillisecondsSinceEpoch(
                              chatMessages[0].createdAt!)
                          .toUtc()))));

      return null;
    }, [chatRoomSnapshot.data, chatMessageSnapshot.data]);

    return chatUI.Chat(
      showUserAvatars: true,
      user: chatUITypes.User(
        id: _loggedInUser.id,
        firstName: _loggedInUser.nickname,
        imageUrl: _loggedInUser.avatarUrl,
      ),
      messages: _chatMessages,
      onAttachmentPressed: _onAttachmentPressed,
      isAttachmentUploading: _isAttachmentUploading,
      imageHeaders: {
        "Authorization": "Bearer $_idToken",
      },
      onSendPressed: _onSendPressed,
      onEndReached: () async {
        setState(() {
          _limit += _limitIncrement;
        });
        return;
      },
      onPreviewDataFetched: _onPreviewDataFetched,
      onAvatarTap: _onAvatarTap,
      l10n: const ChatL10nJa(),
    );
  }
}
