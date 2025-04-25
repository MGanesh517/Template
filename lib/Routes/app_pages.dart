import 'package:get/get.dart';
import 'package:template/Screen/Components/breadcrumb_examples.dart';
import 'package:template/Screen/Components/button_styles_component.dart';
import 'package:template/Screen/Components/checkBox_models.dart';
import 'package:template/Screen/Components/date_picker_utils.dart';
import 'package:template/Screen/Components/default_dropdown_styles.dart';
import 'package:template/Screen/Components/different_type_datePicker.dart';
import 'package:template/Screen/Components/grid_examples.dart';
import 'package:template/Screen/Components/grid_real_time_example.dart';
import 'package:template/Screen/Components/other_dialog_widgets.dart';
import 'package:template/Screen/Components/pagination.dart';
import 'package:template/Screen/Components/scroll_bar.dart';
import 'package:template/Screen/Components/single_%20and_multi_select%20_popup_compoenet.dart';
import 'package:template/Screen/Components/text_fields.dart';
import 'package:template/Screen/Components/upload_document_ui_examples.dart';
import 'package:template/Screen/Custom_AppBar/bottomNavigation_and_appbar_for_web.dart';
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

    GetPage(name: '/buttonTypes', page: () => const ButtonTypes(), transition: Transition.noTransition),
    GetPage(name: '/paginationExamples',page: () => PaginationExamples(),transition: Transition.noTransition),
    GetPage(name: '/girdExamples',page: () => GirdExamples(),transition: Transition.noTransition),

    ///   More Option Screen   /////
    GetPage(name: '/moreScreen',page: () => MoreScreen(),transition: Transition.noTransition),
    GetPage(name: '/textFieldsCommonFields',page: () => TextFieldsCommonFields(),transition: Transition.noTransition),
    GetPage(name: '/otherDialogWidgets',page: () => OtherDialogWidgets(),transition: Transition.noTransition),
    GetPage(name: '/responsiveProfileScreen',page: () => ResponsiveProfileScreen(),transition: Transition.noTransition),
    GetPage(name: '/datePickerUtils',page: () => DatePickerUtils(),transition: Transition.noTransition),
    // GetPage(name: '/tabBarScreen',page: () => TabBarScreen(),transition: Transition.noTransition),
    // GetPage(name: '/stepperWidgetExamples',page: () => StepperWidgetExamples(),transition: Transition.noTransition),
    // GetPage(name: '/antDesignStepperExampleScreen',page: () => AntDesignStepperExampleScreen(),transition: Transition.noTransition),
    GetPage(name: '/checkboxExamples',page: () => CheckboxExamples(),transition: Transition.noTransition),
    GetPage(name: '/antDatePickerDemoScreen',page: () => AntDatePickerDemoScreen(),transition: Transition.noTransition),
    // GetPage(name: '/responsiveGridExample',page: () => ResponsiveGridExample(),transition: Transition.noTransition),
    GetPage(name: '/defaultDropdownStyles',page: () => DefaultDropdownStyles(),transition: Transition.noTransition),
    // GetPage(name: '/popUpMultiSelect',page: () => PopUpMultiSelect(),transition: Transition.noTransition),
    GetPage(name: '/breadcrumbFucntion',page: () => BreadcrumbFucntion(), transition: Transition.noTransition),
    // GetPage(name: '/seconsdPageScreen',page: () => SeconsdPageScreen(), transition: Transition.noTransition),
    // GetPage(name: '/thirdPageScreen',page: () => ThirdPageScreen(), transition: Transition.noTransition),

    GetPage(name: '/uploadDocumentUiExamples',page: () => UploadDocumentUiExamples(), transition: Transition.noTransition),
    GetPage(name: '/gridRealTimeExample',page: () => GridRealTimeExample(), transition: Transition.noTransition),
    GetPage(name: '/scrollBarExamples',page: () => ScrollBarExamples(), transition: Transition.noTransition),
    GetPage(name: '/singleAndMultiSelectPopUp',page: () => SingleAndMultiSelectPopUp(), transition: Transition.noTransition),

  ];
}
