import 'package:flutter/material.dart';
import 'package:ramad_pay/app_basics/colors.dart';

class AppTextField extends StatelessWidget {
     AppTextField({
          Key? key,
          this.initialValue = "",
          this.hintText = "",
          this.labelText = "",
          this.enabled = true,
          this.obscureText = false,
          this.prefixIcon,
          this.keyboardType = TextInputType.text,
          this.maxLines = 1,
          this.suffixIcon,
          this.border = false,
          this.textEditingController,
           required this.validator,
           this.onChanged,
          this.isOnChanged = false,  this.readOnly = false
     }) : super(key: key);
     final String initialValue , hintText,labelText;
     var  prefixIcon;
     TextInputType keyboardType;
     final int maxLines;
     final bool border ;
     final bool obscureText;
     final bool enabled;
     final bool isOnChanged;
     final bool readOnly;
     var suffixIcon;
     TextEditingController? textEditingController;
     Function validator;
     Function? onChanged;
     @override
     Widget build(BuildContext context) {
          return  TextFormField(
               onTapOutside: (val){
                    FocusScope.of(context).unfocus();
               },
               style: TextStyle(color: Colors.black),
               autovalidateMode: AutovalidateMode.onUserInteraction,
               obscureText: obscureText,
               validator: (value)=>validator(value),
               onChanged: isOnChanged ? (value)=>onChanged!(value) : (val)=>(){},
               initialValue: initialValue == "" ? null: initialValue,
               enabled: enabled,
               readOnly: readOnly,
               // controller: initialValue == "" ? textEditingController  : null ,
               controller: textEditingController ,
               keyboardType: keyboardType,
               maxLines: maxLines,
               decoration: InputDecoration(
                    border: border == true ? OutlineInputBorder(
                         borderRadius :BorderRadius.circular(12.0),
                    ): null,
                    disabledBorder: border == true ? OutlineInputBorder(
                         borderSide: const BorderSide(
                              color: grey400Color
                         ),
                         borderRadius :BorderRadius.circular(12.0),
                    ): null,
                    hintText: hintText,
                    labelText: labelText,
                    prefixIcon: prefixIcon,
                    suffixIcon: suffixIcon,
                    contentPadding: const EdgeInsets.only(top: 6.0, left: 8.0, right: 4.0, bottom: 4.0)
               ),
               // readOnly: enabled,
          );
     }
}