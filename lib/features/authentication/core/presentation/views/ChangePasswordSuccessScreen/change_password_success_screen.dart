import 'package:flutter/material.dart';
import 'package:project/widgets/Customized/custom_button.dart';

import '../LoginScreen/login_screen.dart';

class ChangePasswordSuccessScreen extends StatelessWidget {
  const ChangePasswordSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 24.0),
                  child: Image.asset(
                    'assets/images/ChangePasswordSuccessImage.png',
                    height: screenHeight * 0.4,
                    width: screenWidth * 0.9,
                    fit: BoxFit.contain,
                  ),
                ),

                SizedBox(height: screenHeight * 0.05,),

                RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Poppins",
                      color: Color(0xFF333333),
                    ),
                    children: [
                      TextSpan(text: "You have successfully change password.\n"),
                      TextSpan(text: "Please use the new password when Sign in."),
                    ],
                  ),
                ),

                SizedBox(height: screenHeight * 0.08,),

                CustomButton(
                    text: "Ok",
                    onPressed: (){
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: ((context)=> const LoginScreen())),
                          (route) => false
                      );
                    },)
              ],
            ),
          )
      ),
    );
  }
}
