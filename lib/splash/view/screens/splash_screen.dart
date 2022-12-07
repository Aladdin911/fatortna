import 'package:fatortna/constants/images_config.dart';
import 'package:fatortna/constants/sizes_config.dart';
import 'package:fatortna/login/view/screens/login_screen.dart';
import 'package:fatortna/onboard/view/screens/onboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => const OnboardScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Image.asset(
            ImagesConfig.splashImg,
            width: SizesConfig.n220.w,
            height: SizesConfig.n220.h,
          ),
        ));
  }
}
