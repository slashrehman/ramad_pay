import 'package:flutter/material.dart';
import 'package:ramad_pay/utils/text_styles.dart';
class ProfileTile extends StatelessWidget {
  String title;
  TextEditingController value;
  bool enabled;
  ProfileTile({
    super.key,
    required this.title,
    required this.value,
    required this.enabled
  });

  @override
  Widget build(BuildContext context) {
    return Row(
        children: [
          Text(title, style: const TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600)),
          Flexible(
            child: TextFormField(
              textAlign: TextAlign.right,
              decoration: const InputDecoration(
                  border: InputBorder.none,
              ),
              style: grey16W500(),
              enabled: enabled,
              controller: value,
              validator: (value) {},
              // initialValue: value,
            ),
          ),
        ]
    );
  }
}