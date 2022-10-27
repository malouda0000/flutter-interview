import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_demo/controllers/switcher_cont.dart';
import 'package:my_demo/core/constants/app_color.dart';

class LightDarkSwitcher extends StatelessWidget {
  const LightDarkSwitcher({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SwitcherContrImp());
    return GetBuilder<SwitcherContrImp>(builder: (switcherContrImp) {
      return GestureDetector(
        onTap: () {
          switcherContrImp.changeThemeService();
        },
        child: Container(
          padding: EdgeInsets.all(4),
          width: double.infinity,
          height: 55,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: AppColor.kTextColor.withOpacity(.3),

            // color: AppColor.kTextColor,
          ),
          child: Row(
            children: [
              Expanded(
                child: AnimatedContainer(
                    duration: Duration(
                      milliseconds: 900,
                    ),
                    padding: EdgeInsets.all(10),
                    width: double.infinity,
                    height: double.infinity,
                    // height: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: switcherContrImp.darknessValue() == true
                          ? AppColor.kPrimaryColor
                          : null,
                    ),
                    child: Center(
                      child: Text(
                        'light mode',
                      ),
                    )),
              ),
              Expanded(
                child: AnimatedContainer(
                    duration: Duration(
                      milliseconds: 900,
                    ),
                    // curve: Curve.ea  ,
                    padding: EdgeInsets.all(10),
                    width: double.infinity,
                    height: double.infinity,
                    // height: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: switcherContrImp.darknessValue() == true
                          ? null
                          : AppColor.kPrimaryColor,
                    ),
                    child: Center(
                      child: Text(
                        'dark mode',
                      ),
                    )),
              ),
            ],
          ),
        ),
      );
    });
  }
}
