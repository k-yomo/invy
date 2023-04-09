import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:invy/widgets/friend_group_fragment.graphql.dart';
import 'package:invy/widgets/friend_list_item_fragment.graphql.dart';

final invitationLocationProvider = StateProvider<LatLng?>((ref) {
  return null;
});

final invitationSelectedFriendGroupsProvider =
    StateProvider<List<Fragment$friendGroupListItemFragment>>((ref) {
  return [];
});

final invitationSelectedFriendsProvider =
    StateProvider<List<Fragment$friendListItemFragment>>((ref) {
  return [];
});
