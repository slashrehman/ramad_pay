import 'package:flutter/material.dart';

import '../app_basics/colors.dart';

class ListTileWidget extends StatelessWidget {
  ListTileWidget({
    super.key,
    this.title,
    this.subtitle,
    this.onTap
  });
  String? title, subtitle;
  VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return  ListTile(
      splashColor: whiteColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 0),
      title: Text("$title", style:const TextStyle(  fontSize: 16),),
      subtitle: Text("$subtitle", style: const TextStyle( fontSize: 14)),
      trailing: const Icon(Icons.arrow_forward_ios, size: 20,),
    );
  }
}