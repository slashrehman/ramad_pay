import 'package:flutter/material.dart';
import 'package:ramad_pay/utils/utils.dart';

import '../model/basic_list_model.dart';

class CustomDropDown extends StatelessWidget {
  Function(DataModel) onSelected;
  List<DataModel> list;
  String title;
  CustomDropDown({
    super.key,
    required this.onSelected,
    required this.list,
    required this.title
  });

  @override
  Widget build(BuildContext context) {
    return DropdownMenuTheme(
      data: DropdownMenuThemeData(
          menuStyle: MenuStyle(
              surfaceTintColor:
              MaterialStateColor.resolveWith((states) => Colors.white),
              backgroundColor:
              MaterialStateColor.resolveWith((states) => Colors.white),
              shape: MaterialStateProperty.resolveWith(
                      (states) => RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ))),
          inputDecorationTheme: InputDecorationTheme(
              contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
              border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(12)))),
      child: DropdownMenu<DataModel>(
        expandedInsets: const EdgeInsets.symmetric(horizontal: 8),
        onSelected: (value) => onSelected(value!),
        label:  Text(title),
        dropdownMenuEntries:
        List.generate(list.length, (index) {
          return (DropdownMenuEntry(
            style: ButtonStyle(
              enableFeedback: true
            ),
            label: "${list[index].value}",
            value: list[index],
            labelWidget: SizedBox(
              width: screenWidth -40,
              child: Text(list[index].value,
                style: TextStyle(overflow: TextOverflow.fade, ),
              ),
            ),
          ));
        }),
      ),
    );
  }
}

