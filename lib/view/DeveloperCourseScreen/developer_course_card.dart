import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DeveloperCourseCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final int completedLessons;
  final int totalLessons;
  final String views;
  final String date;

  const DeveloperCourseCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.completedLessons,
    required this.totalLessons,
    required this.views,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 160,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        elevation: 4, // Soft shadow effect
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              child: Image.asset(
                imagePath, // Ensure this image exists in your assets folder
                height: 90, // Adjusted to fit within the total height
                width: 150,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0,left: 8.0,right: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      text: '$title ',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Poppins',
                        color: Color(0xFF1A1A1A)
                      ),
                      children: [
                        TextSpan(
                          text: '($completedLessons/$totalLessons Lessons)',
                          style: TextStyle(
                              fontSize: 10,
                              color: Color(0xFFAEAEAE),
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      SvgPicture.asset('assets/icons/view.svg',height: 14, width: 14, color: Color(0xFF4D4D4D),),
                      SizedBox(width: 4),
                      Text(
                          views,
                          style: TextStyle(
                              color: Color(0xFF4D4D4D),
                              fontSize: 10,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400),
                      ),
                      Spacer(),
                      Text(
                          date,
                          style: TextStyle(
                              color: Color(0xFF4D4D4D),
                              fontSize: 10,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
