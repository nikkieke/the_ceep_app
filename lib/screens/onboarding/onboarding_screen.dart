import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rive/rive.dart';
import 'package:the_ceep_app/screens/onboarding/widgets/animated_btn.dart';

import '../../core/app_text.dart';
import '../auth/custom_login_dialog.dart';

class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  bool isLoginDialogShown = false;
  late RiveAnimationController btnController;

  @override
  void initState() {
    btnController = OneShotAnimation(
        "Timeline 1",
      autoplay: false,
    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children:  [
            Positioned(
              width: MediaQuery.of(context).size.width * 1.7,
              left: 100,
              bottom: 100,
              child: Image.asset(
                "assets/images/spline.png",
              ),
            ),
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                child: const SizedBox(),
              ),
            ),
             const RiveAnimation.asset(
              "assets/RiveAssets/shapes.riv",
            ),
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
                child: const SizedBox(),
              ),
            ),
            AnimatedPositioned(
              top: isLoginDialogShown? -50:0,
              duration: const Duration(milliseconds: 240),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                          const Spacer(),
                          SizedBox(
                            width: 250.w,
                              child: Column(
                                    children: [
                                      AppText(
                                        text: "Pay Your Bills with Ease!",
                                        size: 65,
                                          fontWeight: FontWeight.w600,
                                      ),
                                   SizedBox(height: 16.h),
                                      AppText(
                                        text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, "
                                            "sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ",
                                      ),
                                ]
                              )
                          ),
                            const Spacer(flex: 4,),
                            AnimatedBtn(
                                animationBtnController: btnController,
                                pressed: () {
                                    btnController.isActive = true;
                                    Future.delayed(
                                      const Duration(milliseconds: 800),
                                      () {
                                        setState(() {
                                          isLoginDialogShown = true;
                                        });
                                        customLoginDialog(
                                          context,ref, onClosed: (_){
                                          setState(() {
                                            isLoginDialogShown = true;
                                          });
                                        }
                                        );
                                      });

                                }
                            ),

                             Padding(
                              padding: EdgeInsets.symmetric(vertical: 24),
                              child: AppText(
                                text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, "
                                      "sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ", size: 14,),
                            )
                       ]
                    )
                  )
              ),
            ),
          ],
        ),
    );
  }
}
