import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project/view/DeveloperFillProfileScreen/phone_number_field.dart';
import 'package:project/widgets/Customized/custom_button.dart';
import 'package:project/widgets/Customized/custom_text_field.dart';
import 'package:project/widgets/Shared/shared_back_arrow.dart';

import '../../widgets/Shared/shared_default_profile_picture.dart';
import '../DeveloperEnterLocationScreen/developer_enter_location_screen.dart';
import 'date_of_birth_field.dart';

class DeveloperFillProfileScreen extends StatefulWidget {
  const DeveloperFillProfileScreen({super.key});

  @override
  State<DeveloperFillProfileScreen> createState() => _DeveloperFillProfileScreenState();
}

class _DeveloperFillProfileScreenState extends State<DeveloperFillProfileScreen> {
  GlobalKey <FormState> formState = GlobalKey();
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  final TextEditingController phoneNumber = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  String? gender;
  String? dropdownValue;

  @override
  void dispose() {
    super.dispose();
    firstName.dispose();
    lastName.dispose();
    phoneNumber.dispose();
    dobController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    double paddingValue = screenWidth * 0.04;
    
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: paddingValue),
              child: Form(
                key: formState,
                child: GestureDetector(
                  onTap: () => FocusScope.of(context).unfocus(),
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

                      sharedDefaultProfilePicture(
                          screenWidth,
                          screenHeight,
                          (){}
                      ),


                      SizedBox(height: screenHeight * 0.018),
                  
                      CustomTextField(
                          myController: firstName,
                          hintText: "Enter first name",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "First name is required";
                          }
                          return null;
                        },
                      ),

                      SizedBox(height: screenHeight * 0.018),
                  
                      CustomTextField(
                          myController: lastName,
                          hintText: "Enter last name",
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Last name is required";
                            }
                            return null;
                          },
                      ),

                      SizedBox(height: screenHeight * 0.018),
                  
                      DropdownButtonFormField<String>(
                        hint: const Text(
                          'Gender',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Color(0xFFD3D3D3),
                          ),
                        ),
                        value: null,
                        onChanged: (String? newValue) {
                          gender = newValue;
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Gender is required";
                          }
                          return null;
                        },
                        items: <String>['Male', 'Female']
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

                      SizedBox(height: screenHeight * 0.018),
                  
                      DateOfBirthField(controller: dobController),

                      SizedBox(height: screenHeight * 0.018),
                  
                      PhoneNumberField(controller: phoneNumber),

                      SizedBox(height: screenHeight * 0.018),
                  
                      CustomButton(
                        text: "Continue",
                        onPressed: () {
                          if (formState.currentState!.validate()) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const DeveloperEnterLocationScreen()),
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
      ),
    );
  }
}
