import 'package:ramad_pay/auth/recover_password.dart';
import 'package:ramad_pay/auth/signup_form.dart';
import 'package:ramad_pay/auth/verify_otp_screen.dart';
import 'package:ramad_pay/home_screen/home_screen.dart';
import '../auth/login/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../auth/register_success_screen.dart';
import '../auth/reset_password_screen.dart';


GlobalKey<NavigatorState> navigatorKey = GlobalKey();
class AppRoutes {
  static const String loginScreen = "/loginScreen";
  static const String verifyOtpScreen = "/verifyOTPScreen";
  static const String signUpScreen = "/signUpScreen";
  static const String registerSuccessScreen = "/registerSuccessScreen";
  static const String passwordRecoveryScreen = "/passwordRecoveryScreen";
  static const String resetPasswordScreen = "/resetPasswordScreen";
  static const String homeScreen = "/homeScreen";

  static List<GetPage> appNamedRoutes = [
    GetPage(name: loginScreen, page: () => LoginScreen()),
    GetPage(name: verifyOtpScreen, page: () => VerifyOTPScreen()),
    GetPage(name: signUpScreen, page: () => SignupScreen()),
    GetPage(name: registerSuccessScreen, page: () => RegisterSuccessScreen()),
    GetPage(name: passwordRecoveryScreen, page: () => PasswordResetScreen()),
    GetPage(name: homeScreen, page: () => HomeScreen()),
    GetPage(name: resetPasswordScreen, page: () => ResetPasswordScreen()),
  ];
}
