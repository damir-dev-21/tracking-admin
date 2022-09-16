import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tracking_admin_panel/providers/placeProvider.dart';
import 'package:tracking_admin_panel/providers/userProvider.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    final UserProvider userProvider = Provider.of<UserProvider>(context);
    final PlaceProvider placeProvider = Provider.of<PlaceProvider>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Users panel"),
        actions: [
          IconButton(
              onPressed: () async {
                await userProvider.getUsers();
                await placeProvider.getPlaces();
              },
              icon: const Icon(Icons.sync_outlined))
        ],
      ),
      drawer: Drawer(),
      body: SafeArea(
          child: Container(
        child: Center(
          child: Text("Users screen"),
        ),
      )),
    );
  }
}
