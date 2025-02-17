import 'package:flutter/material.dart';

class MultilineTextField extends StatelessWidget {
  const MultilineTextField(
      {super.key,
      required this.controller,
      required this.hight,
      this.hintText});
  final TextEditingController controller;
  final double hight;
  final String? hintText;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: hight,
      child: TextField(
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
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            border: OutlineInputBorder()),
      ),
    );
  }
}
