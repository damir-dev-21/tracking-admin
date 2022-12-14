// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    LoginRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const LoginScreen(),
      );
    },
    MainRoute.name: (routeData) {
      final args =
          routeData.argsAs<MainRouteArgs>(orElse: () => const MainRouteArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: MainScreen(key: args.key),
      );
    },
    UserRoute.name: (routeData) {
      final args =
          routeData.argsAs<UserRouteArgs>(orElse: () => const UserRouteArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: UserScreen(key: args.key),
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          LoginRoute.name,
          path: '/',
        ),
        RouteConfig(
          MainRoute.name,
          path: '/main-screen',
        ),
        RouteConfig(
          UserRoute.name,
          path: '/user-screen',
        ),
      ];
}

/// generated route for
/// [LoginScreen]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute()
      : super(
          LoginRoute.name,
          path: '/',
        );

  static const String name = 'LoginRoute';
}

/// generated route for
/// [MainScreen]
class MainRoute extends PageRouteInfo<MainRouteArgs> {
  MainRoute({Key? key})
      : super(
          MainRoute.name,
          path: '/main-screen',
          args: MainRouteArgs(key: key),
        );

  static const String name = 'MainRoute';
}

class MainRouteArgs {
  const MainRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'MainRouteArgs{key: $key}';
  }
}

/// generated route for
/// [UserScreen]
class UserRoute extends PageRouteInfo<UserRouteArgs> {
  UserRoute({Key? key})
      : super(
          UserRoute.name,
          path: '/user-screen',
          args: UserRouteArgs(key: key),
        );

  static const String name = 'UserRoute';
}

class UserRouteArgs {
  const UserRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'UserRouteArgs{key: $key}';
  }
}
