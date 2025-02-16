import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DateOfBirthField extends StatefulWidget {
  final TextEditingController controller;

  const DateOfBirthField({super.key, required this.controller});

  @override
  DateOfBirthFieldState createState() => DateOfBirthFieldState();
}

class DateOfBirthFieldState extends State<DateOfBirthField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      readOnly: true,
      validator: (value) => value == null || value.isEmpty ? "Please select a date" : null,
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(1900),
          lastDate: DateTime.now(),
        );

        if (pickedDate != null) {
          setState(() {
            widget.controller.text = "${pickedDate.year}-${pickedDate.month}-${pickedDate.day}";
          });
        }
      },
      decoration: InputDecoration(
        hintText: 'Date of Birth',
        hintStyle: const TextStyle(
          fontFamily: 'Poppins',
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Color(0xFFD3D3D3),
        ),
        suffixIcon: IconButton(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          icon: SvgPicture.asset(
            "assets/icons/CalenderIcon.svg",
            height: 18,
            width: 18,
            colorFilter: const ColorFilter.mode(
              Color(0xFFE6E6E6),
              BlendMode.srcIn,
            ),
          ),
          onPressed: () async {
            DateTime? pickedDate = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(1900),
              lastDate: DateTime.now(),
            );

            if (pickedDate != null) {
              setState(() {
                widget.controller.text = "${pickedDate.year}-${pickedDate.month}-${pickedDate.day}";
              });
            }
          },
        ),
        contentPadding: const EdgeInsets.only(top: 12, bottom: 12, left: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Color(0xFFB0B8E3),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Color(0xFFB0B8E3),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Color(0xFFB0B8E3),
          ),
        ),
      ),
    );
  }
}
