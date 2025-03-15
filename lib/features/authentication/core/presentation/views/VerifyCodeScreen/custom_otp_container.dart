import 'package:flutter/material.dart';

class CustomOTPContainer extends StatelessWidget {
  final TextEditingController controller; // Controller for the input
  final FocusNode focusNode; // Focus node for the input
  final void Function(String) onChanged; // Callback for input changes

  const CustomOTPContainer({
    required this.controller,
    required this.focusNode,
    required this.onChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72,
      width: 72,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: const Color(0xFF97A1CF),
          width: 1,
        ),
      ),
      child: Center(
        child: TextField(
          controller: controller,
          focusNode: focusNode,
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          maxLength: 1,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          decoration: const InputDecoration(
            counterText: "", // Hide the counter text
            border: InputBorder.none, // Remove the border
          ),
          onChanged: onChanged, // Trigger callback on text change
        ),
      ),
    );
  }
}
