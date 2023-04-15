import 'dart:async';

import 'package:custom_marker/marker_icon.dart';
import 'package:flutter/material.dart' hide ModalBottomSheetRoute;
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:invy/router.dart';
import 'package:invy/screens/invitation/invitation_form_screen.dart';
import 'package:invy/screens/map_screen.graphql.dart';
import 'package:invy/services/graphql_client.dart';
import 'package:invy/state/location.dart';

class MapScreen extends HookConsumerWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final graphqlClient = ref.read(graphqlClientProvider);
    final mapScreenViewerQuery = useMemoized(() => graphqlClient
            .watchQuery$mapScreenViewer(WatchOptions$Query$mapScreenViewer(
          eagerlyFetchResults: true,
        )));
    final mapScreenViewer = useStream(mapScreenViewerQuery.stream);
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

    if (mapScreenViewer.data?.parsedData?.viewer == null ||
        currentLocation == null) {
      return const SizedBox();
    }

    final generateMarkers = useMemoized(() async {
      final futureMarkers = mapScreenViewer
          .data!.parsedData!.viewer.friends.edges
          .where((e) => e.node.fuzzyCoordinate != null)
          .map((e) async {
        return Marker(
            markerId: MarkerId(e.node.id),
            position: LatLng(e.node.fuzzyCoordinate!.latitude,
                e.node.fuzzyCoordinate!.longitude),
            icon: await MarkerIcon.downloadResizePictureCircle(
              e.node.avatarUrl,
              size: 100,
              addBorder: true,
              borderColor: Colors.white,
              borderSize: 10,
            ),
            onTap: () {
              UserProfileRoute(e.node.id).push(context);
            });
      });
      return Future.wait(futureMarkers);
    }, [mapScreenViewer.data!.parsedData!.viewer.friends]);
    final friendMarkers =
        useFuture(generateMarkers).data?.toSet() ?? <Marker>{};

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Stack(children: [
              GoogleMap(
                initialCameraPosition:
                    CameraPosition(target: currentLocation, zoom: 11.8),
                onMapCreated: (GoogleMapController controller) {
                  googleMapController.value.complete(controller);
                },
                markers: friendMarkers,
                mapType: MapType.normal,
                myLocationEnabled: true,
                myLocationButtonEnabled: true,
                mapToolbarEnabled: false,
                buildingsEnabled: true,
              ),
              SafeArea(
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Text("友達の位置はあいまいに表示されています",
                        style: TextStyle(color: Colors.white)),
                  ),
                ),
              ),
            ]),
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
