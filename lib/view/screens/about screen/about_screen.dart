import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_demo/core/constants/app_images.dart';
import 'package:my_demo/core/shared/circuled_image_with_border.dart';

import 'package:my_demo/view/screens/about%20screen/widgets/contact_me_row.dart';
import 'package:my_demo/view/screens/about%20screen/widgets/setting_list_tiles.dart';
import 'package:my_demo/view/screens/about%20screen/widgets/user_name.dart';

import '../../../core/constants/constants.dart';
import '../../../core/localization/localization.dart';
import '../../../core/shared/bottom navigation bar/bottom_nav_bar.dart';
import 'widgets/temp_debuging_row.dart';
// import 'package:flutter_remix/flutter_remix.dart';

// final Uri _url = Uri.parse('tel:+1-555-010-999');

// Future<void> _launchUrl() async {
//   if (!await launchUrl(_url)) {
//     throw GetSnackBar(
//       title: 'Could not launch $_url',
//     );
//   }
// }

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: (),
      body: SafeArea(
        child: ListView(
          scrollDirection: Axis.vertical,
          padding: const EdgeInsets.all(15),
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                emptySpace,
                Card(
                  elevation: theDefaultElevation,
                  child: Padding(
                    padding: EdgeInsets.all(theDefaultPadding),
                    child: Row(
                      children: [
                        // the default user image
                        CircularImageWithBorder(imagePath: AppImages.userImage),
                        Spacer(),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            UserName(),
                            Text(
                              AppLocal.userEmail.tr,
                            )
                          ],
                        ),
                        Spacer(),
                      ],
                    ),
                  ),
                ),
                emptySpace,
                MySettingListTiles(),
                emptySpace,
                ContactMeRow(),
                emptySpace,
                TempDebugingRow(),
              ],
            ),
          ],
        ),
      ),
      // floatingActionButton: const TheFap(),
      bottomNavigationBar: const TheBottomNavBar(),
    );
  }
}
