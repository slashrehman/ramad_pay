import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ramad_pay/app_basics/colors.dart';

import 'box_decoration.dart';

class ClickableSvg extends StatelessWidget {
  ClickableSvg({super.key, this.onTap, this.color, this.iconUrl});
  VoidCallback? onTap;
  Color? color;
  String? iconUrl;
  @override
  Widget build(BuildContext context) {
    return
      GestureDetector(
        onTap: onTap,
        child: SvgPicture.asset(
          iconUrl!,
          height: 27,
          width: 27,
          color: color,
        ),
      );
  }
}