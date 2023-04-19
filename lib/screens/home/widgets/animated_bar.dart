import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnimatedBar extends StatelessWidget {
  const AnimatedBar({
    Key? key,
    required this.isActive,
  }) : super(key: key);

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      margin: const EdgeInsets.only(bottom: 2),
      height: 3.h,
      width: isActive? 16.w : 0,
      decoration: const BoxDecoration(
          color: Colors.white70,
          borderRadius: BorderRadius.all(Radius.circular(5))
      ), duration: const Duration(milliseconds: 200),
    );
  }
}