import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../themes/app_theme.dart';

class ThemeController extends GetxController {
  final _storage = GetStorage();
  final _key = 'isDarkMode';

  var isDarkMode = false.obs;

  @override
  void onInit() {
    super.onInit();
    // Load stored theme value or default false
    isDarkMode.value = _loadThemeFromStorage();
    Get.changeTheme(theme);
  }

  ThemeData get theme => isDarkMode.value ? AppTheme.darkTheme : AppTheme.lightTheme;

  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
    _saveThemeToStorage(isDarkMode.value);
    Get.changeTheme(theme);
  }

  bool _loadThemeFromStorage() => _storage.read(_key) ?? false;
  void _saveThemeToStorage(bool isDarkMode) => _storage.write(_key, isDarkMode);
}