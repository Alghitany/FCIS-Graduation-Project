import 'package:flutter/material.dart';
import 'package:project/view/ChangePasswordScreen/change_password_screen.dart';
import 'package:project/widgets/Customized/custom_button.dart';

Widget alertDialog(BuildContext context){
  return AlertDialog(
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
    ),
    content: SizedBox(
      height: 295,
      width: 343,
      child: Padding(
          padding: const EdgeInsets.only(top: 24),
          child: Column(
            children: [
              Image.asset("assets/images/DialogImage.png" , height: 100,width: 100,),

              const SizedBox(height: 24,),

              const Text(
                "Verified Successfully",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  fontFamily: "Poppins",
                  color: Colors.black
                ),
              ),

              const SizedBox(height: 36,),

              CustomButton(
                text: 'Next',
                onPressed: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: ((context)=> const ChangePasswordScreen())));
                },

              )
            ],
          ),),
    ),
  );
}