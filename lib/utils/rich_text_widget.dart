import "package:flutter/material.dart";
import "package:ramad_pay/utils/text_styles.dart";

RichText richTextWidget({String? title, String? value}) {
  return RichText(
      text: TextSpan(
          children: [
            TextSpan(
                text: "$title\n",
                style: grey12W500()
            ),
            TextSpan(
                text: "$value",
                style: black16W600
            ),
          ]
      ));
}