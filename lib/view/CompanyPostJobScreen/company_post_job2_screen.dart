import 'package:flutter/material.dart';
import 'package:project/view/CompanyPostJobScreen/company_job_details.dart';
import 'package:project/widgets/Customized/custom_label.dart';

import '../../widgets/Customized/custom_button.dart';
import '../../widgets/Customized/custom_text_field.dart';
import '../../widgets/Shared/shared_back_arrow.dart';

class CompanyPostJob2Screen extends StatefulWidget {
  const CompanyPostJob2Screen({super.key});

  @override
  State<CompanyPostJob2Screen> createState() => _CompanyPostJob2ScreenState();
}

class _CompanyPostJob2ScreenState extends State<CompanyPostJob2Screen> {
  String experianceLevel = 'mid level';

  String companyDepartment = 'a';

  String jobAvailability = 'Remotely';
  TextEditingController Skills = TextEditingController();
  List<TextEditingController> skillsControllers = [TextEditingController()];
  void addSkillsField() {
    setState(() {
      skillsControllers.add(TextEditingController());
    });
  }

  void dispose() {
    super.dispose();
    for (var controller in skillsControllers) {
      controller.dispose();
    }
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
          child: ListView(
            // crossAxisAlignment: CrossAxisAlignment.start,
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
              customLabel('Skills Required'),
              SizedBox(
                height: 8,
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: skillsControllers.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 4.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: CustomTextField(
                            myController: skillsControllers[index],
                            hintText: "Add Skills",
                            onSuffixTap: addSkillsField,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              SizedBox(
                height: 16,
              ),
              customLabel('Experiance Level'),
              SizedBox(
                height: 8,
              ),
              DropdownButtonFormField<String>(
                hint: const Text(
                  'Midlevel',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: Color(0xFFD3D3D3),
                  ),
                ),
                value: null,
                onChanged: (String? newValue) {
                  experianceLevel = newValue!;

                  print(experianceLevel);
                },
                items: <String>['LowLevel', 'Midlevel', 'HighLevel']
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
              Padding(
                padding: const EdgeInsets.only(top: 16.0, bottom: 8),
                child: customLabel('Company Department'),
              ),
              DropdownButtonFormField<String>(
                hint: const Text(
                  'Select the Department',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: Color(0xFFD3D3D3),
                  ),
                ),
                value: null,
                onChanged: (String? newValue) {
                  companyDepartment = newValue!;

                  print(companyDepartment);
                },
                items: <String>['a', 'b', 'c']
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
              Padding(
                padding: const EdgeInsets.only(top: 16.0, bottom: 8),
                child: customLabel('Job Availability'),
              ),
              DropdownButtonFormField<String>(
                hint: const Text(
                  'Select the Department',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: Color(0xFFD3D3D3),
                  ),
                ),
                value: null,
                onChanged: (String? newValue) {
                  jobAvailability = newValue!;

                  print(jobAvailability);
                },
                items: <String>['Remotely', 'OnSite', 'Hyparid']
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
                height: 148,
              ),
              CustomButton(
                text: 'Next',
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return CompanyJobDetails();
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
