import 'package:flutter/material.dart';

import '../../../constans/app_color.dart';

class ItemBuilder extends StatelessWidget {
  final String title;
  final bool isActive;
  final Function pressed;

  ItemBuilder({
    Key? key,
    required this.title,
    required this.pressed,
    this.isActive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: GestureDetector(
        onTap: () {},
        child: Column(
          children: [
            Text(
              title,
              style: isActive
                  ? const TextStyle(
                      color: AppColor.kTextColor, fontWeight: FontWeight.bold
                      // fontSize: 12,
                      )
                  : const TextStyle(
                      color: AppColor.ksecondaryColor,
                      // fontSize: 12,
                    ),
            ),
            if (isActive)
              Container(
                decoration: BoxDecoration(
                  color: AppColor.kPrimaryColor,
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                ),
                margin: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 8,
                ),
                height: 3,
                width: 22,
              ),
          ],
        ),
      ),
    );
  }
}