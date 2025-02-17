import 'package:flutter/material.dart';
import 'package:project/widgets/Customized/custom_button.dart';
import 'package:project/widgets/Customized/multi_line_text_field.dart';
import 'package:project/widgets/Shared/shared_back_arrow.dart';

class BioAndSkillsScreen extends StatelessWidget {
  const BioAndSkillsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.05, vertical: screenHeight * 0.02),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                sharedBackArrow(screenWidth, context),
                SizedBox(
                  height: screenHeight * .039,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text(
                    'Brief Bio',
                    style: TextStyle(
                        color: Color(0xff4D4D4D),
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                SizedBox(
                  height: screenHeight * .0098,
                ),
                MultilineTextField(
                  controller: TextEditingController(),
                  hight: screenHeight * .288,
                  hintText: 'Enter a short bio',
                ),
                SizedBox(
                  height: screenHeight * .0295,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text(
                    'Your Skills',
                    style: TextStyle(
                        color: Color(0xff4D4D4D),
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                SizedBox(
                  height: screenHeight * .0098,
                ),
                MultilineTextField(
                  controller: TextEditingController(),
                  hight: screenHeight * .161,
                  hintText: 'Enter your skills',
                ),
                SizedBox(
                  height: screenHeight * .059,
                ),
                CustomButton(
                  text: 'Continue',
                  onPressed: () {},
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
