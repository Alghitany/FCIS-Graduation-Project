import 'package:flutter/material.dart';
import 'package:project/widgets/Customized/custom_button.dart';
import 'package:project/widgets/Customized/custom_text_field.dart';
import 'package:project/widgets/Shared/shared_back_arrow.dart';
import '../../widgets/Customized/custom_label.dart';
import '../CompanyHomePageScreen/company_home_page_screen.dart';
import '../validation_text_field.dart';

class ContactInformationScreen extends StatefulWidget {
  const ContactInformationScreen({super.key});

  @override
  State<ContactInformationScreen> createState() => _ContactInformationScreenState();
}

class _ContactInformationScreenState extends State<ContactInformationScreen> {
  GlobalKey <FormState> formState = GlobalKey();
  TextEditingController contactName = TextEditingController();
  TextEditingController contactEmail = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController socialMediaLinks = TextEditingController();

  List<TextEditingController> socialMediaControllers = [TextEditingController()];

  void addSocialMediaField() {
    setState(() {
      socialMediaControllers.add(TextEditingController());
    });
  }

  @override
  void dispose() {
    super.dispose();
    contactName.dispose();
    contactEmail.dispose();
    phoneNumber.dispose();
    for (var controller in socialMediaControllers) {
      controller.dispose();
    }
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

                    SizedBox(height: screenHeight * 0.01,),

                    const Text("Contact Information",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          fontFamily: "Poppins",
                          color: Color(0xFF333333)
                      ),
                    ),

                    SizedBox(height: screenHeight * 0.02,),

                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: customLabel("Enter contact name"),
                    ),

                    CustomTextField(
                        myController: contactName,
                        hintText: "Company name",
                        validator: (value) => validateName(value ?? "")
                    ),

                    SizedBox(height: screenHeight * 0.01),

                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: customLabel("Enter contact email"),
                    ),

                    CustomTextField(
                        myController: contactEmail,
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
                      child: customLabel("Enter Phone number"),
                    ),

                    CustomTextField(
                      myController: phoneNumber,
                      hintText: "phone number",
                      validator: (value){
                        if (isValidPositiveInteger(value!)) {
                          return "Address can't be empty";
                        }
                        return null;
                      },
                    ),

                    SizedBox(height: screenHeight * 0.01),


                    SizedBox(height: screenHeight * 0.01),

                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: customLabel("Social media links"),
                    ),

                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: socialMediaControllers.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 4.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: CustomTextField(
                                  myController: socialMediaControllers[index],
                                  hintText: "https://",
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Enter a valid URL";
                                    } else if (!validateURL(value)) {
                                      return "Invalid URL format";
                                    }
                                    return null;
                                  },
                                  onSuffixTap: addSocialMediaField,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),


                    SizedBox(height: screenHeight * 0.025),

                    CustomButton(
                      text: "Start Journey",
                      onPressed: (){
                        if (formState.currentState!.validate()){
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: ((context)=> const CompanyHomePageScreen())));
                        }
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
      ),
    );
  }
}
