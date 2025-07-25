import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:resturant_app/features/shop/presentation/cubits/getfood/getfood_cubit.dart';
import 'package:resturant_app/features/shop/presentation/view/widgets/customClip.dart';
import 'package:resturant_app/features/shop/presentation/view/widgets/foodList.dart';

class Shoptabviewbody extends StatefulWidget {
  @override
  State<Shoptabviewbody> createState() => ShoptabviewbodyState();
}

class ShoptabviewbodyState extends State<Shoptabviewbody> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(37.7749, -122.4194); // موقع افتراضي

  final Set<Marker> _markers = {
    Marker(
      markerId: const MarkerId('restaurant1'),
      position: const LatLng(37.776, -122.42),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
    ),
    Marker(
      markerId: const MarkerId('restaurant2'),
      position: const LatLng(37.772, -122.415),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
    ),
    Marker(
      markerId: const MarkerId('restaurant3'),
      position: const LatLng(37.775, -122.417),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
    ),
    Marker(
      markerId: const MarkerId('restaurant4'),
      position: const LatLng(37.778, -122.418),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
    ),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: Get.size.height / 2 + 85,

            child: GoogleMap(
              onMapCreated: (controller) {
                mapController = controller;
              },
              initialCameraPosition: CameraPosition(
                target: _center,
                zoom: 15.0,
              ),
              markers: _markers,
              circles: {
                Circle(
                  circleId: const CircleId("radius"),
                  center: _center,
                  radius: 300,
                  fillColor: Colors.orange.withOpacity(0.2),
                  strokeColor: Colors.orange,
                  strokeWidth: 1,
                ),
              },
              myLocationEnabled: true,
            ),
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: FloatingActionButton(
              backgroundColor: Colors.white,
              onPressed: () {
                mapController.animateCamera(CameraUpdate.newLatLng(_center));
              },
              child: const Icon(Icons.my_location, color: Colors.black),
            ),
          ),
          Center(
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: const Icon(
                Icons.location_on_outlined,
                color: Colors.orange,
                size: 30,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: Get.size.height / 2 + 50),
            child: CurvedBottomSheet(),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              margin: EdgeInsets.only(top: 190),
              width: 80,
              height: 5,
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    spreadRadius: 0.9,
                    blurRadius: 4,
                    color: Colors.black26,
                    blurStyle: BlurStyle.outer,
                  ),
                ],
                color: Colors.white,
                borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(15),
                  right: Radius.circular(15),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: BlocProvider<GetfoodCubit>(
              create: (context) => GetfoodCubit(),
              child: const Foodlist(),
            ),
          ),
        ],
      ),
    );
  }
}
