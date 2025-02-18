import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project/view/DeveloperSignupScreen/developer_signup_screen.dart';

import '../../widgets/Shared/shared_back_arrow.dart';
import '../CompanySignupScreen/company_signup_screen.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body:SafeArea(
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  sharedBackArrow(screenWidth, context),

                  SizedBox(height: screenHeight * 0.02,),

                  Image.asset(
                      'assets/images/SplashLogo.png',
                    height: screenHeight * 0.3,
                    width: screenWidth * 0.5,
                    fit: BoxFit.cover,),


                  const Text(
                    "Please Select one of the following",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      fontFamily: "Poppins",
                    ),
                    textAlign: TextAlign.center,
                  ),

                  SizedBox(height: screenHeight * 0.04),

                  const Text(
                    "You are A",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Poppins",
                    ),
                  ),

                  SizedBox(height: screenHeight * 0.07,),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        userContainer("assets/icons/OutlinedPerson.svg","Developer",context, screenHeight, screenWidth),
                        userContainer("assets/icons/OutlinedCompany.svg", "Company",context, screenHeight, screenWidth)
                      ],
                    ),
                  )
                ],
              ),)
      ),
    );
  }
  Widget userContainer(String iconName, String userText , BuildContext context, double screenHeight, double screenWidth){
    return InkWell(
      onTap: (){
        if(userText == "Developer"){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> const DeveloperSignupScreen()));
        }else if(userText == "Company"){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> const CompanySignupScreen()));
        }
      },
      child: Container(
        height: screenHeight * 0.15,
        width: screenWidth * 0.4,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
                color: const Color(0xFFA4AED5)
            )
        ),
        child: Padding(
          padding: EdgeInsets.only(top: screenHeight * 0.02, left: screenWidth * 0.05),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(
                iconName,
                height: screenHeight * 0.03,
                width: screenWidth * 0.06,
              ),
      
              SizedBox(height: screenHeight * 0.005),
      
              Text(
                userText,
                style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Poppins',
                    color: Color(0xFF808080)
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

