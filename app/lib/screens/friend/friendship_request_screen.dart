import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:invy/screens/friend/friend_request_screen.graphql.dart';
import 'package:invy/services/graphql_client.dart';
import 'package:invy/widgets/dynamic_links_manager.dart';

import '../../widgets/app_bar_leading.dart';
import '../../state/auth.dart';

class FriendshipRequestRoute extends GoRouteData {
  const FriendshipRequestRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const DynamicLinksManager(child: FriendshipRequestScreen());
}

class FriendshipRequestScreen extends HookConsumerWidget {
  const FriendshipRequestScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final graphqlClient = ref.read(graphqlClientProvider);
    final searchUserQueryResult =
        useState<QueryResult<Query$searchUser>?>(null);

    return Scaffold(
      appBar: AppBar(
        leading: const AppBarLeading(),
        title: const Text(
          '友だち追加',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        shape:
            Border(bottom: BorderSide(color: Colors.grey.shade200, width: 1)),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 30),
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: TextField(
                textInputAction: TextInputAction.search,
                cursorColor: Colors.black,
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 1,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 2,
                    ),
                  ),
                  hintText: '友だちのユーザーIDで検索',
                ),
                autofocus: true,
                onChanged: (_) {
                  searchUserQueryResult.value = null;
                },
                onSubmitted: (text) async {
                  final result = await graphqlClient.query$searchUser(
                      Options$Query$searchUser(
                          fetchPolicy: FetchPolicy.networkOnly,
                          variables:
                              Variables$Query$searchUser(userScreenId: text)));
                  searchUserQueryResult.value = result;
                },
              ),
            ),
          ),
          searchUserQueryResult.value != null
              ? _FriendSearchResult(searchUserQueryResult.value!)
              : const SizedBox(),
        ],
      ),
    );
  }
}

class _FriendSearchResult extends HookConsumerWidget {
  const _FriendSearchResult(this.searchResult);

  final QueryResult<Query$searchUser> searchResult;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.read(loggedInUserProvider)!;
    final graphqlClient = ref.read(graphqlClientProvider);
    final foundUser = useState<Query$searchUser$userByScreenId?>(
        searchResult.parsedData?.userByScreenId);

    onPressedRequestFriendship(String userId) async {
      final result = await graphqlClient.mutate$requestFriendship(
          Options$Mutation$requestFriendship(
              variables: Variables$Mutation$requestFriendship(userId: userId)));
      if (result.hasException) {
        // TODO: show error
        return;
      }
      foundUser.value = foundUser.value!.copyWith(isRequestingFriendship: true);
      foundUser.notifyListeners();
    }

    if (foundUser.value == null || foundUser.value?.id == user.id) {
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 15),
        child: const Text("ユーザーが見つかりませんでした。"),
      );
    }

    return Container(
      margin: const EdgeInsets.all(15),
      child: Column(
        children: [
          Divider(height: 0, thickness: 1, color: Colors.grey.shade200),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 15),
            child: Row(children: [
              CircleAvatar(
                backgroundColor: Colors.transparent,
                backgroundImage:
                    CachedNetworkImageProvider(foundUser.value!.avatarUrl),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(left: 10, right: 5),
                  child: Text(
                    foundUser.value!.nickname,
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              () {
                if (foundUser.value!.isFriend) {
                  return const Icon(Icons.check);
                } else if (foundUser.value!.isRequestingFriendship) {
                  return const Text("リクエスト済み",
                      style: TextStyle(fontWeight: FontWeight.bold));
                } else {
                  return OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      minimumSize: Size.zero,
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 12),
                    ),
                    onPressed: () async => {
                      onPressedRequestFriendship(foundUser.value!.id),
                    },
                    child: const Text("申請する",
                        style: TextStyle(color: Colors.black, fontSize: 16)),
                  );
                }
              }()
            ]),
          ),
        ],
      ),
    );
  }
}
