import 'package:flutter/material.dart';
import 'package:project/view/DeveloperJopApplyScreen/developer_jop_apply_screen.dart';
import 'package:project/widgets/Customized/custom_button.dart';
import 'package:project/widgets/Shared/shared_back_arrow.dart';

class DeveloperRelatedJopDetailsScreen extends StatefulWidget {
  const DeveloperRelatedJopDetailsScreen({super.key});

  @override
  State<DeveloperRelatedJopDetailsScreen> createState() =>
      _DeveloperRelatedJopDetailsScreenState();
}

class _DeveloperRelatedJopDetailsScreenState
    extends State<DeveloperRelatedJopDetailsScreen> {
  bool isSaved = false;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.only(right: 16.0, left: 16, bottom: 60),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: const EdgeInsets.only(top: 44.0, bottom: 52),
                child: Row(
                  children: [
                    sharedBackArrow(screenWidth, context),
                    SizedBox(
                      width: 16,
                    ),
                    Text(
                      'Details',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isSaved = !isSaved; // Toggle state
                        });
                      },
                      child: Icon(
                        isSaved
                            ? Icons.bookmark
                            : Icons.bookmark_border, // Change icon
                        color: isSaved
                            ? Color(0xff465697)
                            : const Color(0xff5967A2), // Change color
                        size: 24,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Column(
                    children: [
                      Text(
                        'Backend Engineer',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        'London, United Kingdom',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w400),
                      ),
                      Row(
                        children: [
                          Container(
                            width: 94,
                            height: 30,
                            child: Center(
                              child: Text(
                                'Fulltime',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff465697)),
                              ),
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: Color(0xff7D8AC3))),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Container(
                            width: 94,
                            height: 30,
                            child: Center(
                              child: Text(
                                'Remotly',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff465697)),
                              ),
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: Color(0xff7D8AC3))),
                          )
                        ],
                      )
                    ],
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: Column(
                      children: [
                        Image.asset('assets/images/companyLogo (3).png'),
                        SizedBox(
                          height: 4,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ImageIcon(AssetImage('assets/icons/clock.png')),
                            SizedBox(
                              width: 2,
                            ),
                            Text(
                              'Reposted \n12 mins ago',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff808080)),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 49,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, bottom: 34),
                child: Row(children: [
                  ImageIcon(
                    size: 40,
                    AssetImage('assets/images/coins2.png'),
                    color: Color(0xff465697),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Text(
                    '\$500 - \$1000',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, bottom: 55),
                child: Row(children: [
                  ImageIcon(
                    size: 40,
                    AssetImage('assets/icons/map-pin.png'),
                    color: Color(0xff465697),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Text(
                    'London, United Kingdom',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ]),
              ),
              Text(
                'Job Description:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                'Design a user interface for an all-encompassing freelance gig platform app. This app should enable freelancers to sell various services. adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Spacer(),
              CustomButton(
                text: 'Apply',
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return DeveloperJopApplyScreen();
                    },
                  ));
                },
              ),
              SizedBox(
                height: 9,
              ),
            ])));
  }
}
