import 'package:flutter/material.dart';

Widget sharedCheckBox(bool isChecked, void Function(bool?) onChanged){
  return SizedBox(
    width: 24.0,
    height: 24.0,
    child: Checkbox(
      //TODO Apply SharedPreference
      value: isChecked,
      onChanged: onChanged,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      side: const BorderSide(
        color: Color(0xFF4D4D4D),
        width: 1.0,
      ),
      activeColor: Colors.blue,
      checkColor: Colors.white,
    ),
  );
}