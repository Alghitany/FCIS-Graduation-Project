import 'package:flutter/material.dart';
import 'package:project/view/ChangePasswordSuccessScreen/change_password_success_screen.dart';
import 'package:project/widgets/Shared/shared_back_arrow.dart';

import '../../widgets/Customized/custom_button.dart';
import '../../widgets/Customized/custom_text_field.dart';
import '../validation_text_field.dart';


class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  GlobalKey <FormState> formState = GlobalKey();
  TextEditingController password = TextEditingController();
  TextEditingController newPassword = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    password.dispose();
    newPassword.dispose();
  }
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
              child: Form(
                key: formState,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    sharedBackArrow(screenWidth, context),

                    SizedBox(height: screenWidth * 0.05,),

                    const Text(
                      "Change password",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          fontFamily: "Poppins",
                          color: Color(0xFF333333)
                      ),
                    ),

                    SizedBox(height: screenWidth * 0.08,),

                    Image.asset(
                      'assets/images/ChangePasswordImage.png',
                      height: screenWidth * 0.8,
                      width: screenWidth * 0.9,
                    ),

                    SizedBox(height: screenWidth * 0.06,),

                    RichText(
                      textAlign: TextAlign.center,
                      text: const TextSpan(
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          fontFamily: "Poppins",
                          color: Color(0xFFA2AACA),
                        ),
                        children: [
                          TextSpan(text: "Your new password must be different\n"),
                          TextSpan(text: "from previously used passwords."),
                        ],
                      ),
                    ),

                    SizedBox(height: screenWidth * 0.06),

                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Confirm password",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            fontFamily: "Poppins",
                            color: Color(0xFF4D4D4D)
                        ),
                      ),
                    ),

                    SizedBox(height: screenWidth * 0.03,),

                    CustomTextField(
                      myController: password,
                      hintText: "Enter your password",
                      validator: (value) => validatePassword(value ?? ""),
                      isPassword: true,
                    ),

                    SizedBox(height: screenWidth * 0.05,),

                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Confirm password",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            fontFamily: "Poppins",
                            color: Color(0xFF4D4D4D)
                        ),
                      ),
                    ),

                    SizedBox(height: screenWidth * 0.03,),

                    CustomTextField(
                      myController: newPassword,
                      hintText: "Confirm your password",
                      validator: (value) {
                        return confirmPasswordValidator(password.text, value ?? '');
                      },
                      isPassword: true,
                    ),

                    SizedBox(height: screenWidth * 0.08,),

                    CustomButton(
                      text: "Create New Password",
                      onPressed: (){
                        if(formState.currentState!.validate()){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const ChangePasswordSuccessScreen()),
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            )
        ),
      ),
    );
  }
}
