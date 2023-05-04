import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rive/rive.dart';

import '../../../core/app_text.dart';
import '../../../models/rive_assets_bottom_nav.dart';

class SideMenuTile extends StatelessWidget {
  const SideMenuTile({
    super.key,
    required this.menu,
    required this.press,
    required this.riveonInit,
    required this.isActive
  });

  final RiveAssets menu;
  final VoidCallback press;
  final ValueChanged<Artboard>riveonInit;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(padding: EdgeInsets.only(left: 24),
          child: Divider(
            color: Colors.white24,
            height: 1,
          ),
        ),
        Stack(
          children: [
            AnimatedPositioned(
              curve: Curves.fastOutSlowIn,
              height: 56,
              width: isActive? 288: 0,
              left: 0,
              duration: const Duration(milliseconds: 300),
              child: Container(
               decoration: const BoxDecoration(
                 color: Color(0xffCF9FFF),
                 borderRadius: BorderRadius.all(Radius.circular(5))
               ),
              ),
            ),
            ListTile(
              onTap: press,
              leading: SizedBox(
                height: 34.h,
                width: 34.w,
                child: RiveAnimation.asset(
                  menu.src,
                  artboard: menu.artboard,
                  onInit: riveonInit,
                ),
              ),
              title: AppText(text: menu.title,color: Colors.white,size: 18,),
            ),
          ]

        ),
      ],
    );
  }
}