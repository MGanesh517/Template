import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:template/Theme/app_theme.dart';

class DrawerControllerX extends GetxController {
  final storage = GetStorage();

  late AnimationController animationController;

  final RxBool showDrawerLeft = false.obs;

  final RxBool darkAnLightTheme = false.obs;


///////////     THeme Setup LIght And Dark Mode
///
  Rx<ThemeMode> themeMode = ThemeMode.light.obs;

  // toggleTheme(BuildContext context) {
  //   themeMode.value =
  //       themeMode.value == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
  // }

  // bool get isDarkMode => themeMode.value == ThemeMode.dark;

///////////     THeme Setup LIght And Dark Mode

  RxBool isPopupMenuVisible = false.obs;
  Rx<int?> currentPopupMenuIndex = Rx<int?>(null);

  final RxBool _isTextNotVisible = false.obs;
  bool get isTextNotVisible => _isTextNotVisible.value;
  set isTextNotVisible(bool value) => _isTextNotVisible.value = value;

  @override
  void onInit() {
    super.onInit();
    isTextNotVisible = storage.read('showText') ?? true;
  }

  void toggleShowText() {
    isTextNotVisible = !isTextNotVisible;
    storage.write('showText', isTextNotVisible);
  }

  void setShowText(bool value) {
    isTextNotVisible = value;
    storage.write('showText', isTextNotVisible);
  }

  final RxBool _isHovered = false.obs;
  bool get isHovered => _isHovered.value;
  set isHovered(bool value) => _isHovered.value = value;

  final RxInt _selectedIndex = 0.obs;
  get selectedIndex => _selectedIndex.value;
  set selectedIndex(value) => _selectedIndex.value = value;

  final RxBool isDrawerOpen = false.obs;

  void toggleDrawer() {
    isDrawerOpen.value = !isDrawerOpen.value;
  }
}