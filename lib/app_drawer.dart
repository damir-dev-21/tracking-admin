import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                child: Column(
                  children: [
                    ListTile(
                      onTap: () {
                        // context.router.push(const OrdersRoute());
                      },
                      title: Text("Главная"),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ListTile(
                      onTap: () {
                        // context.router.push(const ());
                      },
                      title: const Text("Сотрудники"),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
