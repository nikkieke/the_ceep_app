import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rive/rive.dart';
import 'package:the_ceep_app/core/app_text.dart';
import 'package:the_ceep_app/models/rive_assets_bottom_nav.dart';
import 'package:the_ceep_app/screens/home/widgets/side_menu_tile.dart';

import '../../../core/utils/rive_utils.dart';
import 'info_card.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: 288.w,
          height: double.infinity,
          color: const Color(0xff73009E),
          child: SafeArea(
            child: Column(
              children:  [
                const InfoCard(name: "Abdul Ramanstafan", role: "Admin",),
                Padding(padding: const EdgeInsets.only(left: 24, bottom: 32, top: 16),
                    child: AppText(text: "Browse",color: Colors.white,size: 20,),
                ),
                ...sideMenu.map((menu) =>  SideMenuTile(
                  menu: menu, 
                  press: () {  }, 
                  riveonInit: (Artboard value) {
                    StateMachineController controller = RiveUtils.getRiveController(value,
                      stateMachineName: menu.stateMachineName,
                    );
                    menu.input = controller.findSMI("active") as SMIBool;
                  },
                  isActive: false,
                )),
              ],
            ),
          ),
        ),
    );
  }
}




