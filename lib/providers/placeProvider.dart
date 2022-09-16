import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tracking_admin_panel/models/Place/Place.dart';

class PlaceProvider extends ChangeNotifier {
  final List<Place> places = [];

  Future<void> getPlaces() async {
    try {
      CollectionReference places_firebase =
          FirebaseFirestore.instance.collection('places');
      await places_firebase.get().then((value) => {
            value.docs.forEach((element) {
              places.add(Place(element["userId"], element["name"],
                  element["lat"], element["lon"], element["date"], false));
              notifyListeners();
            })
          });
    } catch (e) {
      print(e);
    }
  }
}
