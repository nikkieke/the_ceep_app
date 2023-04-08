import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rive/rive.dart';

import '../../../core/app_text.dart';

class AnimatedBtn extends StatelessWidget{
  const AnimatedBtn({
    Key? key,
     required RiveAnimationController animationBtnController,
    required this.pressed,
  }) : _animationBtnController = animationBtnController,
  super(key: key);

  final RiveAnimationController _animationBtnController;
  final VoidCallback pressed;

  @override
  Widget build(BuildContext context){
    return GestureDetector(
      onTap: pressed,
      child: SizedBox(
        height: 64.h,
        width: 260.w,
        child: Stack(
            children: [
               RiveAnimation.asset(
                  "assets/RiveAssets/button.riv",
                 controllers: [_animationBtnController],
              ),
              Positioned.fill(
                top: 8,
                left: 55,
                child: Row(
                  children: [
                    const Icon(CupertinoIcons.arrow_right),
                    const SizedBox(width: 4),
                    AppText(text: "Welcome Back", size: 15,),
                  ],
                ),
              ),
            ]
        ),
      ),
    );
  }
}