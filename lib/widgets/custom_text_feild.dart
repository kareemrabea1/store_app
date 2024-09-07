import 'package:flutter/material.dart';

class CustomFormTextField extends StatelessWidget {
  CustomFormTextField(
      {super.key,
      this.hintText,
      this.onChange,
      this.obscureText = false,
      this.inputType,
      this.labelText});
  String? hintText;
  Function(String)? onChange;
  bool? obscureText;
  TextInputType? inputType;
  String? labelText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: inputType,
      obscureText: obscureText!,
      onChanged: onChange,
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.purple[50]),
          labelText: labelText,
          labelStyle: TextStyle(color: Colors.purple[500]),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.purple.shade800),
            borderRadius: BorderRadius.circular(8),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(),
            borderRadius: BorderRadius.circular(8),
          )),
    );
  }
}
