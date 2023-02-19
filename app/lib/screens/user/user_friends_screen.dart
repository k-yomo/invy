import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:invy/router.dart';
import 'package:invy/screens/user/user_friends_screen.graphql.dart';
import 'package:invy/services/graphql_client.dart';
import 'package:invy/widgets/app_bar_leading.dart';
import 'package:invy/widgets/friend_list_item.dart';

class UserFriendsScreen extends HookConsumerWidget {
  const UserFriendsScreen({super.key, required this.userId, this.userNickname});

  final String userId;
  final String? userNickname;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
