import 'package:flutter/material.dart';

Widget sharedBackArrow(double screenWidth, BuildContext context){
  return Align(
    alignment: Alignment.centerLeft,
    child: InkWell(
      onTap: (){
        Navigator.pop(context);
      },
      child: Container(
        width: screenWidth * 0.08,
        height: screenWidth * 0.08,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
                color: const Color(0xFFE6E6E6)
            )
        ),
        child: const Icon(Icons.arrow_back),
      ),
    ),
  );
}