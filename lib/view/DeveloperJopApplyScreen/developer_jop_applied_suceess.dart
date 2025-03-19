import 'package:flutter/material.dart';

import 'package:project/widgets/Customized/custom_button.dart';

class DeveloperJopAppliedSuceess extends StatelessWidget {
  const DeveloperJopAppliedSuceess({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 24.0),
              child: Container(
                height: 144,
                width: 144,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(72)),
                child: Image.asset(
                  'assets/images/success.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            RichText(
              textAlign: TextAlign.center,
              text: const TextSpan(
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  fontFamily: "Poppins",
                  color: Color(0xFF333333),
                ),
                children: [
                  TextSpan(text: "Application Submitted\n "),
                  TextSpan(text: "successfully."),
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF465697),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      minimumSize: Size(169, 52),
                    ),
                    child: Text(
                      'Explore Jobs',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Poppins",
                      ),
                    )),
              ],
            )
          ],
        ),
      )),
    );
  }
}
