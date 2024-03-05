import 'package:get/get.dart';
import 'package:ramad_pay/auth/recover_password.dart';
import 'package:ramad_pay/auth/signup_form.dart';
import 'package:ramad_pay/auth/verify_otp_screen.dart';
import 'package:ramad_pay/home_screen/home_screen.dart';
import 'package:ramad_pay/home_screen/main_screen.dart';
import 'package:ramad_pay/home_screen/profile/profile_screen.dart';
import '../auth/login/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import '../auth/register_success_screen.dart';
import '../home_screen/beneficiaries/add_beneficiaries_screen.dart';
import '../home_screen/profile/documents_screen/add_documents_screen.dart';
import '../home_screen/profile/edit_profile_screen.dart';


GlobalKey<NavigatorState> navigatorKey = GlobalKey();
class AppRoutes {
  static const String loginScreen = "/loginScreen";
  static const String verifyOtpScreen = "/verifyOTPScreen";
  static const String signUpScreen = "/signUpScreen";
  static const String registerSuccessScreen = "/registerSuccessScreen";
  static const String passwordRecoveryScreen = "/passwordRecoveryScreen";
  static const String resetPasswordScreen = "/resetPasswordScreen";
  static const String homeScreen = "/homeScreen";
  static const String mainScreen = "/mainScreen";
  static const String editProfileScreen = "/editProfileScreen";
  static const String profileScreen = "/profileScreen";
  static const String addDocumentsScreen = "/addDocumentsScreen";
  static const String addBeneficiariesScreen = "/addBeneficiariesScreen";

  static List<GetPage> appNamedRoutes = [
    GetPage(name: loginScreen, page: () => LoginScreen()),
    GetPage(name: verifyOtpScreen, page: () => VerifyOTPScreen()),
    GetPage(name: signUpScreen, page: () => SignupScreen()),
    GetPage(name: registerSuccessScreen, page: () => const RegisterSuccessScreen()),
    GetPage(name: passwordRecoveryScreen, page: () => PasswordResetScreen()),
    GetPage(name: homeScreen, page: () => HomeScreen()),
    GetPage(name: mainScreen, page: () => MainScreen()),
    GetPage(name: editProfileScreen, page: () => EditProfileScreen()),
    GetPage(name: addDocumentsScreen, page: () => AddDocumentsScreen()),
    GetPage(name: addBeneficiariesScreen, page: () => AddBeneficiariesScreen()),
    GetPage(name: profileScreen, page: () => ProfileScreen(), transition: Transition.fade),
  ];
}
