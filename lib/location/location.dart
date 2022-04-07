import 'dart:async';

import 'package:findatoilet/location/location_service.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class Location extends StatefulWidget {

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {

  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  // adding a marker object
  static final Marker _kGooglePlexMarker = Marker(
    markerId: MarkerId("_kGooglePlex"),
    infoWindow: InfoWindow(title: "Your Location"),
    icon: BitmapDescriptor.defaultMarker,
    position: LatLng(37.42796133580664, -122.085749655962),
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  static final Marker _kToiletMarker = Marker(
    markerId: MarkerId("_kToilet"),
    infoWindow: InfoWindow(title: "Toilet Location"),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
    position: LatLng(37.43296265331129, -122.08832357078792),
  );

  // creating a polyline to link the two markers
  static final Polyline _polyline = Polyline(polylineId: PolylineId("_polyline"),
    // create a list of points where the line o fthe Polyline would pass
    points: [
      LatLng(37.43296265331129, -122.08832357078792),
      LatLng(37.42796133580664, -122.085749655962),
    ],
    width: 3,
  );

  // creating a polygon object with Polygon
  static final Polygon _polygon = Polygon(polygonId: PolygonId("_polygon"),
    points: [
      LatLng(37.43296265331129, -122.08832357078792),
      LatLng(37.42796133580664, -122.085749655962),
      LatLng(37.438, -122.092),
      LatLng(37.450, -122.089)
    ],
    strokeWidth: 3,
    fillColor: Colors.transparent,
  );

  // creating a controller for the form field
  TextEditingController _searchcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.location_on),
            SizedBox(
              width: 20,
            ),
            Text("Find a Toilet")
          ],
        ),
      ),
      body: Column(
        children: [
          Row(children: [
            Expanded(
                child: TextFormField(
                  controller: _searchcontroller,
                  textCapitalization: TextCapitalization.words,
                  decoration: InputDecoration(hintText: "Search Toilet"),
                  onChanged: (value) {
                    print(value);
                  },)),
            IconButton(
                onPressed: () async{
                  var city = await LocationService().getPlace(_searchcontroller.text);
                  _goToTheCity(city);
                },
                icon: Icon(Icons.search))
          ],),
          Expanded(
            child: GoogleMap(
              mapType: MapType.normal,
              // polygons: {
              //   _polygon,
              // },
              // polylines: {
              //   _polyline,
              // },
              markers: {_kGooglePlexMarker},
              initialCameraPosition: _kGooglePlex,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheLake,
        label: const Text('Find Location'),
        icon: const Icon(Icons.location_on_outlined),
      ),
    );
  }

  // to change the camera to the city selected

  Future<void> _goToTheCity(Map<String, dynamic> place) async {
    final double lat = place["geometry"]["location"]["lat"];
    final double lng = place["geometry"]["location"]["lng"];
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(target: LatLng(lat, lng), zoom: 12),
    ));
  }

  // this allows the floating action button to take you to the lake
  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}
