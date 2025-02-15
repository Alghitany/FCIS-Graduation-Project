import 'package:flutter/material.dart';
import 'package:project/view/LoginScreen/custom_login_with.dart';
import 'package:project/view/ResetPasswordScreen/reset_password_screen.dart';
import 'package:project/widgets/Customized/custom_button.dart';
import 'package:project/widgets/Customized/custom_text_field.dart';

import '../../widgets/Shared/shared_back_arrow.dart';
import '../../widgets/Shared/shared_check_box.dart';
import '../HomePageScreen/home_page_screen.dart';
import '../OnBoardingScreen/on_boarding_screen.dart';
import '../validation_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey <FormState> formState = GlobalKey();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool _isChecked = false;

  @override
  void dispose() {
    super.dispose();
    email.dispose();
    password.dispose();
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
                    sharedBackArrow(screenWidth,context),
        
                    SizedBox(height: screenWidth * 0.05),
        
                    const Align(
                      child: Text("Login to your Account",
                        style: TextStyle(
                          color: Color(0xFF333333),
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          fontFamily: "Poppins",
                        ),
                      ),
                    ),
        
                    SizedBox(height: screenWidth * 0.08),
        
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Email",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          fontFamily: "Poppins",
                          color: Color(0xFF4D4D4D)
                        ),
                      ),
                    ),
        
                    SizedBox(height: screenWidth * 0.03),
        
                    CustomTextField(
                        myController: email,
                        hintText: "Enter your email",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter your email";
                          } else if (!isValidEmail(value)) {
                            return "Enter a valid email address";
                          }
                          return null;
                        },
                    ),
        
                    SizedBox(height: screenWidth * 0.05),
        
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Password",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            fontFamily: "Poppins",
                            color: Color(0xFF4D4D4D)
                        ),
                      ),
                    ),
        
                    SizedBox(height: screenWidth * 0.03),
        
                    CustomTextField(
                      myController: password,
                      hintText: "Enter your password",
                      validator: (value) => validatePassword(value ?? ""),
                      isPassword: true,
                    ),
        
                    SizedBox(height: screenWidth * 0.02),
        
                    Row(
                      children: [
                        sharedCheckBox(_isChecked, (value) {
                          setState(() {
                            _isChecked = value!;
                          });
                        }),
        
                        const Text(
                            "Remember Me ",
                            style: TextStyle(
                              color: Color(0xFF4D4D4D),
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              fontFamily: "Poppins",
                          ),
                        ),
        
                        const Spacer(),
        
                        InkWell(
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: ((context)=> const ResetPasswordScreen()))
                            );
                          },
                          child: const Text(
                            "Forget Password?",
                            style: TextStyle(
                              color: Color(0xFF6B78AC),
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              fontFamily: "Poppins",
                            ),
                          ),
                        )
                      ],
                    ),
        
                    SizedBox(height: screenWidth * 0.08),
        
                    CustomButton(
                        text: "Log in",
                        onPressed: (){
                          if (formState.currentState!.validate()) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const HomePageScreen()),
                            );
                          }                      },
                    ),
        
                    SizedBox(height: screenWidth * 0.06),
        
                    const Row(
                      children: [
                        Expanded(
                          child: Divider(
                            color: Color(0xFF999999), // Divider color
                            thickness: 1, // Divider thickness
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12.0), // Space between dividers
                          child:Text("Or",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              fontFamily: "Poppins",
                            ),
                          )
                        ),
                        Expanded(
                          child: Divider(
                            color: Color(0xFF999999), // Divider color
                            thickness: 1, // Divider thickness
                          ),
                        ),
                      ],
                    ),
        
                    SizedBox(height: screenWidth * 0.05),
        
                    CustomLoginWith(
                      text: 'Login with Google',
                      icon: 'assets/icons/Google.png',
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: ((context)=> const HomePageScreen())));
                      },),
        
                    SizedBox(height: screenWidth * 0.03),
        
                    CustomLoginWith(
                      text: 'Login with Facebook',
                      icon: 'assets/icons/Facebook.png',
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: ((context)=> const HomePageScreen())));
                      },),
        
                    SizedBox(height: screenWidth * 0.03),
        
                    CustomLoginWith(text: 'Login with GitHub',
                      icon: 'assets/icons/GitHub.png',
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: ((context)=> const HomePageScreen())));
                      },
                    ),
        
                    SizedBox(height: screenWidth * 0.08),
        
                    doNotHaveAnAccountSignup(context)
                  ],
                ),
              ),
            )
        ),
      ),
    );
  }
}
