import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rive/rive.dart';
import 'package:the_ceep_app/core/app_text.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:the_ceep_app/screens/home/widgets/entry_point.dart';

import '../auth/widgets/button.dart';
import '../home/widgets/side_menu.dart';
import 'onboarding_screen.dart';

class GetStartedScreen extends StatefulWidget {
  const GetStartedScreen({Key? key}) : super(key: key);

  @override
  State<GetStartedScreen> createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends State<GetStartedScreen> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 50.h,
          ),
            Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
               SizedBox(width: 100.w,),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: AppText(text: "Skip", color: const Color(0xff73009E),),
              ),
            ],
          ),
            SizedBox(
            height: 50.h,
          ),
            CarouselSlider(
            options: CarouselOptions(
            viewportFraction: 1,
              height: 380.h,
              initialPage: 0,
              autoPlayCurve: Curves.fastOutSlowIn,
              onPageChanged:
                  (index, reason) {
                setState(() =>
                activeIndex = index);
              },
            ), items: [
              carouselContainer(
                 const RiveAnimation.asset(
                      "assets/RiveAssets/phone.riv",
                    ),
                'Make Payment Faster',
                'Lorem ipsum dolor sit amet, consectetur '
                    'adipiscing elit. In est tellus, rhoncus quis commodo a, pellentesque eget est'
              ),

              carouselContainer(const RiveAnimation.asset(
                "assets/RiveAssets/invoice.riv",
              ),
                  'Generate Invoice',
                  'Lorem ipsum dolor sit amet, consectetur '
                      'adipiscing elit. In est tellus, rhoncus quis commodo a, pellentesque eget est'
              ),
              carouselContainer(
                const RiveAnimation.asset(
                  "assets/RiveAssets/spreadsheet.riv",
                ),
                  'Manage Business Inventory',
                  'Lorem ipsum dolor sit amet, consectetur '
                      'adipiscing elit. In est tellus, rhoncus quis commodo a, pellentesque eget est'
              ),
        ],
      ),
            SizedBox(
            height: 10.h,
          ),
            carouselIndicator(activeIndex),
            SizedBox(
            height: 20.h,
          ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Button(
              appText: AppText(text: "Done",color: Colors.white,),
              onPress: () {
                Navigator.push(context, MaterialPageRoute(
                    builder: (context){
                      return const OnboardingScreen();
                    }));
              },

          ),
            ),
    ]
    )
    );
  }
}

Widget carouselContainer(RiveAnimation child, String titleText, String subtitleText){
  return Column(
    children: [
      Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
          alignment: Alignment.center,
          height: 200.h,
          width: 300.w,
          decoration:  BoxDecoration(
          color: Colors.white,
          border: Border.all(color: const Color(0xff73009E), width: 0.3),
      borderRadius: BorderRadius.all(Radius.circular(10.r))
      ),
      child: child
      ),
      SizedBox(height: 20.h,),
      AppText(text: titleText, fontWeight: FontWeight.w800,size: 25,),
      SizedBox(height: 20.h,),
      SizedBox(
        width: 300,
        child: AppText(text: subtitleText, fontWeight: FontWeight.w400,size: 15,
          color: Colors.black45, textAlign: TextAlign.center,),
      ),

    ],
  );
}

Widget carouselIndicator(activeIndex){
 return AnimatedSmoothIndicator(
   activeIndex: activeIndex,
   count:  3,
   effect:  const ExpandingDotsEffect(
     activeDotColor: Color(0xff73009E),
     dotHeight: 8,
     dotWidth: 8,

   )
 );
}