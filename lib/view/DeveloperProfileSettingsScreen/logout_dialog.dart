import 'package:flutter/material.dart';

import 'dialog_text_button.dart';

Widget LogoutDialog(BuildContext context){
  return AlertDialog(
    backgroundColor: Colors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(16),
        topRight: Radius.circular(16),
      ),
    ),
    content:  SizedBox(
      height: 197,
      width: 375,
      child: Column(
        children: [
          const SizedBox(height: 32,),
          const Text(
            'Logout',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 4,),
          const Text(
            'Are you sure you want to log out?',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 32,),
          Row(
            children: [
              const Spacer(),
              DialogTextButton(
                onPressed: (){
                  //TODO
                },
                text: 'Cancel',
                textColor: const Color(0xFF5967A2),
                backgroundColor: Colors.white,
                horizontalPadding: 0.0,
                verticalPadding: 0.0,
                buttonWidth: 120.0,
                buttonHeight: 40.0,
                borderColor: const Color(0xFF465697)
              ),
              const SizedBox(width: 15,),
              DialogTextButton(
                onPressed: (){
                  //TODO
                },
                text: 'Yes,Logout',
                textColor: Colors.white,
                backgroundColor: const Color(0xFF465697),
                horizontalPadding: 0.0,
                verticalPadding: 0.0,
                buttonWidth: 120.0,
                buttonHeight: 40.0,
                borderColor: const Color(0xFF465697)
              ),
            ],
          )
        ],
      ),
    ),
  );
}