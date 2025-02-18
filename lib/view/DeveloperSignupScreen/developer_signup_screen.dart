import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:project/view/DeveloperFillProfileScreen/developer_fill_profile_screen.dart';
import 'package:project/widgets/Customized/custom_button.dart';
import 'package:project/widgets/Customized/custom_text_field.dart';
import 'package:project/widgets/Shared/shared_back_arrow.dart';

import '../../widgets/Customized/custom_label.dart';
import '../../widgets/Shared/shared_check_box.dart';
import '../validation_text_field.dart';

class DeveloperSignupScreen extends StatefulWidget {
  const DeveloperSignupScreen({super.key});

  @override
  State<DeveloperSignupScreen> createState() => _DeveloperSignupScreenState();
}

class _DeveloperSignupScreenState extends State<DeveloperSignupScreen> {
  GlobalKey <FormState> formState = GlobalKey();
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  bool _isChecked = false;



  @override
  void dispose() {
    super.dispose();
    firstName.dispose();
    lastName.dispose();
    email.dispose();
    password.dispose();
    confirmPassword.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05, vertical: screenHeight * 0.02),
                child: Form(
                  key: formState,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      sharedBackArrow(screenWidth, context),

                      SizedBox(height: screenHeight * 0.015,),

                      const Text("Developer",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          fontFamily: "Poppins",
                          color: Color(0xFF333333)
                        ),
                      ),

                      SizedBox(height: screenHeight * 0.01,),

                      const Text("Please enter the following data",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Poppins',
                          color: Color(0xFF4D4D4D)
                        ),
                      ),

                      SizedBox(height: screenHeight * 0.02,),

                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: customLabel("First Name"),
                      ),

                      CustomTextField(
                          myController: firstName,
                          hintText: "Enter first name",
                          validator: (value) => validateName(value ?? "")
                      ),

                      SizedBox(height: screenHeight * 0.01),

                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: customLabel("Last Name"),
                      ),

                      CustomTextField(
                          myController: lastName,
                          hintText: "Enter last name",
                          validator: (value) => validateName(value ?? "")
                      ),

                      SizedBox(height: screenHeight * 0.01),

                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: customLabel("Email"),
                      ),

                      CustomTextField(
                          myController: email,
                          hintText: "Enter email",
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter your email";
                            } else if (!isValidEmail(value)) {
                              return "Enter a valid email address";
                            }
                            return null;
                          },
                      ),

                      SizedBox(height: screenHeight * 0.01),

                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: customLabel("Password"),
                      ),

                      CustomTextField(
                        myController: password,
                        hintText: "Enter password",
                        validator: (value) => validatePassword(value ?? ""),
                        isPassword: true,
                      ),

                      SizedBox(height: screenHeight * 0.01),

                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: customLabel("Confirm Password"),
                      ),

                      CustomTextField(
                        myController: confirmPassword,
                        hintText: "Confirm password",
                        validator: (value) {
                          return confirmPasswordValidator(password.text, value ?? '');
                        },
                        isPassword: true,
                      ),

                      SizedBox(height: screenHeight * 0.01),

                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Row(
                          children: [
                            sharedCheckBox(_isChecked, (value) {
                              setState(() {
                                _isChecked = value!;
                              });
                            }),

                            const SizedBox(width: 8,),

                            RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "Poppins",
                                  color: Color(0xFF1A1A1A),
                                ),
                                children: [
                                  const TextSpan(text: "I agree with the "),
                                  TextSpan(
                                    text: "privacy policy",
                                    style: const TextStyle(
                                      color: Color(0xCC235347), // Change to match your design
                                      fontWeight: FontWeight.w500,
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        //TODO Add ur privacy and policy
                                      },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                            SizedBox(height: screenHeight * 0.05),

                            CustomButton(
                              text: "Next step",
                              onPressed: (){
                                if (formState.currentState!.validate() && _isChecked){
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(builder: ((context)=> const DeveloperFillProfileScreen())),
                                      (route)=>false
                                  );
                                }
                              },
                            )
                    ],
                  ),
                ),
            ),
          )),
    );
  }
}
