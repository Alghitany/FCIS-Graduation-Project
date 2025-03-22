import 'package:flutter/material.dart';
import 'package:project/features/authentication/developer/presentation/views/DeveloperFillProfileScreen/date_of_birth_field.dart';
import 'package:project/widgets/Customized/custom_button.dart';
import 'package:project/widgets/Shared/profile_component_screen.dart';
import 'package:project/widgets/Shared/shared_back_arrow.dart';

import '../../features/authentication/developer/presentation/views/DeveloperFillProfileScreen/phone_number_field.dart';
import '../../widgets/Customized/custom_text_field.dart';
import '../validation_text_field.dart';

class EditProfileScreen extends StatefulWidget {

  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();


  String? gender;


  GlobalKey <FormState> formState = GlobalKey();

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
    return Scaffold(
      body: SafeArea(
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Form(
                key: formState,
                child: Column(
                  children: [
                    sharedBackArrow(343, context),
                    const SizedBox(height: 16,),
                    const Text(
                      'Edit Profile',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Poppins',
                        color: Color(0xFF7E89B7)
                      ),
                    ),
                    SizedBox(height: 24,),
                    ProfileScreen(screenWidth: 300, screenHeight: 450),
                    SizedBox(height: 44,),
                    CustomTextField(
                        myController: firstName,
                        hintText: "Enter first name",
                        validator: (value) => validateName(value ?? "")
                    ),
                    SizedBox(height: 28,),
                    CustomTextField(
                        myController: lastName,
                        hintText: "Enter last name",
                        validator: (value) => validateName(value ?? "")
                    ),
                    SizedBox(height: 28,),
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
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 10), // Adjust padding
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
                    SizedBox(height: 28,),
                    DateOfBirthField(
                      controller: dobController,
                      hintText: 'Date of Birth',
                    ),
                    SizedBox(height: 28,),
                    PhoneNumberField(controller: phoneNumber),
                    SizedBox(height: 44,),
                    CustomButton(
                        text: "Update",
                        onPressed: (){
                          //TODO
                        },
                    )
                  ],
                ),
              ),
          )),
    );
  }
}
