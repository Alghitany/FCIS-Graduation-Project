import 'package:flutter/material.dart';
import 'package:project/view/CompanyInformationScreen/company_information_screen.dart';
import 'package:project/widgets/Customized/custom_button.dart';
import 'package:project/widgets/Customized/multi_line_text_field.dart';

import '../../widgets/Customized/custom_label.dart';
import '../../widgets/Customized/custom_text_field.dart';
import '../../widgets/Shared/shared_back_arrow.dart';
import '../../widgets/Shared/profile_component_screen.dart';

class CompanyFillProfileScreen extends StatefulWidget {
  const CompanyFillProfileScreen({super.key});

  @override
  State<CompanyFillProfileScreen> createState() => _CompanyFillProfileScreenState();
}

class _CompanyFillProfileScreenState extends State<CompanyFillProfileScreen> {
  GlobalKey <FormState> formState = GlobalKey();
  TextEditingController companyName = TextEditingController();
  TextEditingController description = TextEditingController();

  @override
  void dispose() {
    companyName.dispose();
    description.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Form(
                  key: formState,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      sharedBackArrow(screenWidth, context),
        
                      SizedBox(height: screenHeight * 0.01),
        
                      const Text("Fill Your Profile",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          fontSize: 24,
                          color: Color(0xFF333333),
                        ),
                      ),
        
                      SizedBox(height: screenHeight * 0.02,),
        
                      ProfileScreen(screenWidth: screenWidth, screenHeight: screenHeight,),
        
                      SizedBox(height: screenHeight * 0.04),
        
                      CustomTextField(
                        myController: companyName,
                        hintText: "Enter company name",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Company name is required";
                          }
                          return null;
                        },
                      ),
        
                      SizedBox(height: screenHeight * 0.02,),
        
                      customLabel("Brief Description"),
        
                      SizedBox(height: screenHeight * 0.015,),
        
                      MultilineTextField(
                          controller: description,
                          height: screenHeight * .25,
                          hintText: 'Enter a details company',
                      ),
        
                      SizedBox(height: screenHeight * 0.015,),
        
                      CustomButton(
                          text: "Continue",
                          onPressed: (){
                            if (formState.currentState!.validate()) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: ((context)=> const CompanyInformationScreen()))
                              );
                            }
                          },
                      )
        
                    ],
                  ),
                ),
            )
        ),
      ),
    );
  }
}
