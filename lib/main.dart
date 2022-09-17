import 'package:firedart/firedart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tracking_admin_panel/providers/placeProvider.dart';
import 'package:tracking_admin_panel/providers/userProvider.dart';
import 'package:tracking_admin_panel/routes/router.dart';

const apiKey = "AIzaSyAhAIdbQfBNQIa6lT82FBRZHJvSFuLHeU0";
const projectId = "tracking-people-d4158";

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firestore.initialize(projectId);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PlaceProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
      child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Tracking Panel',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          routerDelegate: _appRouter.delegate(),
          routeInformationParser: _appRouter.defaultRouteParser()),
    );
  }
}
