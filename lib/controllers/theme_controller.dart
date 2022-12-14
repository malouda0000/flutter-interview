import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_demo/core/constants/my_themes.dart';
import 'package:my_demo/main.dart';

//  bool themeMode =  mySharedPrefes!.getBool('dark');

class ThemeContorller extends GetxController {
  // ThemeData initalTheme = mySharedPrefes!.getBool('dark') == true
  //     ? MyThemes.customDarkTheme
  //     : MyThemes.customLightTheme;

  ThemeMode myThemeMode = mySharedPrefes!.getBool('dark') == true
      ? ThemeMode.dark
      : ThemeMode.light;

  changeThemeService() async {
    if (await Get.isDarkMode) {
      Get.changeTheme(MyThemes.customLightTheme);

      await mySharedPrefes!.setBool('dark', false);
      // print('theme changed to light theme');
    } else {
      Get.changeTheme(MyThemes.customDarkTheme);

      await mySharedPrefes!.setBool('dark', true);

      // print('theme changed to dark theme');
    }
  }

  // changeThemeService() async {
  //   if (Get.isDarkMode == true) {
  //     Get.changeTheme(MyThemes.customLightTheme);

  //     mySharedPrefes!.setBool('dark', false);
  //     // print('theme changed to light theme');
  //   }

  //   if (!Get.isDarkMode) {
  //     Get.changeTheme(MyThemes.customDarkTheme);

  //     mySharedPrefes!.setBool('dark', true);

  //     // print('theme changed to dark theme');
  //   }
  // }

}
