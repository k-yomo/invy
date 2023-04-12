import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:invy/widgets/friend_group_fragment.graphql.dart';
import 'package:invy/widgets/friend_list_item_fragment.graphql.dart';

class InvitationFormState {
  String locationName;
  LatLng? location;
  List<Fragment$friendGroupListItemFragment> selectedFriendGroups;
  List<Fragment$friendListItemFragment> selectedFriends;

  InvitationFormState({
    required this.locationName,
    required this.location,
    required this.selectedFriendGroups,
    required this.selectedFriends,
  });

  InvitationFormState copyWith({
    String? locationName,
    LatLng? location,
    List<Fragment$friendGroupListItemFragment>? selectedFriendGroups,
    List<Fragment$friendListItemFragment>? selectedFriends,
  }) =>
      InvitationFormState(
        locationName: locationName ?? this.locationName,
        location: location ?? this.location,
        selectedFriendGroups: selectedFriendGroups ?? this.selectedFriendGroups,
        selectedFriends: selectedFriends ?? this.selectedFriends,
      );
}

final defaultInvitationFormState = InvitationFormState(
  locationName: "未定",
  location: null,
  selectedFriendGroups: [],
  selectedFriends: [],
);

class InvitationFormStateNotifier extends StateNotifier<InvitationFormState> {
  InvitationFormStateNotifier()
      : super(defaultInvitationFormState);

  void set(InvitationFormState formState) => state = formState;

  void reset() => state = defaultInvitationFormState;
}


final invitationFormProvider = StateNotifierProvider<InvitationFormStateNotifier, InvitationFormState>((ref) {
  return InvitationFormStateNotifier();
});

final invitationLocationNameProvider = StateProvider<String>((ref) {
  return "未定";
});

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
