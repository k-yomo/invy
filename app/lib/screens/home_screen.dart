import 'dart:async';

import 'package:flutter/material.dart' hide ModalBottomSheetRoute;
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:invy/router.dart';
import 'package:invy/screens/invitation/invitation_form_screen.dart';
import 'package:invy/state/location.dart';

const locationUndecided = "未定";

class HomeScreenScreen extends HookConsumerWidget {
  const HomeScreenScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final googleMapController = useState(Completer<GoogleMapController>());
    final currentLocation = ref.watch(currentPinLocationProvider);

    useEffect(() {
      getCurrentLocation().then((location) async {
        if (location == null) {
          return null;
        }
        ref.read(currentPinLocationProvider.notifier).state = location;
        if (currentLocation == null) {
          googleMapController.value.future.then((controller) {
            controller.animateCamera(CameraUpdate.newCameraPosition(
                CameraPosition(target: location, zoom: 11.8)));
          });
        }
      });
      return null;
    }, []);

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
                      CameraPosition(target: currentLocation, zoom: 11.8),
                  onMapCreated: (GoogleMapController controller) {
                    googleMapController.value.complete(controller);
                  },
                  circles: {
                    Circle(
                      circleId: const CircleId('3km'),
                      center: currentLocation,
                      radius: 3000,
                      strokeColor: Colors.pink.withOpacity(0.8),
                      fillColor: Colors.pink.withOpacity(0.2),
                      strokeWidth: 2,
                    ),
                    Circle(
                      circleId: const CircleId('6km'),
                      center: currentLocation,
                      radius: 6000,
                      strokeColor: Colors.orange.withOpacity(0.8),
                      fillColor: Colors.orange.withOpacity(0.2),
                      strokeWidth: 2,
                    ),
                    Circle(
                      circleId: const CircleId('10km'),
                      center: currentLocation,
                      radius: 10000,
                      strokeColor: Colors.blue.withOpacity(0.8),
                      fillColor: Colors.blue.withOpacity(0.2),
                      strokeWidth: 2,
                    )
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
          Container(
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
              children: [
                TextButton(
                  onPressed: () {
                    const InvitationFormRoute().push(context);
                  },
                  style: TextButton.styleFrom(
                    minimumSize: const Size.fromHeight(0),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text(
                    'おさそいを待つ',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
