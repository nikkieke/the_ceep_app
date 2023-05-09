import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rive/rive.dart';
import 'package:the_ceep_app/screens/home/widgets/side_menu.dart';

import '../../../core/app_text.dart';
import '../../../core/utils/rive_utils.dart';
import '../../../models/rive_assets_bottom_nav.dart';
import '../home_screen.dart';
import 'animated_bar.dart';
import 'menu_button.dart';


class EntryPoint extends StatefulWidget {
  const EntryPoint({Key? key}) : super(key: key);

  @override
  State<EntryPoint> createState() => _EntryPointState();
}

class _EntryPointState extends State<EntryPoint> with SingleTickerProviderStateMixin{
  RiveAssets selectedBottomNav = bottomNav.first;

  late AnimationController _animationController;
  late Animation<double> animation;
  late Animation<double> scaleAnimation;

  late SMIBool isSideBarClosed;

  bool isSideMenuClosed = true;
  
  @override
  void initState() {
    _animationController = AnimationController(vsync: this,
        duration: const Duration(milliseconds: 200))..addListener(() {
        setState(() {

        });
    });
    animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(parent: _animationController,
        curve: Curves.fastOutSlowIn));
    scaleAnimation = Tween<double>(begin: 1, end: 0.8).animate(CurvedAnimation(parent: _animationController,
        curve: Curves.fastOutSlowIn));
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff73009E),
      resizeToAvoidBottomInset: false,
      extendBody: true,
      body: Stack(children:[
        AnimatedPositioned(
          curve: Curves.fastOutSlowIn,
          duration: const Duration(milliseconds: 200),
            width: 288,
            height: MediaQuery.of(context).size.height,
            left: isSideMenuClosed? -288 : 0,
            child: const SideMenu(),
        ),
        Transform(
          alignment: Alignment.center,
          transform: Matrix4.identity()..setEntry(3, 2,
              0.001)..rotateY(animation.value -30 * animation.value * pi/180),
          child: Transform.translate(
            offset: Offset(animation.value * 265,0),
              child: Transform.scale(
                scale: scaleAnimation.value,
                  child: const ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                      child: HomeScreen()))
          ),
        ),
        AnimatedPositioned(
          duration: const Duration(milliseconds: 200),
          curve: Curves.fastOutSlowIn,
          left: isSideMenuClosed? 0:220,
          top: 16,
          child: MenuButton(
            pressed: () {
              isSideBarClosed.value = !isSideBarClosed.value;
              if(isSideMenuClosed){
                _animationController.forward();
              }else{
                _animationController.reverse();
              }
              setState(() {
                isSideMenuClosed = isSideBarClosed.value;
              });
            },
            riveOnInit: (Artboard value) {
              StateMachineController controller = RiveUtils.getRiveController(value,
                  stateMachineName: "State Machine");
              isSideBarClosed = controller.findSMI("isOpen") as SMIBool;
              isSideBarClosed.value = true;
            },
          ),
        ),

      ]

      ),
      bottomNavigationBar:
      Transform.translate(
        offset: Offset(0,100 * animation.value),
        child: SafeArea(
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
      ),
    );
  }
}








