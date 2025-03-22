import 'package:flutter/material.dart';

Widget DialogTextButton({
  required onPressed,
  required text,
  required textColor,
  required Color backgroundColor,
  required horizontalPadding,
  required verticalPadding,
  required buttonWidth,
  required buttonHeight,
  required Color borderColor
}){
  return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
            side: BorderSide(color: borderColor),
          ),
        ),
        backgroundColor: WidgetStatePropertyAll(
          backgroundColor,
        ),
        padding: WidgetStateProperty.all<EdgeInsets>(
          EdgeInsets.symmetric(
              horizontal: horizontalPadding,
              vertical: verticalPadding
          ),
        ),
        fixedSize: WidgetStateProperty.all(
            Size(buttonWidth, buttonHeight)
        ),
      ),
      child: Text(
          text,
          style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
            fontSize: 16,
            color: textColor
          ),
      ),
  );
}