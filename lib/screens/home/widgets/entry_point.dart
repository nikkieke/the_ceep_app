import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rive/rive.dart';

import '../../../core/app_text.dart';
import '../../../core/utils/rive_utils.dart';
import '../../../models/rive_assets_bottom_nav.dart';
import '../home_screen.dart';
import 'animated_bar.dart';


class EntryPoint extends StatefulWidget {
  const EntryPoint({Key? key}) : super(key: key);

  @override
  State<EntryPoint> createState() => _EntryPointState();
}

class _EntryPointState extends State<EntryPoint> {
  RiveAssets selectedBottomNav = bottomNav.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const HomeScreen(),
      bottomNavigationBar:
      SafeArea(
        child: Container(
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.symmetric(horizontal: 24),
          decoration: BoxDecoration(
            color: const Color(0xff73009E).withOpacity(0.8),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ...List.generate(bottomNav.length,
                      (index) => GestureDetector(
                    onTap: (){
                      bottomNav[index].input!.change(true);
                      if(bottomNav[index] != selectedBottomNav){
                       setState(() {
                         selectedBottomNav = bottomNav[index];
                       });
                      }
                      Future.delayed(const Duration(seconds: 1),
                          (){
                          bottomNav[index].input!.change(false);
                          }
                      );
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AnimatedBar(isActive: bottomNav[index] == selectedBottomNav),
                        SizedBox(
                          height: 30.h,
                          width: 30.w,
                          child: Opacity(
                            opacity: bottomNav[index] == selectedBottomNav? 1 : 0.5,
                            child: RiveAnimation.asset(
                              bottomNav.first.src,
                              artboard: bottomNav[index].artboard,
                              onInit: (artboard){
                                StateMachineController controller =
                                RiveUtils.getRiveController(artboard,
                                    stateMachineName: bottomNav[index].stateMachineName);
                                bottomNav[index].input =
                                controller.findSMI("active") as SMIBool;
                              },
                            ),
                          ),
                        ),
                        bottomNav[index] == selectedBottomNav?
                        AppText(text: bottomNav[index].title, color: Colors.white,size: 10,):
                        Container()
                      ],
                    ),
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}






