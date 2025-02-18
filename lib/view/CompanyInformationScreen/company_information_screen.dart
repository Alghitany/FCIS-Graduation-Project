import 'package:flutter/material.dart';
import 'package:project/widgets/Customized/custom_button.dart';
import 'package:project/widgets/Customized/custom_text_field.dart';
import 'package:project/widgets/Shared/shared_back_arrow.dart';
import '../../widgets/Customized/custom_label.dart';
import '../ContactInformationScreen/contact_information_screen.dart';
import '../validation_text_field.dart';

class CompanyInformationScreen extends StatefulWidget {
  const CompanyInformationScreen({super.key});

  @override
  State<CompanyInformationScreen> createState() => _CompanyInformationScreenState();
}

class _CompanyInformationScreenState extends State<CompanyInformationScreen> {
  GlobalKey <FormState> formState = GlobalKey();
  TextEditingController countryName = TextEditingController();
  TextEditingController cityName = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController companyWebsite = TextEditingController();
  String? industry;
  String? dropdownValue;

  @override
  void dispose() {
    super.dispose();
    countryName.dispose();
    cityName.dispose();
    address.dispose();
    companyWebsite.dispose();
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

                    const Text("Company Information",
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

                    SizedBox(height: screenHeight * 0.03,),

                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: customLabel("Enter your country"),
                    ),

                    CustomTextField(
                        myController: countryName,
                        hintText: "Egypt",
                        validator: (value) => validateName(value ?? "")
                    ),

                    SizedBox(height: screenHeight * 0.02),

                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: customLabel("Enter your City"),
                    ),

                    CustomTextField(
                        myController: countryName,
                        hintText: "Mansoura",
                        validator: (value) => validateName(value ?? "")
                    ),

                    SizedBox(height: screenHeight * 0.02),

                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: customLabel("Enter your Address"),
                    ),

                    CustomTextField(
                      myController: address,
                      hintText: "Street 12,.....",
                      validator: (value){
                        if (value!.isEmpty) {
                          return "Address can't be empty";
                        }
                        return null;
                      },
                    ),

                    SizedBox(height: screenHeight * 0.02),

                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: customLabel("Company Website"),
                    ),

                    CustomTextField(
                      myController: companyWebsite,
                      hintText: "https://",
                      validator: (value) {
                        if(!validateURL(value!)){
                          return "Enter valid URL";
                        }
                        return null;
                      },
                    ),

                    SizedBox(height: screenHeight * 0.02),

                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: customLabel("Industry"),
                    ),

                    DropdownButtonFormField<String>(
                      hint: const Text(
                        'Industry',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: Color(0xFFD3D3D3),
                        ),
                      ),
                      value: null,
                      onChanged: (String? newValue) {
                        industry = newValue;
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Industry is required";
                        }
                        return null;
                      },
                      items: <String>['Software Engineering', 'Marketing']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Poppins',
                            ),
                          ),
                        );
                      }).toList(),
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10), // Adjust padding
                        isDense: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(
                            color: Color(0xFFB0B8E3),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(
                            color: Color(0xFFB0B8E3),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(
                            color: Color(0xFFB0B8E3),
                          ),
                        ),
                      ),
                      icon: const Icon(
                        Icons.keyboard_arrow_down,
                        color: Color(0xFFE6E6E6),
                        size: 28,
                      ),
                    ),

                    SizedBox(height: screenHeight * 0.03),

                    CustomButton(
                      text: "Continue",
                      onPressed: (){
                        if (formState.currentState!.validate()){
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: ((context)=> const ContactInformationScreen())));
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
