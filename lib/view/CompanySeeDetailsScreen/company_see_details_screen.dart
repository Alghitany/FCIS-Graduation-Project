import 'package:flutter/material.dart';
import 'package:project/view/InterestedCourses/interested_courses_screen.dart';

import '../../widgets/Customized/custom_button.dart';
import '../../widgets/Shared/shared_back_arrow.dart';

class CompanySeeDetailsScreen extends StatefulWidget {
  const CompanySeeDetailsScreen({super.key});

  @override
  State<CompanySeeDetailsScreen> createState() => _SeeDetailsScreenState();
}

class _SeeDetailsScreenState extends State<CompanySeeDetailsScreen> {
  bool saved = false;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: screenHeight * 0.049, horizontal: screenWidth * .04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  sharedBackArrow(screenWidth, context),
                  SizedBox(
                    width: 4,
                  ),
                  Text(
                    'Details',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      saved = !saved;
                      setState(() {});
                    },
                    child: Icon(
                      saved == false
                          ? Icons.bookmark_border_outlined
                          : Icons.bookmark,
                      color: Color(0xff5967A2),
                    ),
                  )
                ],
              ),
              SizedBox(height: 52),
              Row(
                children: [
                  Column(
                    children: [
                      Text(
                        'Client Name',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                        'UI/UX Designer.',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  Spacer(),
                  Container(
                    width: 64,
                    height: 64,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                'assets/images/DefaultDeveloperProfileImage2.png'),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(16)),
                  )
                ],
              ),
              SizedBox(
                height: 105,
              ),
              Container(
                margin: EdgeInsets.only(left: 16),
                child: Column(
                  children: [
                    Row(
                      children: [
                        ImageIcon(
                          AssetImage('assets/images/coins2.png'),
                          color: Color(0xff465697),
                        ),
                        SizedBox(
                          width: 19.33,
                        ),
                        Text(
                          '\$500 - \$1,000',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 35.75,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: Color(0xff465697),
                        ),
                        SizedBox(
                          width: 19.33,
                        ),
                        Text(
                          'Mansoura,Egypt.',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 51,
              ),
              Container(
                width: double.infinity,
                height: 259,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Clients Details:',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Container(
                        child: Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliquaLorem ipsum dolor sit amet, consectetur adipiscing elit,sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                    )),
                  ],
                ),
              ),
              SizedBox(
                height: 8,
              ),
              CustomButton(
                text: 'Hire',
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
