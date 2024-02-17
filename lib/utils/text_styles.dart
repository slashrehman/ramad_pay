import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../app_basics/colors.dart';

TextStyle   headingTextStyle =
   const TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w700,
  );


TextStyle  subHeadingTextStyle  = const TextStyle(
  fontWeight: FontWeight.bold,
  color: blackColor,
  fontSize: 18,
);
TextStyle  black16W600  = const TextStyle(
  fontWeight: FontWeight.w600,
  color: blackColor,
  fontSize: 18,
);
TextStyle grey12W500() {
  return GoogleFonts.inter(
    textStyle: TextStyle(
        color:  greyColor,
        fontSize: 12,
        fontWeight: FontWeight.w500),
  );
}

TextStyle  underlineTextStyle = const TextStyle(
decoration: TextDecoration.underline,
fontSize: 20,
color: secondaryColor,
);