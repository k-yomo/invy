import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:invy/router.dart';
import 'package:invy/screens/friend/friendship_request_screen.graphql.dart';
import 'package:invy/screens/user/user_friends_screen.graphql.dart';
import 'package:invy/services/graphql_client.dart';
import 'package:invy/state/auth.dart';
import 'package:invy/widgets/app_bar_leading.dart';
import 'package:invy/widgets/friend_list_item.dart';

class UserFriendsScreen extends HookConsumerWidget {
  const UserFriendsScreen({super.key, required this.userId, this.userNickname});

  final String userId;
  final String? userNickname;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loggedInUser = ref.read(loggedInUserProvider);
    final graphqlClient = ref.read(graphqlClientProvider);
    final userFriendsQuery = useMemoized(() =>
        graphqlClient.watchQuery$userFriendsScreenUserFriends(
            WatchOptions$Query$userFriendsScreenUserFriends(
          variables: Variables$Query$userFriendsScreenUserFriends(
            userId: userId,
          ),
          eagerlyFetchResults: true,
        )));
    final userFriendsEdges = useStream(userFriendsQuery.stream)
            .data
            ?.parsedData
            ?.userFriends
            .edges ??
        [];
    final isRequestingFriendshipMap = useState<Map<String, bool>>({});

    onPressedFriendRequest(String userId) async {
      final result = await graphqlClient
          .mutate$requestFriendship(Options$Mutation$requestFriendship(
        variables: Variables$Mutation$requestFriendship(userId: userId),
      ));
      if (result.parsedData?.requestFriendship != null) {
        isRequestingFriendshipMap.value = {
          ...isRequestingFriendshipMap.value,
          userId: true,
        };
      }
    }

    useEffect(() {
      if (userFriendsEdges.isNotEmpty) {
        isRequestingFriendshipMap.value = {
          for (var e in userFriendsEdges)
            e.node.id: e.node.isRequestingFriendship
        };
      }
      return null;
    }, [userFriendsEdges]);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: const AppBarLeading(),
        title: Text(
          "${userNickname != null ? "$userNicknameの" : ""}友達一覧",
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        shape:
            Border(bottom: BorderSide(color: Colors.grey.shade200, width: 1)),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: userFriendsEdges
              .map((e) => Column(
                    children: [
                      InkWell(
                        onTap: () {
                          UserProfileRoute(
                            userId,
                            $extra: e.node,
                          ).push(context);
                        },
                        child: FriendListItem(
                          key: Key(e.node.id),
                          friend: e.node,
                          rightWidget: (e.node.id != loggedInUser?.id)
                              ? TextButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.black,
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 20),
                                    minimumSize: Size.zero,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                  onPressed: (e.node.isFriend ||
                                          isRequestingFriendshipMap
                                              .value[e.node.id]!)
                                      ? null
                                      : () {
                                          onPressedFriendRequest(e.node.id);
                                        },
                                  child: Text(
                                    e.node.isFriend
                                        ? "友達"
                                        : isRequestingFriendshipMap
                                                .value[e.node.id]!
                                            ? "友達申請済み"
                                            : "友達申請",
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                )
                              : const SizedBox(),
                        ),
                      ),
                      Divider(
                          height: 0, thickness: 1, color: Colors.grey.shade200),
                    ],
                  ))
              .toList(),
        ),
      ),
    );
  }
}
