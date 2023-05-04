import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/app_text.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({
    super.key,
    required this.name,
    required this.role,
  });

  final String name, role;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
        backgroundColor: Colors.white24,
        child: Icon(
          CupertinoIcons.person,
          color: Colors.white,
        ),
      ),
      title: AppText(text: name,color: Colors.white, size: 18,),
      subtitle: AppText(text: role,color: Colors.white,size: 16,),
    );
  }
}