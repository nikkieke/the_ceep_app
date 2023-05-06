import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rive/rive.dart';
import 'package:the_ceep_app/core/app_text.dart';
import 'package:the_ceep_app/models/rive_assets_bottom_nav.dart';
import 'package:the_ceep_app/screens/home/widgets/side_menu_tile.dart';

import '../../../core/lightmode_notifier.dart';
import '../../../core/utils/rive_utils.dart';
import 'info_card.dart';

class SideMenu extends ConsumerStatefulWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  ConsumerState<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends ConsumerState<SideMenu> {

  RiveAssets selectedMenu = sideMenu.first;
  @override
  Widget build(BuildContext context) {
    var lightMode = ref.watch(lightModeProvider);
    return Scaffold(
      body: Container(
          width: 288.w,
          height: double.infinity,
          color: const Color(0xff73009E),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  const InfoCard(name: "Abdul B.", role: "Admin",),
                  Padding(padding: const EdgeInsets.only(left: 24, bottom: 32, top: 16),
                      child: AppText(text: "Browse",color: Colors.white,size: 20,),
                  ),
                  ...sideMenu.map((menu) =>  SideMenuTile(
                    menu: menu, 
                    press: () {
                      menu.input!.change(true);
                      Future.delayed(const Duration(seconds: 1), (){
                        menu.input!.change(false);
                      });
                      setState(() {
                        selectedMenu = menu;
                      });
                    },
                    riveonInit: (Artboard value) {
                      StateMachineController controller = RiveUtils.getRiveController(value,
                        stateMachineName: menu.stateMachineName,
                      );
                      menu.input = controller.findSMI("active") as SMIBool;
                    },
                    isActive: selectedMenu == menu,
                  )),

                  Padding(padding: const EdgeInsets.only(left: 24, bottom: 32, top: 22),
                    child: AppText(text: "More",color: Colors.white,size: 20,),
                  ),
                  ...sideMenu2.map((menu) =>  SideMenuTile(
                    menu: menu,
                    press: () {
                      menu.input!.change(true);
                      Future.delayed(const Duration(seconds: 1), (){
                        menu.input!.change(false);
                      });
                      setState(() {
                        selectedMenu = menu;
                      });
                    },
                    riveonInit: (Artboard value) {
                      StateMachineController controller = RiveUtils.getRiveController(value,
                        stateMachineName: menu.stateMachineName,
                      );
                      menu.input = controller.findSMI("active") as SMIBool;
                    },
                    isActive: selectedMenu == menu,
                  )),
                  SizedBox(
                    height: 70.h,
                  ),
                  IconButton(
                    icon:lightMode? const Icon(Icons.brightness_4, color: Colors.white,size: 25,):
                    const Icon(Icons.dark_mode, color: Colors.white,size: 25,),
                    tooltip: "Switch between light and dark mode",
                    onPressed: () {
                      ref.read(lightModeProvider.notifier).toggle();
                    }
                  ),
                ],
              ),
            ),
          ),
        ),
    );
  }
}




