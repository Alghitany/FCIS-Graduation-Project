import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RoadmapCard extends StatelessWidget {
  final String title;
  final double time;
  const RoadmapCard({super.key,
    required this.title,
    required this.time});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 343,
      height: 170,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Left side (Grey background with text)
          Container(
            width: 133,
            height: 170,
            decoration: BoxDecoration(
              color: Color(0xFFF2F4F5),
            ),
            child: Center(
              child: Text(
                title,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF6B78AC),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const SizedBox(width: 9),

          // Right side (Text and icons)
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title and Icon
                  Row(
                    children: [
                        Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF343434)
                            ),
                          ),
                          Text(
                            "$time Hours",
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color: Color(0xFF343434),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 45,),
                      IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(
                            'assets/icons/FolderDownload.svg',
                            color: Color(0xFF0F172A),),
                      ),
                    ],
                  ),

                  const SizedBox(height: 25),

                  // Start Point
                  Row(
                    children: [
                      SvgPicture.asset(
                          'assets/icons/StartPoint.svg',
                          ),
                      const SizedBox(width: 5),
                      const Text(
                        "Start point",
                        style: TextStyle(
                          color: Color(0xFF209D3D),
                          fontFamily: 'Poppins',
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(width: 5),
                      const Expanded(
                        child: Text(
                          "Dorem ipsum dolor sit amet",
                          style: TextStyle(color: Color(0xFF808080)),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 5),

                  // End Point
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/EndPoint.svg',
                      ),
                      const SizedBox(width: 5),
                      const Text(
                        "End point",
                        style: TextStyle(
                          color: Color(0xFFFF0000),
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Poppins'
                        ),
                      ),
                      const SizedBox(width: 5),
                      const Expanded(
                        child: Text(
                          "Dorem ipsum dolor sit amet",
                          style: TextStyle(color: Color(0xFF808080)),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}