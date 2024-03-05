import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ramad_pay/app_basics/images.dart';


class AddIconWidget extends StatelessWidget {

  AddIconWidget({super.key, required this.onTap});
  VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return
      GestureDetector(
        onTap:onTap,
        child: SvgPicture.asset(
          addButton,
          height: 32,
          width:32,
        ),
      );

    //IconButton(onPressed: onTap, icon: Icon(Icons.search, color: Colors.black54,),);
  }
}