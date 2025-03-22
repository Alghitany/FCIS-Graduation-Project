import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class SkillCard extends StatelessWidget {
  final Color progressColor;
  final int progressPercent;
  final String trackName;

  const SkillCard({
    super.key,
    required this.progressColor,
    required this.progressPercent,
    required this.trackName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 93,
      height: 138,
      decoration: BoxDecoration(
        color: Color(0xFFEDEFF5), // Light background color
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularPercentIndicator(
            radius: 30,
            lineWidth: 8,
            percent: progressPercent / 100, // Convert percentage to decimal
            center: Text(
              "${progressPercent.toInt()}%",
              style: TextStyle(
                fontSize: 14,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                color: Color(0xFF333333),
              ),
            ),
            progressColor: progressColor,
            backgroundColor: Colors.grey.shade300,
            circularStrokeCap: CircularStrokeCap.round,
          ),
          Text(
            trackName,
            style: TextStyle(
              fontSize: 16,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
