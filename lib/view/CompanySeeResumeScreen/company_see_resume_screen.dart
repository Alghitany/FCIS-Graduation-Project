import 'package:flutter/material.dart';

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
            const Padding(
              padding: EdgeInsets.only(top: 64.0, bottom: 56),
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
            const SizedBox(
              height: 72,
            ),
            CustomButton(
              text: 'back',
              onPressed: () {},
            ),
            const SizedBox(
              height: 97,
            )
          ],
        ),
      ),
    );
  }
}
