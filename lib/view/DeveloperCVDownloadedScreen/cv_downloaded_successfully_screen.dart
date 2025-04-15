import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project/features/authentication/core/presentation/views/OnBoardingScreen/on_boarding_screen.dart';

import '../../widgets/Shared/shared_back_arrow.dart';

class CvDownloadedSuccessfullyScreen extends StatelessWidget {
  const CvDownloadedSuccessfullyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(12.0),
        child: Column(
          children: [
            sharedBackArrow(screenWidth, context),
            SizedBox(
              height: 107,
            ),
            Image.asset("assets/images/CVDownloadedSuccessfullyImage.png"),
            SizedBox(
              height: 40,
            ),
            Text(
              "CV Downloaded successfully",
              style: TextStyle(
                  fontSize: 16,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF1E1E1E)),
            ),
            SizedBox(
              height: 40,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return OnBoardingScreen();
                  },
                ));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF465697),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                minimumSize: Size(127, 48),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Back",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      fontFamily: "Poppins",
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  SvgPicture.asset(
                    "assets/icons/NextArrowIcon.svg",
                    height: 16,
                    width: 19,
                    color: Colors.white,
                  )
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
