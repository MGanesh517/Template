import 'package:get/get.dart';
import 'package:template/Screen/Components/button_styles_component.dart';
import 'package:template/Screen/Illustration/splash_screen.dart';
import 'package:template/Screen/Leads/leads_create_screen.dart';
import 'package:template/Screen/Leads/leads_list_screen.dart';
import 'package:template/Screen/Master%20Screen/masters_list_screen.dart';
import 'package:template/Screen/Profile%20Screen/change_password_view.dart';
import 'package:template/Screen/Profile%20Screen/responsive_profile_screen.dart';
import 'package:template/Screen/login/login.dart';

part 'app_routes.dart';

/// contains all configuration pages
class AppPages {
  /// when the app is opened, this page will be the first to be shown

  static final pages = [
    GetPage(name: Routes.splashScreen, page: () => const SplashScreen(), transitionDuration: const Duration(milliseconds: 300)),
    GetPage(name: Routes.loginView, page: () => LoginView(), transitionDuration: const Duration(milliseconds: 300)),
    GetPage(name: Routes.changePasswordView, page: () => const ChangePasswordView(), transitionDuration: const Duration(milliseconds: 300)),

    GetPage(name: Routes.mastersListScreen, page: () => MastersListScreen(), transition: Transition.noTransition),
    GetPage(name: '/responsiveProfileScreen', page: () => const ResponsiveProfileScreen(), transition: Transition.noTransition),
    GetPage(name: '/leadsCreateScreen', page: () => const LeadsCreateScreen(), transition: Transition.noTransition),
    GetPage(name: '/leadsListScreen', page: () => const LeadsListScreen(), transition: Transition.noTransition),



    ////////    Components Screens      //////////

    GetPage(name: '/buttonTypes', page: () => const ButtonTypes(), transition: Transition.noTransition),  ];
}
