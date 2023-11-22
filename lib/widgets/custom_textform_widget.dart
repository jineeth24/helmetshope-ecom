
import 'package:flutter/material.dart';

class CustomTextFormWidget extends StatelessWidget {
  const CustomTextFormWidget({
    super.key,
    required this.formController,
    required this.hintText,
    this.obscureText = false,
    this.keyboardType=TextInputType.name
  });

  final TextEditingController formController;
  final String hintText;
  final bool obscureText;
 final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.name,
      controller: formController,
      obscureText: false,
      decoration: InputDecoration(
        hintText: hintText,
       // prefixIcon: const Icon(Icons.lock),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return "enter password";
        }
        return null;
      },
    );
  }
}
// 