import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_demo/constants.dart';
import 'package:my_demo/screens/about%20screen/about_screen.dart';
import 'package:my_demo/screens/detials%20screen/detials_screen.dart';
import 'package:my_demo/screens/home/my_home_page.dart';
import 'package:my_demo/screens/setting/setting_screen.dart';
import 'package:my_demo/screens/setting/theme_screen.dart';
import 'screens/intro slider/intro_slider.dart';
import 'screens/sing and log in screen/sing_and_log_in_screen.dart';

// import 'dart:ffi';

//  var size = MediaQuery.of(context).size;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false, initialRoute: 'themeScreen',
      title: 'Flutter Demo',
// initialRoute: ,
      getPages: [
        GetPage(name: '/homePage', page: () => MyHomePage()),
        GetPage(name: '/InroSliderScreen', page: () => IntroSliderPage()),
        GetPage(name: '/SinInScreen', page: () => SingInScreen()),
        GetPage(name: '/detialsScreen', page: () => const DetialsScreen()),
        GetPage(name: '/settingScreen', page: () => const SettingScreen()),
        GetPage(name: '/aboutScreen', page: () => const AboutScreen()),
        GetPage(name: '/themeScreen', page: () => ThemeScreen())
      ],

      // themeMode: ThemeMode.dark,

      // theme: ThemeData.dark(),

      // darkTheme: ThemeData(primaryColorDark: Colors.yellow),
//
//
//
//

//       theme: ThemeData(

// //
// //
//         // brightness: Brightness.dark,
//         // // primarySwatch: Colors.amber,
//         // primaryColor: Colors.indigo,
//         // // primaryColorDark: Colors.indigoAccent,
// //
// //
// //
// //

//         primaryColor: kPrimaryColor,
//         scaffoldBackgroundColor: Colors.white,
//         textTheme: TextTheme(
//           body1: TextStyle(color: ksecondaryColor),
//           body2: TextStyle(color: ksecondaryColor),
//         ),
//       ),

//
//
//

      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
        textTheme: const TextTheme(
          bodyText1: TextStyle(color: ksecondaryColor),
          bodyText2: TextStyle(color: ksecondaryColor),
        ),
      ),

      home: IntroSliderPage(),
    );
  }
}
