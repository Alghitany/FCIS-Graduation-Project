import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomTextField extends StatefulWidget {
  final String? Function(String?)? validator;
  final TextEditingController myController;
  final String hintText;
  final bool isPassword;

  const CustomTextField({super.key,
    this.validator,
    required this.myController,
    required this.hintText,
    this.isPassword = false});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _isObscured = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validator,
      controller: widget.myController,
      obscureText: widget.isPassword ? _isObscured : false,
      decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: const TextStyle(
            fontSize: 14,
            fontFamily: "Poppins",
            fontWeight: FontWeight.w500,
            color: Color(0xFFE6E6E6),
          ),
        contentPadding: const EdgeInsets.only(top: 12, bottom: 12, left: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color(0xFF97A1CF)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color(0xFF97A1CF)),
        ),
        suffixIcon: widget.isPassword
            ? IconButton(
          icon: SvgPicture.asset(
            _isObscured ? "assets/icons/EyeOpen.svg" : "assets/icons/EyeOpen.svg",
            height: 15,
            width: 23,
          ),
          onPressed: () {
            setState(() {
              _isObscured = !_isObscured; // Toggle visibility
            });
          },
        ): null,
      ),
    );
  }
}
