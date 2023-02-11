import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart' hide ModalBottomSheetRoute;
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_place/google_place.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:invy/screens/invitation/invitation_friend_select_screen.dart';
import 'package:invy/state/location.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../config/config.dart';

class InvitationScreen extends HookConsumerWidget {
  const InvitationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final googleMapController = useState(Completer<GoogleMapController>());
    final currentLocation = useState<LatLng?>(null);
    final invitationLocation = ref.watch(invitationLocationProvider);
    final invitationLocationNotifier =
        ref.read(invitationLocationProvider.notifier);
    final locationNameNotifier = ref.read(locationNameProvider.notifier);

    useEffect(() {
      getCurrentLocation().then((location) async {
        if (location == null) {
          return null;
        }
        currentLocation.value ??= location;
        if (invitationLocation == null) {
          invitationLocationNotifier.state = location;

          final placeMarks = await placemarkFromCoordinates(
              location.latitude, location.longitude);
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

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Stack(
              fit: StackFit.expand,
              alignment: Alignment.center,
              children: [
                GoogleMap(
                  initialCameraPosition: CameraPosition(
                    // defaults to Shibuya
                    target: invitationLocation ??
                        const LatLng(35.6585663, 139.6980641),
                    zoom: invitationLocation != null ? 16 : 10,
                  ),
                  onMapCreated: (GoogleMapController controller) {
                    googleMapController.value.complete(controller);
                  },
                  onCameraMove: (position) {
                    currentLocation.value = position.target;
                  },
                  onCameraIdle: () async {
                    if (currentLocation.value == null) {
                      return;
                    }
                    final currentLat = currentLocation.value!.latitude;
                    final currentLng = currentLocation.value!.longitude;
                    if (invitationLocation == null ||
                        currentLat.toStringAsFixed(4) !=
                            invitationLocation.latitude.toStringAsFixed(4) ||
                        currentLng.toStringAsFixed(4) !=
                            invitationLocation.longitude.toStringAsFixed(4)) {
                      invitationLocationNotifier.state =
                          LatLng(currentLat, currentLng);
                      final placeMarks = await placemarkFromCoordinates(
                          currentLat, currentLng);
                      if (placeMarks.isEmpty) {
                        locationNameNotifier.state = "";
                      } else if (placeMarks.first.locality != null &&
                          placeMarks.first.street != null) {
                        locationNameNotifier.state =
                            placeMarks.first.locality! +
                                placeMarks.first.street!;
                      } else if (placeMarks.first.name != null) {
                        locationNameNotifier.state = placeMarks.first.name!;
                      }
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
    final locationName = ref.watch(locationNameProvider);
    final locationNameNotifier = ref.read(locationNameProvider.notifier);
    final invitationLocationNotifier =
        ref.read(invitationLocationProvider.notifier);

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
                      locationNameNotifier.state = "未定";
                      invitationLocationNotifier.state = null;
                    },
                    style: TextButton.styleFrom(
                        padding: const EdgeInsets.only(right: 25)),
                    child: const Text("未定",
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold)),
                  )
                ],
              ),
              const Gap(10),
              TextButton(
                onPressed: () {
                  final showModal = Platform.isIOS
                      ? showCupertinoModalBottomSheet
                      : showMaterialModalBottomSheet;
                  showModal(
                    shape: const RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(20.0)),
                    ),
                    context: context,
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
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              const InvitationFriendSelectScreen(),
                        ));
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
                        onTap: () async {
                          final locations = await locationFromAddress(
                              place.description.toString());
                          if (locations.isNotEmpty) {
                            ref
                                .read(invitationLocationProvider.notifier)
                                .state = LatLng(
                              locations.first.latitude,
                              locations.first.longitude,
                            );
                            ref.read(locationNameProvider.notifier).state =
                                place.structuredFormatting!.mainText!;
                          }
                          Navigator.of(context).pop();
                        },
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
