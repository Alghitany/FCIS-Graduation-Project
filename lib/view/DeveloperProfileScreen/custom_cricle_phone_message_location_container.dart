import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Widget CustomCirclePhoneMessageLocationContainer({required icon, required onTap}){
  return InkWell(
    onTap: onTap,
    child: Container(
      width: 56,
      height: 56,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32), // Updated radius
        border: Border.all(
          color: Color(0xFF3F4D88), // Border color
          width: 1, // Adjust as needed
        ),
      ),
      alignment: Alignment.center, // Center the icon
      child: SvgPicture.asset(
        icon,
        height: 24,
        width: 24,
        color: Color(0xFF465697),
      ),
    ),
  );
}