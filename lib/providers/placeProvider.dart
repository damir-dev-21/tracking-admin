import 'package:firedart/firedart.dart';
import 'package:flutter/material.dart';
import 'package:tracking_admin_panel/models/Place/Place.dart';

class PlaceProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> places = [];
  bool isLoad = false;
  Future<void> getPlaces() async {
    try {
      isLoad = true;
      notifyListeners();
      CollectionReference placesCollection =
          Firestore.instance.collection('places');
      final places_fire = await placesCollection.get();
      var num = 0;
      places.clear();
      places_fire.forEach((element) {
        num = num + 1;
        final Map<String, dynamic> place = {
          "number": num,
          "user": element.map['user'],
          "name": element.map['name'],
          "date": element.map['date'],
          "status": false,
        };

        places.add(place);
        print(place);
        notifyListeners();
      });

      isLoad = false;
      notifyListeners();
    } catch (e) {
      isLoad = false;
      notifyListeners();
      print(e);
    }
  }
}
