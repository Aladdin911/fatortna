import 'package:fatortna/constants/colors_config.dart';
import 'package:fatortna/constants/sizes_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardItem extends StatelessWidget {
  final String title;
  final String img;
  final String desc;

  const OnboardItem(
      {Key? key, required this.title, required this.img, required this.desc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: SizesConfig.n24.h,
            ),
            Text(
              title,
              style: TextStyle(
                  color: ColorConfig.primaryColor,
                  fontFamily: "IBMBold",
                  fontSize: SizesConfig.n20.sp),
            ),
            Image.asset(
              img,
              width: SizesConfig.n300.w,
              height: SizesConfig.n300.h,
            ),
            SizedBox(
              height: SizesConfig.n16.h,
            ),
            Text(
              desc,
              style: TextStyle(
                  color: ColorConfig.greyColor,
                  fontFamily: "IBMRegular",
                  height: 1.7,
                  fontSize: SizesConfig.n16.sp),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
