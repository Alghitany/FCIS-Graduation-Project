import 'package:flutter/material.dart';
import 'package:project/view/InterestedCourses/interested_courses_screen.dart';
import 'package:project/widgets/Customized/jop_container.dart';

class CompanyJobDetails extends StatelessWidget {
  const CompanyJobDetails({super.key});

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
                  'Job Details',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              JopContainer(),
              SizedBox(
                height: 78,
              ),

              Container(
                width: 144,
                height: 144,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(72),
                    image: DecorationImage(
                        fit: BoxFit.contain,
                        image: AssetImage('assets/images/DialogImage.png'))),
              ),
              SizedBox(
                height: 24,
              ),
              Center(
                child: Text(
                  'Job Posted',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 57),
                width: 261,
                height: 43,
                child: Text(
                  textAlign: TextAlign.center,
                  'Now you can see the applier Resume and invite them.',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                height: 88,
              ),
              CustomButton(
                text: 'See All',
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
