import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rental/product/productController/map_controller.dart';
import 'package:provider/provider.dart';



class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {

  // MapController map = MapController();

  // @override
  // void initState() {
  //   map.getUserLocation();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Consumer<MapController>(
      builder: (context, map, child) {
        return Scaffold(
          body: Column(
            children: [
              SafeArea(
                top: true,
                child: TextField(
                  onSubmitted: (x) {
                    context.read<MapController>().searchOnMap(x);
                    // map.searchOnMap(x);
                  },
                ),
              ),
              Flexible(
                child: GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: context.watch<MapController>().locationValue,
                    zoom: 12
                  ),
                  mapType: MapType.normal,
                  myLocationEnabled: true,
                  myLocationButtonEnabled: true,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}