


import 'dart:async';

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class TrackingController extends GetxController
{

  StreamSubscription<Position>? positionStream;

  getCurrentLocation()
  {
    Geolocator.getPositionStream().listen((event) {
      print(event.latitude);
      print(event.longitude);
    });
  }
}