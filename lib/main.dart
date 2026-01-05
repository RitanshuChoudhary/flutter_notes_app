import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_demo/routes/routes.dart';
import 'package:notes_demo/routes/routes_generator.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp(initialRoute: Routes.signIn));
}

class MyApp extends StatelessWidget {
  final String initialRoute;

  const MyApp({super.key, required this.initialRoute});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: Routes.signIn,
      onGenerateRoute: RoutesGenerator.generateRoute,
      onGenerateInitialRoutes: (String initialRouteName) {
        return [
          RoutesGenerator.generateRoute(RouteSettings(name: initialRoute)),
        ];
      },
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
    );
  }
}
