import 'package:flutter/material.dart';

import '../../view/validation_text_field.dart';

class MultilineTextField extends StatelessWidget {
  const MultilineTextField(
      {super.key,
      required this.controller,
      required this.height,
      this.hintText});
  final TextEditingController controller;
  final double height;
  final String? hintText;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height,
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.multiline,
        minLines: 13,
        maxLines: 15,
        decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xff97A1CF))),
            hintText: hintText,
            hintStyle: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(0xffE6E6E6)),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            border: const OutlineInputBorder()
        ),
        validator: validateDescription,
      ),
    );
  }
}
