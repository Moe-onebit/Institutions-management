import 'dart:ffi';

import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  InputField({
    this.labelText,
    this.textInputAction,
     this.validator,
     this.onSaved,
  required this.padding, required this.borderSide,  this.hintText, required this.color, required this.inputBorder, required this.obscureText, required this.enableSuggestion, required this.autoCorrect
});
  final String? labelText;
  final TextInputAction? textInputAction; 
  final EdgeInsets padding;
  final BorderSide borderSide;
  final String? hintText;
  final Color color;
  final InputBorder inputBorder;
  final bool obscureText;
  final bool enableSuggestion;
  final bool autoCorrect;
  final Function(String?)? onSaved;
  final FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context) {
    FocusNode focusNode = FocusNode();
    return
        Container(
          padding: padding,
          decoration:  BoxDecoration(
              border: Border(bottom: borderSide)),
          child:  TextFormField(
            onTap: ()=>focusNode.requestFocus(),
            onSaved: onSaved,
            validator: validator,
            decoration: InputDecoration(
              labelText: labelText,
                hintText: hintText,
                hintStyle: TextStyle(color: color),
                border: inputBorder),
                obscureText: obscureText,
                enableSuggestions: enableSuggestion,
                autocorrect: autoCorrect,
                textInputAction: textInputAction,
                autofocus: true,
          ),
        );

  }
}
