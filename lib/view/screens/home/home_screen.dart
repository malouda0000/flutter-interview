import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_demo/controllers/home_screen_controller.dart';
import 'package:my_demo/view/screens/home/categores_page.dart';
import 'package:my_demo/view/screens/home/temp_page.dart';
import 'package:my_demo/view/screens/home/widgets/big_burger_page.dart';
import 'package:my_demo/view/screens/home/widgets/cate_title_row.dart';

List<Widget> homePagesList = [
  // used for the home screen taps changer
  BigBurgurePage(),
  CategoresPage(),
  TempPage(),
  BigBurgurePage(),
  CategoresPage(),
  TempPage(),
  BigBurgurePage(),
];

// i don't think that i need for stateflull widget

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CategoresTitleRow(),
        Expanded(
          child: HomePageViewBuil(),
        ),
      ],
    );
  }
}

class HomePageViewBuil extends StatelessWidget {
  const HomePageViewBuil({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenControllerImp>(
      builder: ((homeScreenControllerImp) {
        return PageView.builder(
          controller: homeScreenControllerImp.pageController,
          onPageChanged: (value) {
            homeScreenControllerImp.onPageChanged(value);
          },
          itemCount: homePagesList.length,
          itemBuilder: (context, index) {
            return homePagesList[index];
          },
        );
      }),
    );
  }
}

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({
//     Key? key,
//   }) : super(key: key);

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   // GlobalKey<ScaffoldState> ScaffoldGenralKey = GlobalKey<ScaffoldState>();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // key: myKey,
//       drawer: const TheDrawer(),
//       appBar: TheAppBar(context),
//       bottomNavigationBar: TheBottomNavBar(),
//       // drawer: (),
//       body: Column(
//         // mainAxisSize: MainAxisSize.min,
//         children: [
//           Expanded(
//             flex: 1,
//             child: TheCategoryItem(),
//           ),
//           Expanded(
//             flex: 9,
//             child: Body(),
//           ),
//         ],
//       ),
//       // floatingActionButton: const TheFap(),
//     );
//   }
// }

// class Body extends StatelessWidget {
//   const Body({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return PageView.builder(
//       controller: homeScreenControllerImp.pageController,
//       onPageChanged: (value) {
//         // homeScreenControllerImp.onPageChanged(value);
//       },
//       itemCount: homePagesList.length,
//       itemBuilder: (context, index) {
//         return homePagesList[index];

//         // return BigBurgurePage();
//       },
//     );
//   }
// }

/////////////////////////////

// class Body extends StatelessWidget {
//   const Body({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return
//     ;
//   }
// }

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // key: myKey,
//       drawer: const TheDrawer(),
//       appBar: TheAppBar(context),
//       bottomNavigationBar: TheBottomNavBar(),
//       // drawer: (),
//       body: HomeScreenBody(),
//       // floatingActionButton: const TheFap(),
//     );
//   }
// }

// class HomeScreenBody extends StatelessWidget {
//   const HomeScreenBody({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         // Expanded(flex: 1, child: TheCategoryItem()),
//         // Expanded(flex: 9, child: Body()),
//         Text('data'),
//         Text('data'),
//         Text('data'),
//       ],
//     );
//   }
// }