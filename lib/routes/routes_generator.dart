import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_demo/auth/sign_in/sign_in_controller.dart';
import 'package:notes_demo/auth/sign_in/sign_in_screen.dart';
import 'package:notes_demo/auth/sign_up/sign_up_controller.dart';
import 'package:notes_demo/auth/sign_up/sign_up_screen.dart';
import 'package:notes_demo/routes/routes.dart';

import '../auth/splash/splash_controller.dart';
import '../auth/splash/splash_screen.dart';

class RoutesGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splash:
        return GetPageRoute(
          routeName: settings.name,
          page: () => SplashScreen(),
          settings: settings,
          binding: BindingsBuilder(() {
            Get.lazyPut(() => SplashController());
          }),
        );
      case Routes.signIn:
        return GetPageRoute(
          routeName: settings.name,
          page: () => SignInScreen(),
          settings: settings,
          binding: BindingsBuilder(() {
            Get.lazyPut(() => SignInController());
          }),
        );
      case Routes.signUp:
        return GetPageRoute(
          routeName: settings.name,
          page: () => SignUpScreen(),
          settings: settings,
          binding: BindingsBuilder(() {
            Get.lazyPut(() => SignUpController());
          }),
        );

      default:
        return GetPageRoute(
          routeName: settings.name,
          page: () => _errorRoute(),
          settings: settings,
        );
    }
  }

  static Widget _errorRoute() {
    return Scaffold(
      appBar: AppBar(title: const Text('Error')),
      body: const Center(
        child: Text('No Such screen found in route generator'),
      ),
    );
  }
}
