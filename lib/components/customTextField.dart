import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final IconData? icon;
  final String? Function(String? text)? validator;
  final void Function(String? text)? onSaved;

  const CustomTextField(
      {Key? key,
      required this.label,
      required this.icon,
      required this.validator,
      required this.onSaved})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      onSaved: onSaved,
      decoration: InputDecoration(
        labelText: label,
        hintText: 'Digite o $label',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        prefixIcon: icon == null ? null : Icon(icon),
      ),
    );
  }
}
