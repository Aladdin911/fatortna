import 'package:fatortna/common_widgets/custom_button.dart';
import 'package:fatortna/constants/colors_config.dart';
import 'package:fatortna/constants/images_config.dart';
import 'package:fatortna/constants/sizes_config.dart';
import 'package:fatortna/onboard/models/onboard_item_model.dart';
import 'package:fatortna/onboard/view/widgets/onboard_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({Key? key}) : super(key: key);

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  List<OnboardItemModel> onBoardItems = [
    OnboardItemModel(
        title: "احتفظ بفواتيرك",
        img: ImagesConfig.onboard1img,
        desc: "فاتورتنا متخصص في حفظ واستعراض الفواتير الخاصة بمشترياتك"),
    OnboardItemModel(
        title: "لا تشيل هم النسيان",
        img: ImagesConfig.onboard2img,
        desc: "سولفيا يذكرك بمواعيد انتهاء فواتيرك"),
    OnboardItemModel(
        title: "احسب مصروفاتك",
        img: ImagesConfig.onboard3img,
        desc: "احسب مصروفاتك  الشهرية وحسب التصنيف")
  ];
  int indexPage = 0;
  PageController? pageController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    pageController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            (indexPage != onBoardItems.length - 1)
                ? Align(
                    alignment: Alignment.centerLeft,
                    child: SizedBox(
                      height: SizesConfig.n50.h,
                      child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            "تخطي",
                            style: TextStyle(
                                color: ColorConfig.greyColor,
                                fontFamily: "IBMMedium"),
                          )),
                    ),
                  )
                : SizedBox(
                    height: SizesConfig.n50.h,
                  ),
            SizedBox(
                height: MediaQuery.of(context).size.height * 0.69,
                child: PageView(
                  controller: pageController,
                  onPageChanged: (val) {
                    setState(() {
                      indexPage=val;
                      print(indexPage);
                    });
                  },
                  children: [
                    OnboardItem(
                      title: onBoardItems[0].title,
                      img: onBoardItems[0].img,
                      desc: onBoardItems[0].desc,
                    ),
                    OnboardItem(
                      title: onBoardItems[1].title,
                      img: onBoardItems[1].img,
                      desc: onBoardItems[1].desc,
                    ),
                    OnboardItem(
                      title: onBoardItems[2].title,
                      img: onBoardItems[2].img,
                      desc: onBoardItems[2].desc,
                    )
                  ],
                )
                // PageView.builder(
                //   // controller: pageController,
                //   onPageChanged: (val) {
                //     setState(() {
                //       indexPage=val;
                //       print(indexPage);
                //     });
                //   },
                //     physics: const BouncingScrollPhysics(),
                //     itemCount: onBoardItems.length,
                //     itemBuilder: (context, index) {
                //       return OnboardItem(
                //         title: onBoardItems[index].title,
                //         img: onBoardItems[index].img,
                //         desc: onBoardItems[index].desc,
                //       );
                //     })
                ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                  onBoardItems.length,
                  (i) => Container(
                      width: SizesConfig.n10.w,
                      height: SizesConfig.n10.w,
                      margin: EdgeInsets.only(left: SizesConfig.n10.w),
                      decoration: BoxDecoration(
                          color: (indexPage == i)
                              ? ColorConfig.secondaryColor
                              : ColorConfig.greyColor,
                          shape: BoxShape.circle))),
            ),
            SizedBox(
              height: SizesConfig.n30.h,
            ),
            Text(indexPage.toString()),
            
            (indexPage!= 2)
                ? SizedBox.shrink()
                : CustomButton(
              text: "ابدا الان",
              pressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
