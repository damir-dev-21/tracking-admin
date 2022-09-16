import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:tracking_admin_panel/screens/LoginScreen.dart';
import 'package:tracking_admin_panel/screens/MainScreen.dart';

part 'router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: "Screen,Route",
  routes: <AutoRoute>[
    AutoRoute(page: LoginScreen, initial: true),
    AutoRoute(page: MainScreen),
  ],
)
class AppRouter extends _$AppRouter {}
