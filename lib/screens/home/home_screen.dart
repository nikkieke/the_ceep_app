import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:the_ceep_app/core/app_text.dart';
import 'package:the_ceep_app/screens/home/widgets/home_list_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFAF9F6),
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                      // SvgPicture.asset(
                      //   "assets/images/side_nav.svg", width: 30.w,),
                    Row(
                      children: [
                        AppText(
                            text: 'Hello! Dominos Pizza', size: 18,),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Image.asset(
                            "assets/images/dominos_pizza.png", width: 30.w,),
                        ),

                      ],
                    ),
                  ],
                ),
              ),
              ListView(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: [
                  ...listCards
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

