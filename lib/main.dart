import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:ramad_pay/app_basics/app_routes.dart';
import 'package:ramad_pay/app_basics/colors.dart';
import 'package:ramad_pay/home_screen/main_screen.dart';
import 'auth/login/login_screen.dart';
import 'helpers/shared_pref_helper.dart';
import 'home_screen/profile/edit_profile_screen.dart';
import 'home_screen/profile/profile_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPref _sharedPref = SharedPref();
  var token = await _sharedPref.readString(SharedPref.accessToken);
  runApp( MyApp(token:token));
}

class MyApp extends StatelessWidget {
  String token;
   MyApp({super.key, required this.token});

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
      home: token == '' || token =="null" ? LoginScreen() : MainScreen(),
      // home:  EditProfileScreen(),
    );
  }
}