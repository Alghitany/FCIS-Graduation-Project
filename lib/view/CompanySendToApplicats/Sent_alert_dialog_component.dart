import 'package:flutter/material.dart';
import 'package:project/view/CompanyProfileScreen/company_profile_screen.dart';
import 'package:project/widgets/Customized/custom_button.dart';

Widget SentalertDialog(BuildContext context) {
  return AlertDialog(
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
    ),
    content: SizedBox(
      height: 320,
      width: 343,
      child: Padding(
        padding: const EdgeInsets.only(top: 24),
        child: Column(
          children: [
            Image.asset(
              "assets/images/DialogImage.png",
              height: 100,
              width: 100,
            ),
            const SizedBox(
              height: 16,
            ),
            const Text(
              "Successful!",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  fontFamily: "Poppins",
                  color: Colors.black),
            ),
            SizedBox(
              height: 16,
            ),
            const Text(
              textAlign: TextAlign.center,
              "Notification has been sent\nto applicant.",
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  fontFamily: "Poppins",
                  color: Colors.black),
            ),
            const SizedBox(
              height: 16,
            ),
            CustomButton(
              text: 'Next',
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => const CompanyProfileScreen())));
              },
            )
          ],
        ),
      ),
    ),
  );
}
