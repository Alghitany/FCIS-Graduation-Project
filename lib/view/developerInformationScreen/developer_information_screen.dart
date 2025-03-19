import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:project/features/authentication/developer/presentation/views/InterestedCourses/course_selection_screen.dart';

import 'package:project/widgets/Customized/custom_button.dart';
import 'package:project/widgets/Customized/custom_label.dart';
import 'package:project/widgets/Customized/custom_text_field.dart';

import '../../widgets/Shared/shared_back_arrow.dart';

class DeveloperInformationScreen extends StatefulWidget {
  const DeveloperInformationScreen({super.key});

  @override
  State<DeveloperInformationScreen> createState() =>
      _DeveloperInformationScreenState();
}

class _DeveloperInformationScreenState
    extends State<DeveloperInformationScreen> {
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
              customLabel('Enter your current Track(Optional)'),
              SizedBox(
                height: screenHeight * 0.0098,
              ),
              CustomTextField(
                  myController: TextEditingController(),
                  hintText: 'current track'),
              SizedBox(
                height: screenHeight * 0.0197,
              ),
              customLabel('Enter Track level(Optional)'),
              SizedBox(
                height: screenHeight * 0.0098,
              ),
              CustomTextField(
                  myController: TextEditingController(),
                  hintText: 'Track level'),
              SizedBox(
                height: screenHeight * 0.0197,
              ),
              customLabel('Enter your Previous job(Optional)'),
              SizedBox(
                height: screenHeight * 0.0098,
              ),
              CustomTextField(
                  myController: TextEditingController(),
                  hintText: 'previous job'),
              SizedBox(
                height: screenHeight * 0.0197,
              ),
              customLabel('Enter type of job(Optional)'),
              SizedBox(
                height: screenHeight * 0.0098,
              ),
              CustomTextField(
                  myController: TextEditingController(),
                  hintText: 'Type of job'),
              SizedBox(
                height: screenHeight * 0.0197,
              ),
              customLabel('Enter Years of experiance(Optional)'),
              SizedBox(
                height: screenHeight * 0.0098,
              ),
              CustomTextField(
                  myController: TextEditingController(),
                  hintText: 'experiance'),
              SizedBox(
                height: screenHeight * 0.0197,
              ),
              customLabel('Enter expected salary(Optional)'),
              SizedBox(
                height: screenHeight * 0.0098,
              ),
              CustomTextField(
                  myController: TextEditingController(), hintText: ' salary'),
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
                height: screenHeight * 0.054,
              ),
              CustomButton(
                text: 'Continue',
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      // return InterestedCoursesScreen();
                      return CourseSelectionScreen();
                    },
                  ));
                },
              )
            ],
          ),
        ),
      ),
    ));
  }
}
