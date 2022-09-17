import 'package:firedart/firedart.dart';
import 'package:flutter/material.dart';
import 'package:tracking_admin_panel/models/User/User.dart';

class UserProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> users = [];
  bool isLoad = true;

  Future<void> getUsers() async {
    try {
      isLoad = true;
      notifyListeners();
      CollectionReference placesCollection =
          Firestore.instance.collection('users');
      final places_fire = await placesCollection.get();
      var num = 0;
      users.clear();
      places_fire.forEach((element) {
        num = num + 1;
        final Map<String, dynamic> place = {
          "number": num,
          "name": element.map['name'],
          "surname": element.map['surname'],
          "post": element.map['post'],
          "imei": element.map['id'],
        };

        users.add(place);
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
