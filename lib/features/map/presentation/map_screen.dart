import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

import '../../../../core/helper/location_helper.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
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
    Marker? currentLocationMarker;

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
      body: FlutterMap(
        mapController: _mapController,
        options: const MapOptions(
          initialCenter: LatLng(37.7570, -122.4194),
          initialZoom: 15.0,
        ),
        children: [
          TileLayer(
            urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
          ),
          // PolylineLayer(
          //   polylines: [
          //     Polyline(
          //       points: staticPoints,
          //       color: Colors.orange,
          //       strokeWidth: 4,
          //     ),
          //   ],
          // ),
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
    );
  }
}
