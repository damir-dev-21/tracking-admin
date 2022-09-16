import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tracking_admin_panel/models/User/User.dart';

class UserProvider extends ChangeNotifier {
  final List<User> users = [];

  Future<void> getUsers() async {
    try {
      CollectionReference users =
          FirebaseFirestore.instance.collection('users');
      await users.get().then((value) => {
            value.docs.forEach((element) {
              users.add(User(element['id'], element['name'], element['surname'],
                  element['post']));
              notifyListeners();
            })
          });
    } catch (e) {
      print(e);
    }
  }
}
