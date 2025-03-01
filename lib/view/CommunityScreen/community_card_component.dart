import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CommunityCard extends StatelessWidget {
  final String communityName;
  final String memberCount;
  final String iconPath; // Path to the SVG icon

  const CommunityCard({
    super.key,
    required this.communityName,
    required this.memberCount,
    required this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Container(
        width: 140,
        height: 161,
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Community Icon
            Container(
              width: 50,
              height: 50,
              decoration: const BoxDecoration(
                color: Color(0xFF465697), // Dark blue color
                shape: BoxShape.circle,
              ),
              child: Center(
                child: SvgPicture.asset(
                  iconPath, // Load the asset icon
                  width: 24,
                  height: 24,
                  color: Colors.white, // Ensure icon is white
                ),
              ),
            ),
            const SizedBox(height: 8),

            // Community Name
            Text(
              communityName,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black,
                fontFamily: "Poppins",
              ),
            ),
            const SizedBox(height: 4),

            // Member Count
            Text(
              "$memberCount people",
              style: const TextStyle(
                fontSize: 14,
                color: Colors.grey,
                fontFamily: "Poppins",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
