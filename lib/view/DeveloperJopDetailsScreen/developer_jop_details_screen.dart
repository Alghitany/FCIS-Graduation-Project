import 'package:flutter/material.dart';
import 'package:project/view/DeveloperJopApplyScreen/developer_jop_apply_screen.dart';
import 'package:project/view/DeveloperJopsScreen/course_name_container.dart';
import 'package:project/widgets/Customized/custom_button.dart';
import 'package:project/widgets/Shared/shared_back_arrow.dart';

class DeveloperJopDetailsScreen extends StatefulWidget {
  const DeveloperJopDetailsScreen({super.key});

  @override
  State<DeveloperJopDetailsScreen> createState() =>
      _DeveloperJopDetailsScreenState();
}

class _DeveloperJopDetailsScreenState extends State<DeveloperJopDetailsScreen> {
  bool isSaved = false;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(right: 16.0, left: 16, bottom: 60),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                  )
                ],
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Need UI designer to create \n12 Screens',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
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
            SizedBox(
              height: 18,
            ),
            Row(
              children: [
                ImageIcon(
                  size: 40,
                  AssetImage('assets/images/coins2.png'),
                  color: Color(0xff465697),
                ),
                SizedBox(
                  width: 16,
                ),
                Text(
                  '\$200 ',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                Spacer(),
                ImageIcon(AssetImage('assets/icons/clock.png')),
                SizedBox(
                  width: 2,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: Text(
                    'Reposted \n12 mins ago',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff808080)),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 56,
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
            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                CourseNameContainer(name: 'UI/UX'),
                CourseNameContainer(name: 'App design'),
                CourseNameContainer(name: 'Figma'),
                CourseNameContainer(name: 'Layout Design'),
              ],
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
            )
          ],
        ),
      ),
    );
  }
}
