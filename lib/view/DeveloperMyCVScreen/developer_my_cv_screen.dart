import 'package:flutter/material.dart';
import 'package:project/view/DeveloperCVDownloadedScreen/cv_downloaded_successfully_screen.dart';
import 'package:project/widgets/Customized/custom_button.dart';

import '../../widgets/Shared/shared_back_arrow.dart';

class CVScreen extends StatelessWidget {
  const CVScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            sharedBackArrow(screenWidth, context),
            SizedBox(
              height: 16,
            ),
            Text(
              "My CV",
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  fontFamily: "Poppins",
                  color: Color(0xFF1A1A1A)),
            ),
            SizedBox(
              height: 24,
            ),
            Text(
              "Congratulation Your CV is  Done",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  fontFamily: "Poppins",
                  color: Colors.black),
            ),
            SizedBox(
              height: 32,
            ),
            Image.asset("assets/images/DefaultCVImage.png"),
            SizedBox(
              height: 44,
            ),
            CustomButton(
              text: "Download",
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return CvDownloadedSuccessfullyScreen();
                  },
                ));
              },
            ),
            SizedBox(
              height: 28,
            ),
            ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: const BorderSide(color: Color(0xFF465697)),
                  ),
                  minimumSize: Size(screenWidth * 0.85, 53),
                ),
                child: Text(
                  "Update",
                  style: const TextStyle(
                    color: Color(0xFF7D8AC3),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    fontFamily: "Poppins",
                  ),
                ))
          ],
        ),
      )),
    );
  }
}
