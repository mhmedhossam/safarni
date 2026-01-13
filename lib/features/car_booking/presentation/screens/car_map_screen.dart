import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

import '../../../../core/helper/location_helper.dart';
import '../../../../generated/assets.dart';
import '../widgets/car_map_widgets/map_card_detail.dart';

class CarMapScreen extends StatefulWidget {
  const CarMapScreen({super.key});

  @override
  State<CarMapScreen> createState() => _CarMapScreenState();
}

class _CarMapScreenState extends State<CarMapScreen> {
  final MapController _mapController = MapController();
  Position? position;
  List<Marker> markers = [];

  final List<LatLng> staticPoints = [
    const LatLng(37.7590, -122.4194),
    const LatLng(37.7590, -122.4214),
    const LatLng(37.7540, -122.4214),
    const LatLng(37.7540, -122.4194),
  ];

  Future<void> getMyCurrentLocation() async {
    await LocationHelper.determinePosition();
    position = await Geolocator.getCurrentPosition();
    // Marker? currentLocationMarker;

    setState(() {
      _mapController.move(
        LatLng(position!.latitude, position!.longitude),
        15.0,
      );

      markers.clear();
      markers.add(
        Marker(
          point: LatLng(position!.latitude, position!.longitude),
          width: 50.0,
          height: 50.0,
          child: const Stack(
            alignment: Alignment.center,
            children: [
              CircleAvatar(radius: 12, backgroundColor: Colors.orange),
              Icon(Icons.person_pin_circle, color: Colors.white, size: 25),
            ],
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FlutterMap(
            mapController: _mapController,
            options: const MapOptions(
              initialCenter: LatLng(37.7570, -122.4194),
              initialZoom: 15.0,
            ),
            children: [
              TileLayer(
                urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
              ),
              PolylineLayer(
                polylines: [
                  Polyline(
                    points: staticPoints,
                    color: Colors.orange,
                    strokeWidth: 4,
                  ),
                ],
              ),
              MarkerLayer(
                markers: [
                  Marker(
                    point: staticPoints.first,
                    width: 40,
                    height: 40,
                    child: const Icon(
                      Icons.location_on,
                      color: Colors.orange,
                      size: 30,
                    ),
                  ),
                  ...markers,
                ],
              ),
            ],
          ),

          Positioned(
            top: 50,
            left: 20,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.black,
                  size: 18,
                ),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ),

          Positioned(
            top: 50,
            right: 20,
            child: CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage(Assets.imagesUserAvatar),
            ),
          ),

          Positioned(
            top: 120,
            right: 20,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: IconButton(
                icon: const Icon(Icons.my_location, color: Colors.grey),
                onPressed: () {
                  getMyCurrentLocation();
                },
              ),
            ),
          ),

          Positioned(bottom: 20, left: 15, right: 15, child: MapCardDetail()),
        ],
      ),
    );
  }
}
