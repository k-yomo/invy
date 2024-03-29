import 'dart:async';

import 'package:flutter/material.dart' hide ModalBottomSheetRoute;
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:geocoding/geocoding.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_place/google_place.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:invy/router.dart';
import 'package:invy/screens/invitation/invitation_friend_select_screen.dart';
import 'package:invy/state/invitation.dart';
import 'package:invy/state/location.dart';
import 'package:invy/widgets/screen_wrapper.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../config/config.dart';

const locationUndecided = "未定";

class InvitationLocationSelectRoute extends GoRouteData {
  const InvitationLocationSelectRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const ScreenWrapper(child: InvitationLocationSelectScreen());
}

class InvitationLocationSelectScreen extends HookConsumerWidget {
  const InvitationLocationSelectScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final googleMapController = useState(Completer<GoogleMapController>());
    final currentLocation = ref.watch(currentPinLocationProvider);
    final lastUpdatedLocation = useState<LatLng?>(null);
    final currentPinLocationNotifier =
        ref.read(currentPinLocationProvider.notifier);
    final invitationLocation = ref.watch(invitationFormProvider).location;
    final locationNameNotifier =
        ref.read(invitationLocationNameProvider.notifier);

    updateLocationName(LatLng location) async {
      final placeMarks =
          await placemarkFromCoordinates(location.latitude, location.longitude);
      if (placeMarks.isEmpty) {
        locationNameNotifier.state = "";
      } else if (placeMarks.first.locality != null &&
          placeMarks.first.street != null) {
        locationNameNotifier.state =
            placeMarks.first.locality! + placeMarks.first.street!;
      } else if (placeMarks.first.name != null) {
        locationNameNotifier.state = placeMarks.first.name!;
      }
    }

    useEffect(() {
      getCurrentLocation().then((location) async {
        if (location == null) {
          // defaults to Shibuya if location is not enabled
          currentPinLocationNotifier.state ??=
              const LatLng(35.6585663, 139.6980641);
          return null;
        }
        currentPinLocationNotifier.state ??= location;
        await updateLocationName(location);
        if (currentLocation == null) {
          googleMapController.value.future.then((controller) {
            controller.animateCamera(CameraUpdate.newCameraPosition(
                CameraPosition(target: location, zoom: 16)));
          });
        }
      });
      return null;
    }, []);

    useEffect(() {
      if (invitationLocation != null) {
        googleMapController.value.future.then((controller) {
          controller.animateCamera(CameraUpdate.newCameraPosition(
              CameraPosition(target: invitationLocation, zoom: 16)));
        });
      }
      return null;
    }, [invitationLocation]);

    if (currentLocation == null) {
      return const SizedBox();
    }

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Stack(
              fit: StackFit.expand,
              alignment: Alignment.center,
              children: [
                GoogleMap(
                  initialCameraPosition:
                      CameraPosition(target: currentLocation, zoom: 16),
                  onMapCreated: (GoogleMapController controller) {
                    googleMapController.value.complete(controller);
                  },
                  onCameraMove: (position) {
                    currentPinLocationNotifier.state = position.target;
                  },
                  onCameraIdle: () async {
                    final currentLat = currentLocation.latitude;
                    final currentLng = currentLocation.longitude;
                    if ((lastUpdatedLocation.value == null ||
                            currentLat.toStringAsFixed(4) !=
                                lastUpdatedLocation.value!.latitude
                                    .toStringAsFixed(4) ||
                            currentLng.toStringAsFixed(4) !=
                                lastUpdatedLocation.value!.longitude
                                    .toStringAsFixed(4)) &&
                        (invitationLocation == null ||
                            currentLat.toStringAsFixed(4) !=
                                invitationLocation.latitude
                                    .toStringAsFixed(4) ||
                            currentLng.toStringAsFixed(4) !=
                                invitationLocation.longitude
                                    .toStringAsFixed(4))) {
                      lastUpdatedLocation.value = currentLocation;
                      await updateLocationName(currentLocation);
                    }
                  },
                  mapType: MapType.normal,
                  myLocationEnabled: true,
                  myLocationButtonEnabled: true,
                  mapToolbarEnabled: false,
                  buildingsEnabled: true,
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 40),
                  child: const Icon(Icons.fmd_good, size: 40),
                )
              ],
            ),
          ),
          const LocationCard(),
          // buildFloatingSearchBar(),
        ],
      ),
    );
  }
}

class LocationCard extends HookConsumerWidget {
  const LocationCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentPinLocation = ref.watch(currentPinLocationProvider);
    final locationName = ref.watch(invitationLocationNameProvider);
    final invitationFormNotifier = ref.read(invitationFormProvider.notifier);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 5,
                blurRadius: 5,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Expanded(
                    child: Text("開催地はどこですか？",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  TextButton(
                    onPressed: () {
                      invitationFormNotifier.set(invitationFormNotifier
                          .get()
                          .copyWith(location: null, locationName: "未定"));
                    },
                    style: TextButton.styleFrom(
                        padding: const EdgeInsets.only(right: 25)),
                    child: const Text(locationUndecided,
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold)),
                  )
                ],
              ),
              const Gap(10),
              TextButton(
                onPressed: () {
                  showMaterialModalBottomSheet(
                    context: context,
                    duration: const Duration(milliseconds: 300),
                    shape: const RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(20.0)),
                    ),
                    builder: (BuildContext context) {
                      return const LocationSearchModal();
                    },
                  );
                },
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    backgroundColor: Colors.grey.shade100,
                    foregroundColor: Colors.black),
                child: Row(
                  children: [
                    const Icon(Icons.fmd_good),
                    Expanded(child: Text(locationName ?? "")),
                    const Text("検索"),
                    const Icon(Icons.chevron_right, size: 15),
                  ],
                ),
              ),
              const Gap(10),
              Row(
                children: [
                  Expanded(
                    child: TextButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          padding: const EdgeInsets.symmetric(vertical: 12)),
                      onPressed: () {
                        if (locationName != locationUndecided &&
                            currentPinLocation != null) {
                          invitationFormNotifier.set(invitationFormNotifier
                              .get()
                              .copyWith(
                                  location: LatLng(currentPinLocation.latitude,
                                      currentPinLocation.longitude)));
                        }
                        const InvitationFriendSelectRoute().go(context);
                      },
                      child: const Text(
                        '次へすすむ',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class LocationSearchModal extends HookConsumerWidget {
  const LocationSearchModal({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final googlePlace = GooglePlace(googleApiKey);
    final searchResult = useState<List<AutocompletePrediction>>([]);

    autoCompleteSearch(String value) async {
      final result = await googlePlace.autocomplete.get(
        value,
        region: "jp",
        language: "ja",
      );
      if (result != null && result.predictions != null) {
        searchResult.value = result.predictions!;
      }
    }

    onTapSearchResult(AutocompletePrediction place) async {
      final locations = await locationFromAddress(place.description.toString());
      if (locations.isNotEmpty) {
        ref.read(invitationLocationProvider.notifier).state = LatLng(
          locations.first.latitude,
          locations.first.longitude,
        );
        ref.read(invitationLocationNameProvider.notifier).state =
            place.structuredFormatting!.mainText!;
      }
      Navigator.of(context).pop();
    }

    return SizedBox(
      height: 700,
      child: Column(
        children: [
          Container(
              margin: const EdgeInsets.symmetric(vertical: 15),
              child: const Text("開催地を検索",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
          const Divider(height: 0),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            child: Column(
              children: [
                TextFormField(
                  cursorColor: Colors.grey.shade600,
                  cursorHeight: 16,
                  decoration: InputDecoration(
                    labelText: '場所・お店を入力',
                    labelStyle: TextStyle(color: Colors.grey.shade600),
                    filled: true,
                    fillColor: Colors.grey.shade200,
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                  ),
                  validator: (value) {
                    return null;
                  },
                  onChanged: (text) {
                    if (text.isNotEmpty) {
                      autoCompleteSearch(text);
                    }
                  },
                ),
                const Gap(10),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: searchResult.value.length,
                  itemBuilder: (context, index) {
                    final place = searchResult.value[index];
                    return Card(
                      color: Colors.grey.shade100,
                      shadowColor: Colors.transparent,
                      child: ListTile(
                        title: Text(place.structuredFormatting!.mainText!),
                        subtitle: Text(
                            place.structuredFormatting?.secondaryText ?? ""),
                        onTap: () => onTapSearchResult(place),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
