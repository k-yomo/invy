import 'package:bump/graphql/friend_request_screen.graphql.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../components/app_bar_leading.dart';
import '../state/auth.dart';

class FriendRequestScreen extends HookConsumerWidget {
  const FriendRequestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final graphqlClient = GraphQLProvider.of(context).value;
    final searchUserQueryResult =
        useState<QueryResult<Query$searchUser>?>(null);

    return Scaffold(
      appBar: AppBar(
        leading: AppBarLeading(),
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
            margin: EdgeInsets.only(top: 30),
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
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
              : SizedBox(),
        ],
      ),
    );
  }
}

class _FriendSearchResult extends HookConsumerWidget {
  const _FriendSearchResult(this.searchResult, {Key? key}) : super(key: key);

  final QueryResult<Query$searchUser> searchResult;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.read(loggedInUserProvider)!;
    final requestFriendshipMutation = useMutation$requestFriendship();
    if (searchResult.parsedData == null ||
        searchResult.parsedData!.userByScreenId.id == user.id) {
      return Container(
        margin: EdgeInsets.symmetric(vertical: 15),
        child: Text("ユーザーが見つかりませんでした。"),
      );
    }
    final foundUser = searchResult.parsedData!.userByScreenId;
    return Container(
      margin: EdgeInsets.all(15),
      child: Column(
        children: [
          Divider(height: 0, thickness: 1, color: Colors.grey.shade200),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 15),
            child: Row(children: [
              CircleAvatar(
                backgroundImage: NetworkImage(foundUser.avatarUrl),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(left: 10, right: 5),
                  child: Text(
                    foundUser.nickname,
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              foundUser.isFriend
                  ? Icon(Icons.check)
                  : OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        minimumSize: Size.zero,
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 12),
                      ),
                      onPressed: () async {
                        final result = await requestFriendshipMutation
                            .runMutation(Variables$Mutation$requestFriendship(
                                userId: foundUser.id))
                            .networkResult;
                      },
                      child: Text("申請する",
                          style: TextStyle(color: Colors.black, fontSize: 16)),
                    ),
            ]),
          ),
        ],
      ),
    );
  }
}
