import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CourseCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final int completedLessons;
  final int totalLessons;

  const CourseCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.completedLessons,
    required this.totalLessons,
  });

  @override
  Widget build(BuildContext context) {
    double progress = completedLessons / totalLessons;

    return Container(
      width: 230, // Adjust width as needed
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image and Favorite Icon
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
                child: Image.asset(
                  imagePath,
                  width: double.infinity,
                  height: 120,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 8,
                left: 8,
                child: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: SvgPicture.asset(
                    'assets/icons/Heart.svg',
                  )
                ),
              ),
            ],
          ),

          // Course Info
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF333333)
                      ),
                    ),
                    const Spacer(),
                    Text(
                      "($totalLessons lessons)",
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFFAEAEAE),
                        fontWeight: FontWeight.w500
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 11,),
                // Progress Bar
                // Progress Bar and Progress Text in the same row
                Row(
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: LinearProgressIndicator(
                          value: progress,
                          backgroundColor: Colors.grey[300],
                          color: const Color(0xFF5967A2),
                          minHeight: 4,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8), // Spacing between progress bar and text
                    Text(
                      "$completedLessons/$totalLessons",
                      style: const TextStyle(
                        fontSize: 12,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF384579),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
