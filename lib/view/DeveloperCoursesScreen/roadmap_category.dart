import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RoadmapCategory extends StatelessWidget {
  final String icon;
  final String roadmapText;
   const RoadmapCategory({
    super.key,
    required this.roadmapText,
    required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Circular Icon Container
        Container(
          width: 60,
          height: 60,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xFF3F4A7A), // Dark blue background
          ),
          child: Center(
            child: SvgPicture.asset(
              icon, // Replace with your SVG
              width: 32,
              height: 32,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 8), // Space between icon and text
        Text(
          roadmapText,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Color(0xFFCCD1E4), // Light gray text
          ),
        ),
      ],
    );
  }
}
