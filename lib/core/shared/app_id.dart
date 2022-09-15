// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:my_demo/constans/app_images.dart';
// import '../../../constans/app_color.dart';

// import '../constans/constants.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/app_color.dart';
import '../constants/app_images.dart';
import '../constants/constants.dart';
import '../localization/localization.dart';
import 'the appbar/the_main_title_builder.dart';
// import 'package:my_demo/widgets/title_builder.dart';

class AppId extends StatelessWidget {
  const AppId({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            offset: Offset(2, 2),
            blurRadius: 5,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            AppImages.mainBurgerIcon,
            width: Get.width * 0.3,
          ),
          emptySpace,
          TheMainTitleBuilder(
            firstTitle: AppLocal.appNameFast.tr,
            secondTitle: AppLocal.appNameFood.tr,
          ),
        ],
      ),
    );
  }
}
