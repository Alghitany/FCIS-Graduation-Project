import 'package:flutter/material.dart';
import 'package:project/view/CompanyPostJobScreen/company_post_job2_screen.dart';
import 'package:project/widgets/Customized/custom_label.dart';

import '../../widgets/Customized/custom_button.dart';
import '../../widgets/Customized/custom_text_field.dart';
import '../../widgets/Shared/shared_back_arrow.dart';

class CompanyPostJob1Screen extends StatefulWidget {
  const CompanyPostJob1Screen({super.key});

  @override
  State<CompanyPostJob1Screen> createState() => _CompanyPostJob1ScreenState();
}

class _CompanyPostJob1ScreenState extends State<CompanyPostJob1Screen> {
  final TextEditingController _controller = TextEditingController();
  int charCount = 0;
  final int maxChars = 200; // Set max characters
  String jopType = "Full Time";

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        charCount =
            _controller.text.length; // Update character count dynamically
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose controller to prevent memory leaks
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: screenHeight * 0.02, horizontal: screenWidth * 0.042),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              sharedBackArrow(
                  screenWidth, context), // Ensure this function is defined
              SizedBox(height: screenHeight * 0.026),
              Center(
                child: Text(
                  'Post a job',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                ),
              ),
              customLabel('Job Title'),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 16),
                child: CustomTextField(
                  myController: TextEditingController(),
                  hintText: ' UI Designer',
                ),
              ),
              customLabel('Job Description'),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 16),
                child: SizedBox(
                  width: double.infinity,
                  height: 92, // Adjust height if needed
                  child: TextFormField(
                    controller: _controller,
                    keyboardType: TextInputType.multiline,
                    minLines: 3,
                    maxLines: 6,
                    maxLength: maxChars, // Set max character limit
                    decoration: InputDecoration(
                      counterStyle: TextStyle(color: Color(0xffCCCCCC)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff97A1CF))),
                      hintText: 'Enter a details company',
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
              customLabel('Job Type'),
              SizedBox(
                height: 8,
              ),
              DropdownButtonFormField<String>(
                hint: const Text(
                  'Full Time',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: Color(0xFFD3D3D3),
                  ),
                ),
                value: null,
                onChanged: (String? newValue) {
                  jopType = newValue!;
                  print(jopType);
                },
                items: <String>['Full Time', 'Part Time']
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
              SizedBox(
                height: 16,
              ),
              customLabel('Job Location'),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 16),
                child: CustomTextField(
                    myController: TextEditingController(),
                    hintText: 'Street 12,.....'),
              ),
              customLabel('Price Range'),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 16),
                child: CustomTextField(
                    myController: TextEditingController(), hintText: '1000\$'),
              ),
              customLabel('Deadline Task'),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 44),
                child: CustomTextField(
                    myController: TextEditingController(), hintText: '10 Days'),
              ),
              CustomButton(
                text: 'Next',
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return CompanyPostJob2Screen();
                    },
                  ));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
