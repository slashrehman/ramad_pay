import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import '../model/basic_list_model.dart';
import '../utils/text_styles.dart';
import 'package:get/get.dart';
TypeAheadField<DataModel> buildTypeAheadField(
    {required List<DataModel> list, required TextEditingController textEditingController,required Function(DataModel) onSelected, required String label}) {
  return TypeAheadField<DataModel>(
    hideOnEmpty: true,
      hideWithKeyboard: false,
      builder: (BuildContext context, controller, v){
        return TextFormField(
          controller: controller,
          focusNode: v,
          decoration: InputDecoration(
              hintText: "Select $label",
              labelText: label,
              contentPadding: const EdgeInsets.all(8),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12)
              )
          ),
        );
      },
      emptyBuilder: (BuildContext context){
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
          child: Text("No $label found!", style: subHeadingTextStyle),
        );
      },
      decorationBuilder: (context, child) {
        return Material(
          type: MaterialType.card,
          elevation: 2,
          borderRadius: BorderRadius.circular(12),
          child: child,
        );
      },
      controller: textEditingController,
      itemBuilder: (BuildContext context, val){
        return  Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: Text(val.value, style: subHeadingTextStyle),
        );
      },
      onSelected: (value) => onSelected(value),
      suggestionsCallback: (value){
        print("${value} jlkjlj");
        return list.where((element) => element.value.toLowerCase().contains(value.toLowerCase())).toList();
      }
  );
}