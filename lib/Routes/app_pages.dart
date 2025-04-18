import 'package:get/get.dart';
import 'package:template/Screen/Illustration/splash_screen.dart';
import 'package:template/Screen/Profile%20Screen/change_password_view.dart';
import 'package:template/Screen/Profile%20Screen/profile_screen.dart';
import 'package:template/Screen/custom_dashBoard.dart';
import 'package:template/Screen/login/login.dart';

part 'app_routes.dart';

/// contains all configuration pages
class AppPages {
  /// when the app is opened, this page will be the first to be shown

  static final pages = [
    GetPage(name: Routes.splashScreen, page: () => const SplashScreen(), transitionDuration: const Duration(milliseconds: 300)),
    GetPage(name: Routes.loginView, page: () => LoginView(), transitionDuration: const Duration(milliseconds: 300)),
    GetPage(name: Routes.dashBoardView, page: () => const DashboardView(), transitionDuration: const Duration(milliseconds: 300)),
    GetPage(name: Routes.profileScreen, page: () => const ProfileScreen(), transitionDuration: const Duration(milliseconds: 300)),
    // GetPage(name: Routes.home, page: () => Home(), transitionDuration: const Duration(milliseconds: 300)),
    GetPage(name: Routes.profileView, page: () => ProfileScreen(), transitionDuration: const Duration(milliseconds: 300)),
    GetPage(name: Routes.changePasswordView, page: () => const ChangePasswordView(), transitionDuration: const Duration(milliseconds: 300)),

    // GetPage(name: Routes.home, page: () => CustomBottomNavBar(), transitionDuration: const Duration(milliseconds: 300)),

  ];
}
