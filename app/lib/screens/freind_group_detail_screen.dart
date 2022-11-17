import 'package:bump/components/friend_list.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../graphql/friend_group_detail_screen.graphql.dart';

class FriendGroupDetailScreen extends HookConsumerWidget {
  final String friendGroupId;

  const FriendGroupDetailScreen({Key? key, required this.friendGroupId})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewerQueryResult = useQuery$friendGroupDetailScreenViewer(
            Options$Query$friendGroupDetailScreenViewer(
                variables: Variables$Query$friendGroupDetailScreenViewer(
                    friendGroupId: friendGroupId)))
        .result;

    final viewer = viewerQueryResult.parsedData?.viewer;
    print(viewerQueryResult.exception);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          viewer?.friendGroup.name ?? '',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        shape:
            Border(bottom: BorderSide(color: Colors.grey.shade200, width: 1)),
      ),
      body: Column(
        children: [FriendList(friends: viewer?.friendGroup.friendUsers ?? [])],
      ),
    );
  }
}
