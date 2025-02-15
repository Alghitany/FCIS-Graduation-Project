import 'package:flutter/material.dart';
import 'package:project/widgets/Customized/custom_button.dart';
import 'package:project/widgets/Customized/custom_text_field.dart';
import 'package:project/widgets/Shared/shared_back_arrow.dart';

import '../VerifyCodeScreen/verify_code_screen.dart';
import '../validation_text_field.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  GlobalKey <FormState> formState = GlobalKey();
  TextEditingController email = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    email.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double screenWidth = size.width;
    final double screenHeight = size.height;

    return  Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                child: Form(
                    key: formState,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
        
                        sharedBackArrow(screenWidth * 0.9, context),
        
                        SizedBox(height: screenHeight * 0.01,),
        
                        const Text(
                          "Reset Password",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                            fontFamily: "Poppins",
                            color: Color(0xFF333333)
                          ),
                        ),
        
                        SizedBox(height: screenHeight * 0.02),
        
                        Image.asset(
                          'assets/images/ForgetPasswordImage.png',
                          height: screenHeight * 0.35,
                          width: screenWidth * 0.9,
                          fit: BoxFit.contain,
                        ),
        
                        SizedBox(height: screenHeight * 0.02),
        
                        RichText(
                          textAlign: TextAlign.center,
                          text: const TextSpan(
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              fontFamily: "Poppins",
                              color: Color(0xFFA2AACA),
                            ),
                            children: [
                              TextSpan(text: "We will email you\n"),
                              TextSpan(text: "a link to reset your password"),
                            ],
                          ),
                        ),

                        SizedBox(height: screenHeight * 0.03),
        
                        CustomTextField(
                            myController: email,
                            hintText: "Enter Your Email",
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter your email";
                              } else if (!isValidEmail(value)) {
                                return "Enter a valid email address";
                              }
                              return null;
                            },
                        ),

                        SizedBox(height: screenHeight * 0.05),
        
                        CustomButton(
                            text: "Send OTP",
                          onPressed: () {
                            if (formState.currentState!.validate()) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => VerifyCodeScreen()),
                              );
                            }
                          },),

                        SizedBox(height: screenHeight * 0.03),

                      ],
                    )
                ),
            )
        ),
      ),
    );
  }
}
