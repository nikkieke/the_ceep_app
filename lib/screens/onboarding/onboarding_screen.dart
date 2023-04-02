import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
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
            SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        const Spacer(),
                        SizedBox(
                          width: 260,
                            child: Column(
                                  children: const [
                                    Text("Pay your Bills with Ease",
                                    style: TextStyle(
                                    fontSize: 60,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: "Poppins",
                                    height: 1.2,
                                ),
                              ),
                                SizedBox(height: 16),
                              ]
                            )
                        )
                     ]
                  )
                )
            ),
          ],
        ),
    );
  }
}
