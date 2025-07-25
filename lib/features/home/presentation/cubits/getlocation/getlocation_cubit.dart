import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:geocoding/geocoding.dart';
part 'getlocation_state.dart';

class GetlocationCubit extends Cubit<GetlocationState> {
  GetlocationCubit() : super(GetlocationInitial());
  String location = 'Loading...';
  accessLocation() async {
    bool permission = await Geolocator.isLocationServiceEnabled();
    log('$permission');
    if (permission == false) {
      await Geolocator.requestPermission();
      getLocation();
    } else {
      getLocation();
    }
  }

  getLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition();

      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );
      location = '${placemarks[0].subAdministrativeArea}';
      emit(Getlocation());
    } on Exception catch (e) {
      // TODO
    }
  }
}
