import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NewCourseCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final int totalCourses;
  final String duration;
  final double rating;

  const NewCourseCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.totalCourses,
    required this.duration,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 230,
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
                // Course Title and Total Courses
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
                      "($totalCourses lessons)",
                      style: const TextStyle(
                          fontSize: 12,
                          color: Color(0xFFAEAEAE),
                          fontWeight: FontWeight.w500
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 11,),

                // Duration and Rating Row
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: const Color(0xFFEAEAFF),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        duration,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF5967A2),
                        ),
                      ),
                    ),
                    const Spacer(),
                    Text(
                      rating.toString(),
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF333333),
                      ),
                    ),
                    const SizedBox(width: 4),
                    const Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 16,
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
