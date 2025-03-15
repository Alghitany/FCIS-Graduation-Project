import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../../../widgets/Customized/custom_button.dart';
import '../LoginScreen/login_screen.dart';
import '../SignupSelectionScreen/signup_screen.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),

                const Align(
                  child: Text(
                    "CareerK",
                    style: TextStyle(
                      fontSize: 34,
                      letterSpacing: -0.5,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Poppins",
                      color: Color(0xFF7E89B7),
                    ),
                  ),
                ),

                SizedBox(height: screenHeight * 0.03),

                Image.asset(
                  "assets/images/LoginImage.png",
                  height: screenHeight * 0.4,
                  width: screenWidth * 0.9,
                  fit: BoxFit.contain,
                ),

                SizedBox(height: screenHeight * 0.04),

                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Welcome!",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Poppins",
                      color: Colors.black,
                    ),
                  ),
                ),

                const SizedBox(height: 8),

                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Enjoy Your Journey",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      fontFamily: "Poppins",
                      color: Color(0xFF1A1A1A),
                    ),
                  ),
                ),

                SizedBox(height: screenHeight * 0.08),

                CustomButton(
                  text: "Log in",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const LoginScreen()),
                    );
                  },
                ),

                SizedBox(height: screenHeight * 0.05),

                doNotHaveAnAccountSignup(context),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget doNotHaveAnAccountSignup(BuildContext context){
  return RichText(
    text: TextSpan(
      text: "Don't have an account?",
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        fontFamily: "Poppins",
        color: Color(0xFF666666),
      ),
      children: [
        TextSpan(
          text: " Sign up",
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            fontFamily: "Poppins",
            color: Color(0xFF7E89B7),
          ),
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SignupScreen()),
              );
            },
        ),
      ],
    ),
  );
}