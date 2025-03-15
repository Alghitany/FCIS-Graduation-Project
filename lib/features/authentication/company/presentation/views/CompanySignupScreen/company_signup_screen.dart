import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:project/widgets/Customized/custom_button.dart';
import 'package:project/widgets/Customized/custom_text_field.dart';
import 'package:project/widgets/Shared/shared_back_arrow.dart';

import '../../../../../../view/CompanyFillProfileScreen/company_fill_profile_screen.dart';
import '../../../../../../view/validation_text_field.dart';
import '../../../../../../widgets/Customized/custom_label.dart';
import '../../../../../../widgets/Shared/shared_check_box.dart';


class CompanySignupScreen extends StatefulWidget {
  const CompanySignupScreen({super.key});

  @override
  State<CompanySignupScreen> createState() => _CompanySignupScreenState();
}

class _CompanySignupScreenState extends State<CompanySignupScreen> {
  GlobalKey <FormState> formState = GlobalKey();
  TextEditingController companyName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  bool _isChecked = false;



  @override
  void dispose() {
    super.dispose();
    companyName.dispose();
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

                    SizedBox(height: screenHeight * 0.02,),

                    const Text("Company",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          fontFamily: "Poppins",
                          color: Color(0xFF333333)
                      ),
                    ),

                    SizedBox(height: screenHeight * 0.015,),

                    const Text("Please enter the following data",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Poppins',
                          color: Color(0xFF4D4D4D)
                      ),
                    ),

                    SizedBox(height: screenHeight * 0.04,),

                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: customLabel("Company Name"),
                    ),

                    CustomTextField(
                        myController: companyName,
                        hintText: "Enter name",
                        validator: (value) => validateName(value ?? "")
                    ),

                    SizedBox(height: screenHeight * 0.025),

                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: customLabel("Email Address"),
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

                    SizedBox(height: screenHeight * 0.025),

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

                    SizedBox(height: screenHeight * 0.025),

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

                    SizedBox(height: screenHeight * 0.025),

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
                      text: "Continue",
                      onPressed: (){
                        if (formState.currentState!.validate() && _isChecked){
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(builder: ((context)=> const CompanyFillProfileScreen())),
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
