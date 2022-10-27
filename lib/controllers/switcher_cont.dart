import 'package:get/get.dart';
import 'package:my_demo/core/constants/my_themes.dart';
import 'package:my_demo/main.dart';

abstract class SwitcherContr extends GetxController {
  switchTheValu();
  changeThemeService();
  darknessValue();
}

class SwitcherContrImp extends SwitcherContr {
  // late bool initValue;

  @override
  switchTheValu() {
    // isDark = isDark == true ? false : true;
    // update();
  }

  changeThemeService() {
    if (darknessValue() == true) {
      Get.changeTheme(MyThemes.customLightTheme);

      mySharedPrefes!.setBool('dark', false);
    } else if (!darknessValue() == true) {
      Get.changeTheme(MyThemes.customDarkTheme);

      mySharedPrefes!.setBool('dark', true);
    }
  }

  @override
  void onInit() async {
    // isDark = await mySharedPrefes!.getBool('dark') == true ? true : false;
    ;
  }

  @override
  darknessValue() async {
    bool isDark = await mySharedPrefes!.getBool('dark') == true ? true : false;
    return isDark;
  }
}
