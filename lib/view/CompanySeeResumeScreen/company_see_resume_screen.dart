import 'package:flutter/material.dart';
import 'package:project/view/InterestedCourses/interested_courses_screen.dart';

import '../../widgets/Customized/custom_button.dart';

class CompanySeeResumeScreen extends StatelessWidget {
  const CompanySeeResumeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 64.0, bottom: 56),
              child: Text(
                'See Resume',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
              ),
            ),
            Image.asset(
              'assets/images/resume.png',
              width: double.infinity,
              height: 406,
            ),
            SizedBox(
              height: 72,
            ),
            CustomButton(
              text: 'back',
              onPressed: () {},
            ),
            SizedBox(
              height: 97,
            )
          ],
        ),
      ),
    );
  }
}
