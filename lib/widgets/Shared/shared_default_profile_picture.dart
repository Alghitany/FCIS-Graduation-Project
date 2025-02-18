import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Widget sharedDefaultProfilePicture(double screenWidth, double screenHeight, void Function()? onTap){
  return Stack(
    clipBehavior: Clip.none,
    children: [
      CircleAvatar(
        radius: screenWidth * 0.20,
        backgroundColor: const Color(0xFFE8F1FF),
        child: Padding(
          padding: EdgeInsets.only(top: screenHeight * 0.07),
          child: SvgPicture.asset(
            "assets/icons/FilledProfileIcon.svg",
            height: screenWidth * 0.3,
            width: screenWidth * 0.3,
            colorFilter: const ColorFilter.mode(
              Color(0xFFF5F9FF),
              BlendMode.srcIn,
            ),
            fit: BoxFit.contain,
          ),
        ),
      ),
      Positioned(
        bottom: 5,
        right: 5,
        child: InkWell(
          onTap: onTap,
          child: CircleAvatar(
            radius: screenWidth * 0.07,
            backgroundColor: const Color(0xFF167F71),
            child: SvgPicture.asset(
              "assets/icons/EditIcon.svg",
              height: screenWidth * 0.06,
              width: screenWidth * 0.06,
            ),
          ),
        ),
      ),
    ],
  );
}