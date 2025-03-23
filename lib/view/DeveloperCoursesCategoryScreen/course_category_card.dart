import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CourseCategoryCard extends StatelessWidget {
  final String imagePath;
  final String categoryName;
  final String coursesCount;
  final String rating;

  const CourseCategoryCard({
    super.key,
    required this.imagePath,
    required this.categoryName,
    required this.coursesCount,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 172,
      height: 185,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 2,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                child: Image.asset(
                  imagePath,
                  width: double.infinity,
                  height: 135,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 10,
                left: 10,
                child: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: SvgPicture.asset(
                    'assets/icons/Heart.svg', // Ensure you have a heart icon in assets
                    height: 18,
                    width: 21,
                    colorFilter: const ColorFilter.mode(
                      Color(0xFF465697),
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 2),
          Padding(
            padding: const EdgeInsets.only(left: 7),
            child: Text(
              categoryName,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                fontFamily: 'Poppins',
                color: Color(0xFF333333)
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 7),
            child: Row(
              children: [
                Text(
                  "($coursesCount Courses)  ",
                  style: const TextStyle(
                    fontSize: 10,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    color: Color(0xFFAEAEAE),
                  ),
                ),
                Text(
                  rating,
                  style: const TextStyle(
                      fontSize: 10,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF666666)
                  ),
                ),
                const SizedBox(width: 4),
                const Icon(
                  Icons.star,
                  color: Color(0xFFEBA61E),
                  size: 14,
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
