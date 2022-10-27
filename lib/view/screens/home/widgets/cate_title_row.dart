import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_demo/controllers/home_screen_controller.dart';
import 'package:my_demo/core/constants/constants.dart';
import 'package:my_demo/view/screens/home/home_screen.dart';
import 'package:my_demo/view/screens/home/widgets/items_title_builder.dart';
import 'package:my_demo/view/screens/home/widgets/the_category_item.dart';

class CategoresTitleRow extends StatelessWidget {
  const CategoresTitleRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // categores row
      height: 48,
      width: double.infinity,
      child: Row(children: [
        const SizedBox(
          // width: 15,
          width: theDefaultPadding,
        ),
        Expanded(
          child: GetBuilder<HomeScreenControllerImp>(
            builder: ((homeScreenControllerImp) {
              return ListView.builder(

                  // categores list
                  itemCount: homePagesList.length,
                  scrollDirection: Axis.horizontal,
                  // shrinkWrap: true,
                  itemBuilder: (context, i) {
                    // return items[index];

                    return ItemsTitleBuilder(
                      title: titlesList[i],
                      pressed: () async {
                        await homeScreenControllerImp.onPageJumpededTo(i);
                      },
                      isActive: i == homeScreenControllerImp.currentPage
                          ? true
                          : false,
                      // if( index == homeScreenControllerImp.currentPage ){ return true;} else { return false;},
                    );
                  });
            }),
          ),
        ),
      ]),
    );
  }
}
