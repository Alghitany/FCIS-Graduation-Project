import 'package:flutter/material.dart';

class CourseNameContainer extends StatelessWidget {
  const CourseNameContainer({required this.name, super.key});
  final String name;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
      height: 30,
      decoration: BoxDecoration(
        color: Color(0xffF2F2F2),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Center(
        child: Text(
          name,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}
