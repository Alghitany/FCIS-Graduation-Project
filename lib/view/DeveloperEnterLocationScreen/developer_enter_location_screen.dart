import 'package:flutter/material.dart';
import 'package:project/widgets/Customized/custom_button.dart';
import 'package:project/widgets/Customized/custom_text_field.dart';
import 'package:project/widgets/Shared/shared_back_arrow.dart';
import '../../widgets/Customized/custom_label.dart';
import '../BioAndSkillsScreen/bio_and_skills_screen.dart';
import '../validation_text_field.dart';

class DeveloperEnterLocationScreen extends StatefulWidget {
  const DeveloperEnterLocationScreen({super.key});

  @override
  State<DeveloperEnterLocationScreen> createState() => _DeveloperEnterLocationScreenState();
}

class _DeveloperEnterLocationScreenState extends State<DeveloperEnterLocationScreen> {
  GlobalKey <FormState> formState = GlobalKey();
  TextEditingController country = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController address = TextEditingController();



  @override
  void dispose() {
    super.dispose();
    country.dispose();
    city.dispose();
    address.dispose();
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

                    const Text("Enter the location",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          fontFamily: "Poppins",
                          color: Color(0xFF333333)
                      ),
                    ),

                    SizedBox(height: screenHeight * 0.04,),

                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: customLabel("Enter your country"),
                    ),

                    CustomTextField(
                        myController: country,
                        hintText: "Egypt",
                        validator: (value) => validateName(value ?? "")
                    ),

                    SizedBox(height: screenHeight * 0.025),

                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: customLabel("Enter your City"),
                    ),

                    CustomTextField(
                        myController: city,
                        hintText: "Mansoura",
                        validator: (value) => validateName(value ?? "")
                    ),

                    SizedBox(height: screenHeight * 0.025),

                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: customLabel("Enter your Address"),
                    ),

                    CustomTextField(
                      myController: address,
                      hintText: "Street 12,.....",
                    ),

                    SizedBox(height: screenHeight * 0.05),

                    CustomButton(
                      text: "Continue",
                      onPressed: (){
                        if (formState.currentState!.validate()){
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: ((context)=> const BioAndSkillsScreen())));
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
