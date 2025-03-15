// import 'dart:math';

// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
// import 'package:project/widgets/Customized/custom_text_field.dart';
// import 'package:project/widgets/Shared/shared_back_arrow.dart';

// class InterestedCoursesScreen extends StatelessWidget {
//   InterestedCoursesScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     final screenHeight = MediaQuery.of(context).size.height;
//     return Scaffold(
//         body: SafeArea(
//             child: SingleChildScrollView(
//                 child: Padding(
//       padding: EdgeInsets.symmetric(
//           horizontal: screenWidth * 0.05, vertical: screenHeight * 0.02),
//       child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisSize: MainAxisSize.max,
//           children: [
//             sharedBackArrow(screenWidth, context),
//             SizedBox(
//               height: screenHeight * .039,
//             ),
//             Text(
//               "Select the course Your are interested..",
//               style: TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.w500,
//               ),
//             ),
//             SizedBox(
//               height: 24,
//             ),
//             CustomTextField(
//                 myController: TextEditingController(),
//                 hintText: 'Search course'),
//             SizedBox(
//               height: 40,
//             ),
//             Align(
//               alignment: Alignment.topCenter,
//               child: Text(
//                 'Our Popular Course:',
//                 style: TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.w500,
//                     color: Color(0xffB3B3B3)),
//               ),
//             ),
//             StaggeredGrid.count(
//               crossAxisCount: 2,
//               mainAxisSpacing: 12,
//               crossAxisSpacing: 20,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.only(
//                     top: 19,
//                   ),
//                   child: StaggeredGridTile.count(
//                       crossAxisCellCount: 1,
//                       mainAxisCellCount: 1,
//                       child: course(
//                         name: 'HTML',
//                       )),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(top: 4.0),
//                   child: StaggeredGridTile.count(
//                       crossAxisCellCount: 1,
//                       mainAxisCellCount: 1,
//                       child: course(
//                         name: 'Mysql',
//                       )),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(top: 26.0),
//                   child: StaggeredGridTile.count(
//                       crossAxisCellCount: 1,
//                       mainAxisCellCount: 1,
//                       child: course(
//                         name: 'Css',
//                       )),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(top: 50.0),
//                   child: StaggeredGridTile.count(
//                       crossAxisCellCount: 1,
//                       mainAxisCellCount: 1,
//                       child: course(
//                         name: 'JAVASCRIPT',
//                       )),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(top: 24.0),
//                   child: StaggeredGridTile.count(
//                       crossAxisCellCount: 1,
//                       mainAxisCellCount: 1,
//                       child: course(
//                         name: 'C++',
//                       )),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(top: 11.0),
//                   child: StaggeredGridTile.count(
//                       crossAxisCellCount: 1,
//                       mainAxisCellCount: 1,
//                       child: course(
//                         name: 'C',
//                       )),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(top: 33.0),
//                   child: StaggeredGridTile.count(
//                       crossAxisCellCount: 1,
//                       mainAxisCellCount: 1,
//                       child: course(
//                         name: 'BOOT STRAP',
//                       )),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(top: 10.0),
//                   child: StaggeredGridTile.count(
//                       crossAxisCellCount: 1,
//                       mainAxisCellCount: 1,
//                       child: course(
//                         name: 'REACT',
//                       )),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(top: 20.0),
//                   child: StaggeredGridTile.count(
//                       crossAxisCellCount: 1,
//                       mainAxisCellCount: 1,
//                       child: course(
//                         name: 'C#',
//                       )),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(top: 25.0),
//                   child: StaggeredGridTile.count(
//                       crossAxisCellCount: 1,
//                       mainAxisCellCount: 1,
//                       child: course(
//                         name: 'UI/UX',
//                       )),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(top: 19.0),
//                   child: StaggeredGridTile.count(
//                       crossAxisCellCount: 1,
//                       mainAxisCellCount: 1,
//                       child: course(
//                         name: 'GOOGLE COURSE',
//                       )),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(top: 25.0),
//                   child: StaggeredGridTile.count(
//                       crossAxisCellCount: 1,
//                       mainAxisCellCount: 1,
//                       child: course(
//                         name: 'JAVA',
//                       )),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(top: 33.0),
//                   child: StaggeredGridTile.count(
//                       crossAxisCellCount: 1,
//                       mainAxisCellCount: 1,
//                       child: course(
//                         name: 'CLOUD STORAGE',
//                       )),
//                 ),
//               ],
//             )
//           ]),
//     ))));
//   }

//   Widget buildCourseButton(String course) {
//     return ElevatedButton(
//       onPressed: () {
//         print("$course Clicked");
//       },
//       style: ElevatedButton.styleFrom(
//         padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(30),
//           side: BorderSide(color: Colors.deepPurple),
//         ),
//         backgroundColor: Colors.white,
//         foregroundColor: Colors.deepPurple,
//         textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//       ),
//       child: Text("$course +"),
//     );
//   }
// }

// class course extends StatelessWidget {
//   const course({super.key, required this.name});
//   final String name;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.symmetric(vertical: 10),
//       child: Center(
//         child: Text(
//           name,
//           style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
//         ),
//       ),
//       decoration: BoxDecoration(
//           border: Border.all(), borderRadius: BorderRadius.circular(30)),
//     );
//   }
// }

// import 'dart:math';
// import 'package:flutter/material.dart';

// class CourseSelectionScreen extends StatefulWidget {
//   @override
//   _CourseSelectionScreenState createState() => _CourseSelectionScreenState();
// }

// class _CourseSelectionScreenState extends State<CourseSelectionScreen> {
//   final List<String> courses = [
//     "HTML",
//     "Mysql",
//     "JAVASCRIPT",
//     "CSS",
//     "C",
//     "C++",
//     "React",
//     "BOOT STRAP",
//     "UI/UX",
//     "C#",
//     "Java",
//     "Google Courses",
//     "Cloud Storage",
//     "PHP",
//     "Python",
//     "Angular",
//     "Vue.js"
//   ];

//   final double chipWidth = 110;
//   final double chipHeight = 50;
//   final List<Offset> positions = [];
//   final Random random = Random();

//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       _generatePositions();
//     });
//   }

//   void _generatePositions() {
//     positions.clear();
//     final screenWidth = MediaQuery.of(context).size.width;
//     final double containerWidth = screenWidth - 32;
//     final int columns = (containerWidth ~/ chipWidth).clamp(1, courses.length);
//     final int rows = (courses.length / columns).ceil();
//     final double containerHeight =
//         rows * chipHeight * 1.5; // Increased height for more spacing

//     for (var i = 0; i < courses.length; i++) {
//       int col = i % columns;
//       int row = i ~/ columns;
//       double left = col * chipWidth + random.nextDouble() * 20;
//       double top = row * chipHeight * 1.5 + random.nextDouble() * 20;
//       positions.add(Offset(left, top));
//     }

//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back),
//           onPressed: () {},
//         ),
//         backgroundColor: Colors.white,
//         elevation: 0,
//       ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             "Select the course\nYou are interested..",
//             style: TextStyle(
//               fontSize: 22,
//               fontWeight: FontWeight.bold,
//               color: Colors.black,
//             ),
//           ),
//           SizedBox(height: 12),
//           TextField(
//             decoration: InputDecoration(
//               hintText: "Search course",
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(8),
//                 borderSide: BorderSide(color: Colors.grey.shade300),
//               ),
//               contentPadding: EdgeInsets.symmetric(horizontal: 12),
//             ),
//           ),
//           SizedBox(height: 16),
//           Text(
//             "Our Popular Course:",
//             style: TextStyle(
//               fontSize: 18,
//               fontWeight: FontWeight.bold,
//               color: Colors.grey[700],
//             ),
//           ),
//           SizedBox(height: 16),
//           Container(
//             color: Colors.transparent,
//             height:
//                 positions.isNotEmpty ? (positions.last.dy + chipHeight) : 600,
//             width: double.infinity,
//             child: Stack(
//               children: List.generate(
//                   positions.length,
//                   (index) => Positioned(
//                         left: positions[index].dx,
//                         top: positions[index].dy,
//                         child: Chip(
//                           label: Text(courses[index]),
//                           backgroundColor: Colors.white,
//                           shape: StadiumBorder(
//                             side: BorderSide(
//                               color: Colors.blue,
//                             ),
//                           ),
//                         ),
//                       )),
//             ),
//           ),
//           Spacer(),
//           ElevatedButton(
//             style: ElevatedButton.styleFrom(
//               minimumSize: Size(double.infinity, 50),
//               backgroundColor: Colors.blue,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(8),
//               ),
//             ),
//             onPressed: () {},
//             child: Text(
//               "Confirm",
//               style: TextStyle(fontSize: 16, color: Colors.white),
//             ),
//           ),
//           SizedBox(height: 16),
//         ],
//       ),
//     );
//   }
// }

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
