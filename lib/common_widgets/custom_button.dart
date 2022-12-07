import 'package:fatortna/constants/colors_config.dart';
import 'package:fatortna/constants/sizes_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final Color? buttonColor;
  final String text;
  final void Function() pressed;

  const CustomButton(
      {Key? key, this.buttonColor=ColorConfig.secondaryColor, required this.text,required this.pressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: pressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: buttonColor ,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(SizesConfig.n30.r))),
        child: Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width * 0.8,
          height: SizesConfig.n50.h,
          child: Text(
            text,
            style:
                TextStyle(fontSize: SizesConfig.n16.sp, fontFamily: "IBMBold"),
          ),
        ));
  }
}
