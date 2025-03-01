import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class JobCard extends StatefulWidget {
  const JobCard({super.key});

  @override
  State<JobCard> createState() => _JobCardState();
}

class _JobCardState extends State<JobCard> {
  bool isBookmarked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Job Image
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              "assets/images/CompanyLogoImage.png", // Replace with your image
              width: 88,
              height: 88,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),

          // Job Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Junior Backend Engineer",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    fontFamily: "Poppins"
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  "London, United Kingdom",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w300
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    SvgPicture.asset(
                      "assets/icons/Money.svg", // Replace with actual icon
                      width: 20,
                      height: 20,
                    ),
                    const SizedBox(width: 6),
                    const Text(
                      "\$500 - \$1,000",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF465697), // Matches the image color
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Bookmark Icon
          IconButton(
            onPressed: () {
              setState(() {
                isBookmarked = !isBookmarked;
              });
            },
            icon: isBookmarked
                ? SvgPicture.asset("assets/icons/FilledBookmark.svg", width: 22, height: 22)
                : SvgPicture.asset("assets/icons/Bookmark.svg", width: 22, height: 22),
          ),
        ],
      ),
    );
  }
}
