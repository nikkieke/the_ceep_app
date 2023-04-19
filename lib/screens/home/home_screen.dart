import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:the_ceep_app/core/app_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                      SvgPicture.asset(
                        "assets/images/side_nav.svg", width: 30.w,),
                    Row(
                      children: [
                        AppText(
                            text: 'Hello! Dominos Pizza', size: 18,),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Image.asset(
                            "assets/images/dominos_pizza.png", width: 30.w,),
                        ),

                      ],
                    ),
                  ],
                ),
              ),
              ListView(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: [
                  ...listCards
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ListCard extends StatelessWidget {
  final Icon icon;
  final AppText appText;

  const ListCard({
    Key? key, required this.icon, required this.appText
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
      child: Card(
        elevation: 5,
        shadowColor: Colors.black45,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      height: 25.h,
                      width: 25.w,
                      decoration:   BoxDecoration(
                          color: Colors.purple[50],
                          borderRadius: const BorderRadius.all(Radius.circular(5)),
                      ),
                      child: icon,
                    ),
                  ),
                  appText
                ],
              ),
              const Icon(Icons.arrow_back_ios_new_rounded, size: 18,)
            ],
          ),
        ),
      ),
    );
  }
}

List<ListCard> listCards = [
  ListCard(icon: const Icon(Icons.person), appText: AppText(text: "Add Staff",size: 15,)),
  ListCard(icon: const Icon(Icons.person_add_alt_rounded), appText: AppText(text: "Add Customers",size: 15,)),
  ListCard(icon: const Icon(Icons.insert_chart), appText: AppText(text: "Create Invoice",size: 15,)),
  ListCard(icon: const Icon(Icons.inventory_sharp), appText: AppText(text: "Inventory Management",size: 15,)),
  ListCard(icon: const Icon(Icons.add_box), appText: AppText(text: "My Products",size: 15,)),
];