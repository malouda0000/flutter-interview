import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_demo/constans/constants.dart';
import 'package:my_demo/constans/app_routes.dart';
import 'package:my_demo/controllers/singup_controller.dart';
import 'package:my_demo/localization/localization.dart';
import 'package:my_demo/screens/auth/social_auth.dart';
import 'package:my_demo/widgets/app_id.dart';
import 'package:my_demo/widgets/backgroundContainer.dart';
import 'package:my_demo/widgets/big_button.dart';
import 'package:my_demo/widgets/the_input_field.dart';

import 'dont_have_account.dart';
import 'or_row.dart';
import '../../../constans/app_color.dart';

class SingUpScreen extends StatelessWidget {
  const SingUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SingupController(), permanent: true);
    SingupController singupController = Get.find();
    return Scaffold(
        body: Stack(
      // clipBehavior: Clip.hardEdge,
      children: [
        BackgrounContainer(),
        SafeArea(
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(15),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Card(
                  margin: EdgeInsets.all(15),
                  elevation: 10,
                  child: Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        // boxShadow: [
                        //   BoxShadow(
                        //     offset: Offset(0, 4),
                        //     blurRadius: theDefaultRaduis,
                        //     color: AppColor.kTextBlacColor,
                        //     // color: Colors.red,
                        //   ),
                        // ],
                        color: AppColor.theMainLightColor,
                        borderRadius: BorderRadius.circular(theDefaultRaduis)),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        AppId(titleColor: AppColor.theMainLightColor),

                        emptySpace,
                        TheInputField(
                          theInputType: TextInputType.text,
                          theBorderColor: AppColor.kPrimaryColor,
                          theBorderRadius: theDefaultRaduis,
                          theHient: AppLocal.email.tr,
                          theInputColor: AppColor.kTextColor,
                          theLeadingIcon: Icons.email_outlined,
                          thePadding: theDefaultPadding,
                          isPassword: false,
                        ),
                        emptySpace,
                        TheInputField(
                          theInputType: TextInputType.text,
                          theBorderColor: AppColor.kPrimaryColor,
                          theBorderRadius: theDefaultRaduis,
                          theHient: AppLocal.password.tr,
                          theInputColor: AppColor.kTextColor,
                          theLeadingIcon: Icons.password_outlined,
                          thePadding: theDefaultPadding,
                          isPassword: true,
                        ),
                        emptySpace,
                        TheInputField(
                          theInputType: TextInputType.text,
                          theBorderColor: AppColor.kPrimaryColor,
                          theBorderRadius: theDefaultRaduis,
                          theHient: AppLocal.password.tr,
                          theInputColor: AppColor.kTextColor,
                          theLeadingIcon: Icons.password_outlined,
                          thePadding: theDefaultPadding,
                          isPassword: true,
                        ),
                        emptySpace,
                        BigggButton(
                          onTaped: () {
                            singupController.singup();
                          }

                          // Navigator.of(context).pushReplacement(
                          //     MaterialPageRoute(builder: (context) {
                          //   return MyHomePage();
                          // }));
                          ,
                          // theBackgrounColor: ksecondaryColor,
                          theButtonTitle: AppLocal.singUp.tr,
                          theLeadingIcon: Icons.login_rounded,

                          leadingIconColor: AppColor.theMainLightColor,

                          buttonTitleColor: AppColor.theMainLightColor,

                          // child: MaterialButton(
                          //     child: Text('tab me'),
                          //     onPressed: () {
                          //       () => Get.to(MyHomePage());
                          //     }),
                        ),

                        // BigggButton(
                        //   onTaped: () {
                        //     Get.offAll(() => MyHomePage());
                        //     print('tabeded');
                        //     // Navigator.of(context).pushReplacement(
                        //     //     MaterialPageRoute(builder: (context) {
                        //     //   return MyHomePage();
                        //     // }));
                        //   },
                        //   // theBackgrounColor: ksecondaryColor,
                        //   theButtonTitle: 'LogIn',
                        //   theLeadingIcon: Icons.login_rounded,
                        // ),

                        emptySpace,
                        OrRow(),
                        emptySpace,
                        SocialAuthRow(),
                        emptySpace,
                        DontHaveAccount(
                          doYouHaveAccoun: AppLocal.allredyHaveAccount.tr,
                          singOrLogin: AppLocal.singIn.tr,
                          theFunc: () => Get.toNamed(AppRoute.singInScreen),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    ));
  }
}