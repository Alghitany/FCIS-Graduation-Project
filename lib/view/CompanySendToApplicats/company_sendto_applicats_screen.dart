import 'package:flutter/material.dart';
import 'package:project/view/CompanySendToApplicats/Sent_alert_dialog_component.dart';
import 'package:project/view/CompanySendToApplicats/applicant_card_component.dart';

import '../../features/authentication/developer/presentation/views/DeveloperFillProfileScreen/date_of_birth_field.dart';
import '../../features/authentication/developer/presentation/views/InterestedCourses/course_selection_screen.dart';
import '../../widgets/Customized/custom_button.dart';

class CompanySendtoApplicatsScreen extends StatefulWidget {
  const CompanySendtoApplicatsScreen({super.key});

  @override
  State<CompanySendtoApplicatsScreen> createState() =>
      _CompanySendtoApplicatsScreenState();
}

class _CompanySendtoApplicatsScreenState
    extends State<CompanySendtoApplicatsScreen> {
  final TextEditingController _controller = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  int charCount = 0;
  final int maxChars = 200;
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        charCount =
            _controller.text.length; // Update character count dynamically
      });
    });
  }

  void dispose() {
    _controller.dispose(); // Dispose controller to prevent memory leaks
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: screenHeight * 0.02, horizontal: screenWidth * 0.042),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              sharedBackArrow(
                  screenWidth, context), // Ensure this function is defined
              SizedBox(height: screenHeight * 0.026),
              Center(
                child: Text(
                  'Send to Applicats',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(
                height: 32,
              ),
              ApplicantCardComponent(context),
              SizedBox(
                height: 16,
              ),
              Text(
                'Message',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 41),
                child: SizedBox(
                  width: double.infinity,
                  height: 170, // Adjust height if needed
                  child: TextFormField(
                    controller: _controller,
                    keyboardType: TextInputType.multiline,
                    minLines: 3,
                    maxLines: 7,
                    maxLength: maxChars, // Set max character limit
                    decoration: InputDecoration(
                      counterStyle: TextStyle(color: Color(0xffCCCCCC)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff97A1CF))),
                      hintText:
                          'Hi, Ali\nCongratulations!\nAfter reviewing the resume , we would like to\ninvite you for interview on Saturday.\n   \nBest Regards,\nHiring Manager.',
                      hintStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color(0xffE6E6E6)),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ),
              Text(
                'Date Interview',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 8,
              ),
              DateOfBirthField(
                controller: dateController,
                hintText: '9 May 2025',
              ),
              SizedBox(
                height: 84,
              ),
              CustomButton(
                text: 'Send to Applicant',
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return SentalertDialog(context);
                    },
                  );
                },
              )
            ])),
      ),
    );
  }
}
