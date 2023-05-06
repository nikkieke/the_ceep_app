
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/app_text.dart';
import '../../../core/lightmode_notifier.dart';

class ListCard extends ConsumerWidget {
  final Icon icon;
  final AppText appText;

  const ListCard({
    Key? key, required this.icon, required this.appText
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var lightMode = ref.watch(lightModeProvider);
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
      child: Card(
        elevation: 5,
        shadowColor: Colors.black45,
        color: lightMode? Colors.white: Colors.black26,
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
                        color: lightMode? Colors.purple[50]: Colors.purple,
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
