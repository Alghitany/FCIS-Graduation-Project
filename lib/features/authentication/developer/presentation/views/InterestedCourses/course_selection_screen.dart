import 'dart:math';
import 'package:flutter/material.dart';

class CourseSelectionScreen extends StatefulWidget {
  @override
  _CourseSelectionScreenState createState() => _CourseSelectionScreenState();
}

class _CourseSelectionScreenState extends State<CourseSelectionScreen> {
  final List<String> courses = [
    "HTML",
    "Mysql",
    "JAVASCRIPT",
    "CSS",
    "C",
    "C++",
    "React",
    "BOOT STRAP",
    "UI/UX",
    "C#",
    "Java",
    "Google Courses",
    "Cloud Storage",
    "PHP",
    "Python",
    "Angular",
    "Vue.js"
  ];

  final double chipWidth = 110;
  final double chipHeight = 50;
  final List<Offset> positions = [];
  final Random random = Random();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _generatePositions();
    });
  }

  void _generatePositions() {
    positions.clear();
    final screenWidth = MediaQuery.of(context).size.width;
    final double containerWidth = screenWidth - 32;
    final int columns = (containerWidth ~/ chipWidth).clamp(1, courses.length);
    final int rows = (courses.length / columns).ceil();
    final double containerHeight =
        rows * chipHeight * 1.5; // Increased height for more spacing

    for (var i = 0; i < courses.length; i++) {
      int col = i % columns;
      int row = i ~/ columns;
      double left = col * chipWidth + random.nextDouble() * 20;
      double top = row * chipHeight * 1.5 + random.nextDouble() * 20;
      positions.add(Offset(left, top));
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 24,
          ),
          Text(
            "Select the course\nYou are interested..",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search course",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 12),
              ),
            ),
          ),
          SizedBox(height: 16),
          Text(
            "Our Popular Course:",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.grey[700],
            ),
          ),
          SizedBox(height: 16),
          Container(
            color: Colors.transparent,
            height:
                positions.isNotEmpty ? (positions.last.dy + chipHeight) : 600,
            width: double.infinity,
            child: Stack(
              children: List.generate(
                  positions.length,
                  (index) => Positioned(
                        left: positions[index].dx,
                        top: positions[index].dy,
                        child: Chip(
                          label: Text(courses[index]),
                          backgroundColor: Colors.white,
                          shape: StadiumBorder(
                            side: BorderSide(
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      )),
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {},
              child: Text(
                "Confirm",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}
