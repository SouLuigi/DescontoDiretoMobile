import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class LoginTextInput extends StatelessWidget {
  final String name;
  final String label;
  final IconData? prefixIcon;
  final bool obscureText;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;

  const LoginTextInput({
    Key? key,
    required this.name,
    required this.label,
    this.prefixIcon,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.validator,
}): super(key: key);
  @override
  Widget build(BuildContext context) {
     return FormBuilderTextField(
       name: name,
       decoration: InputDecoration(
         labelText: label,
         prefixIcon: prefixIcon != null? Icon(prefixIcon): null,
         border: OutlineInputBorder(),
       ),
       obscureText: obscureText,
       keyboardType: keyboardType,
       validator: validator,
     );
  }
}