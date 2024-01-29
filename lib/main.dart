import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:ramad_pay/app_basics/app_routes.dart';
import 'package:ramad_pay/app_basics/colors.dart';
import 'auth/login/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Ramad Pay',
      navigatorKey: navigatorKey,
      theme: ThemeData(
        useMaterial3: true,
      ),
      getPages: AppRoutes.appNamedRoutes,
      color: primaryMaterialColor,
      home:  LoginScreen(),
    );
  }
}