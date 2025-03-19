import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:project/features/authentication/developer/presentation/views/DeveloperFillProfileScreen/phone_number_field.dart';

import 'package:project/view/DeveloperJopApplyScreen/developer_jop_applied_suceess.dart';
import 'package:project/view/validation_text_field.dart';
import 'package:project/widgets/Customized/custom_button.dart';
import 'package:project/widgets/Customized/custom_label.dart';
import 'package:project/widgets/Customized/custom_text_field.dart';
import 'package:project/widgets/Shared/shared_back_arrow.dart';

import '../../widgets/Shared/profile_component_screen.dart';

class DeveloperJopApplyScreen extends StatefulWidget {
  const DeveloperJopApplyScreen({super.key});

  @override
  State<DeveloperJopApplyScreen> createState() =>
      _DeveloperFillProfileScreenState();
}

class _DeveloperFillProfileScreenState extends State<DeveloperJopApplyScreen> {
  GlobalKey<FormState> formState = GlobalKey();
  TextEditingController name = TextEditingController();
  TextEditingController experinceYears = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController expectedsalary = TextEditingController();
  final TextEditingController phoneNumber = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  String? gender;
  String? dropdownValue;
  String? fileName;

  Future<void> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc', 'docx'],
    );

    if (result != null) {
      setState(() {
        fileName = result.files.single.name;
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    name.dispose();
    experinceYears.dispose();
    expectedsalary.dispose();
    email.dispose();
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
                  const Text(
                    "Job Apply",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      fontSize: 24,
                      color: Color(0xFF333333),
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  customLabel(' Name'),
                  SizedBox(
                    height: screenHeight * 0.0098,
                  ),
                  CustomTextField(
                    myController: name,
                    hintText: "Ali Mohamed",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "First name is required";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: screenHeight * 0.0197,
                  ),
                  customLabel('Email Address'),
                  SizedBox(
                    height: screenHeight * 0.0098,
                  ),
                  CustomTextField(
                    myController: email,
                    hintText: "example@gmail.com",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your email";
                      } else if (!isValidEmail(value)) {
                        return "Enter a valid email address";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: screenHeight * 0.0197,
                  ),
                  customLabel('Phone Number'),
                  SizedBox(
                    height: screenHeight * 0.0098,
                  ),
                  PhoneNumberField(controller: phoneNumber),
                  SizedBox(
                    height: screenHeight * 0.0197,
                  ),
                  customLabel('Enter Years of experiance'),
                  SizedBox(
                    height: screenHeight * 0.0098,
                  ),
                  CustomTextField(
                    myController: experinceYears,
                    hintText: "experiance",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter a number";
                      }

                      int? number = int.tryParse(value);
                      if (number == null) {
                        return "Please enter a valid number";
                      } else if (number <= 0) {
                        return "Please enter a number greater than 0";
                      }

                      return null;
                    },
                  ),
                  SizedBox(
                    height: screenHeight * 0.0197,
                  ),
                  customLabel('Enter expected salary'),
                  SizedBox(
                    height: screenHeight * 0.0098,
                  ),
                  CustomTextField(
                    myController: expectedsalary,
                    hintText: "experiance",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter a number";
                      }

                      int? number = int.tryParse(value);
                      if (number == null) {
                        return "Please enter a valid number";
                      } else if (number <= 0) {
                        return "Please enter a number greater than 0";
                      }

                      return null;
                    },
                  ),
                  SizedBox(
                    height: screenHeight * 0.0197,
                  ),
                  customLabel('Upload your CV(Optional)'),
                  SizedBox(
                    height: screenHeight * 0.0098,
                  ),
                  GestureDetector(
                    onTap: pickFile,
                    child: AbsorbPointer(
                      child: CustomTextField(
                          myController: TextEditingController(),
                          hintText: fileName ?? 'CV'),
                    ),
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  CustomButton(
                    text: "Continue",
                    onPressed: () {
                      if (formState.currentState!.validate()) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const DeveloperJopAppliedSuceess()),
                        );
                      }
                    },
                  ),
                  SizedBox(
                    height: 38,
                  ),
                ],
              ),
            ),
          ),
        ),
      )),
    );
  }
}
