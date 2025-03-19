import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class DeveloperOnGoingCourses extends StatelessWidget {
  const DeveloperOnGoingCourses({Key? key}) : super(key: key);
  final List<cousreCardModel> jopcardList = const [
    cousreCardModel(
        title: 'React JS',
        subTitle:
            'Lorem ipsum dolor sit amet consectetur. In elementum tincidunt platea tristique enim. Fermentum arcu nec porta bibendum tortor.',
        hour: 4,
        presentage: 40),
    cousreCardModel(
        title: 'JavaScript',
        subTitle:
            'Lorem ipsum dolor sit amet consectetur. In elementum tincidunt platea tristique enim. Fermentum arcu nec porta bibendum tortor. aaaaaaaaaaaaaaadddddddddddddd',
        hour: 6,
        presentage: 60),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: jopcardList.length,
      itemBuilder: (context, index) {
        return CourseCard(
          model: jopcardList[index],
        );
      },
    );
  }
}

class cousreCardModel {
  final String title;
  final String subTitle;
  final double hour;
  final double presentage;

  const cousreCardModel(
      {required this.title,
      required this.subTitle,
      required this.hour,
      required this.presentage});
}

class CourseCard extends StatelessWidget {
  const CourseCard({Key? key, required this.model}) : super(key: key);
  final cousreCardModel model;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      width: screenWidth * 0.9, // 90% of screen width
      margin: EdgeInsets.only(top: screenHeight * 0.02), // Responsive margin
      padding: EdgeInsets.all(screenWidth * 0.04), // Responsive padding
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 12,
            spreadRadius: 0,
            offset: const Offset(0, 3),
          ),
        ],
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min, // Prevents unnecessary height overflow
        children: [
          _buildHeader(screenWidth),
          SizedBox(height: screenHeight * 0.005), // Responsive spacing
          Row(
            children: [
              const ImageIcon(AssetImage('assets/images/ic_clock.png')),
              SizedBox(width: screenWidth * 0.03),
              Text(
                '${model.hour} hours left',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          SizedBox(height: screenHeight * 0.007),
          const Divider(),
          SizedBox(height: screenHeight * 0.01),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Start Learning',
                style: TextStyle(
                  fontSize: screenWidth * 0.045, // Responsive font size
                  fontWeight: FontWeight.w500,
                  color: const Color(0xff465697),
                ),
              ),
            ],
          ),
          SizedBox(height: screenHeight * 0.01),
        ],
      ),
    );
  }

  Widget _buildHeader(
    double screenWidth,
  ) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                model.title,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: screenWidth * 0.05,
                ),
              ),
              SizedBox(height: screenWidth * 0.01),
              Text(
                model.subTitle,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12, // Responsive font size
                ),
                maxLines: 4,
                overflow: TextOverflow.ellipsis, // Prevents text overflow
              ),
            ],
          ),
        ),
        SizedBox(width: screenWidth * 0.02),
        new CircularPercentIndicator(
          radius: 30.0,
          lineWidth: 5.0,
          percent: model.presentage / 100,
          center: new Text("${model.presentage}%"),
          progressColor: Colors.green,
        )
      ],
    );
  }
}
