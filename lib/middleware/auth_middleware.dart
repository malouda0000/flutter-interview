import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:my_demo/get_pages.dart';
import '../main.dart';

class AuthMiddleWare extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    if (mySharedPrefes?.getBool('logIn') != null) {
      // return super.redirect(route);
      if (mySharedPrefes!.getBool('logIn') == true) {
        return RouteSettings(name: AppRoute.homePage);
      } else {
        return RouteSettings(name: AppRoute.singInScreen);
      }
    } else {
      return RouteSettings(
        name: AppRoute.introSliderScreen,
      );
    }
  }
}
