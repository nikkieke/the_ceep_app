import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rive/rive.dart';


class MenuButton extends StatelessWidget {
  const MenuButton({
    super.key,
    required this.pressed, required this.riveOnInit,
  });

  final VoidCallback pressed;
  final ValueChanged<Artboard>riveOnInit;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: pressed,
        child: Container(
          margin: const EdgeInsets.only(left: 16, top: 28),
          height: 40.h,
          width: 40.h,
          decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  offset: Offset(0,3),
                  blurRadius: 8,
                ),
              ]
          ),
          child: RiveAnimation.asset(
            "assets/RiveAssets/menu_button.riv",
            onInit: riveOnInit,
          ),
        ),
      ),
    );
  }
}