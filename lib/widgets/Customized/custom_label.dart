import 'package:flutter/cupertino.dart';

Widget customLabel(String labelText){
  return Align(
    alignment: Alignment.centerLeft,
    child: Text(labelText,
      style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          fontFamily: "Poppins",
          color: Color(0xFF4D4D4D)
      ),
    ),
  );
}