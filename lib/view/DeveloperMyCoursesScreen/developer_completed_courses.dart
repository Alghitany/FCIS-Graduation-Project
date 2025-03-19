// import 'package:flutter/material.dart';
// import 'package:project/view/DeveloperViewCertificationScreen/developer_view_certification_screen.dart';

// class DeveloperCompletedCourses extends StatelessWidget {
//   DeveloperCompletedCourses({Key? key}) : super(key: key);

//   final List<CompleteCourseModel> completeCourseList = [
//     CompleteCourseModel(
//       title: 'React JS',
//       subTitle: 'How to build user interface',
//       hour: 4,
//       minute: 20,
//       rate: 4.5,
//       image: 'assets/images/DefaultDeveloperProfileImage.png',
//       viewCertificate: () {
//         Navigator.push(context, MaterialPageRoute(
//           builder: (context) {
//             return DeveloperViewCertificationScreen();
//           },
//         ));
//       },
//     ),
//     CompleteCourseModel(
//       title: 'Flutter Development',
//       subTitle: 'Learn how to build beautiful apps with Flutter and Dart.',
//       hour: 5,
//       minute: 30,
//       rate: 4.7,
//       image: 'assets/images/DefaultDeveloperProfileImage.png',
//       viewCertificate: () {
//         Navigator.push(context, MaterialPageRoute(
//           builder: (context) {
//             return DeveloperViewCertificationScreen();
//           },
//         ));
//       },
//     ),
//     CompleteCourseModel(
//       image: 'assets/images/course2.png',
//       title: 'Flutter Development',
//       subTitle: 'Learn how to build beautiful apps with Flutter and Dart.',
//       hour: 5,
//       minute: 30,
//       rate: 4.7,
//       viewCertificate: () {
//         Navigator.push(context, MaterialPageRoute(
//           builder: (context) {
//             return DeveloperViewCertificationScreen();
//           },
//         ));
//       },
//     ),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemCount: completeCourseList.length,
//       itemBuilder: (context, index) {
//         return CompleteCourseCard(
//           model: completeCourseList[index],
//         );
//       },
//     );
//   }
// }

// class CompleteCourseModel {
//   final String title;
//   final String subTitle;
//   final double rate;
//   final int hour;
//   final int minute;
//   final String image;
//   final VoidCallback viewCertificate;

//   const CompleteCourseModel({
//     required this.image,
//     required this.title,
//     required this.subTitle,
//     required this.rate,
//     required this.hour,
//     required this.minute,
//     required this.viewCertificate,
//   });
// }

// class CompleteCourseCard extends StatelessWidget {
//   const CompleteCourseCard({Key? key, required this.model}) : super(key: key);
//   final CompleteCourseModel model;

//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     final screenHeight = MediaQuery.of(context).size.height;

//     return Container(
//       width: screenWidth * 0.9,
//       margin: EdgeInsets.only(top: screenHeight * 0.02),
//       padding: EdgeInsets.only(right: 8.7),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(12),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.2),
//             blurRadius: 12,
//             spreadRadius: 0,
//             offset: const Offset(0, 3),
//           ),
//         ],
//         color: Colors.white,
//       ),
//       child: Row(
//         children: [
//           Container(
//             width: 136,
//             height: 142,
//             decoration: BoxDecoration(
//               borderRadius: const BorderRadius.only(
//                   topLeft: Radius.circular(16),
//                   bottomLeft: Radius.circular(16)),
//               image: DecorationImage(
//                 fit: BoxFit.cover,
//                 image: AssetImage(model.image),
//               ),
//             ),
//           ),
//           const SizedBox(width: 16),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       model.title,
//                       style: const TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.w500,
//                         color: Color(0xff7D8AC3),
//                       ),
//                     ),
//                     const ImageIcon(
//                       AssetImage('assets/images/complete.png'),
//                       color: Color(0xff209D3D),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 4),
//                 Text(
//                   model.subTitle,
//                   style: const TextStyle(
//                     fontSize: 14,
//                     fontWeight: FontWeight.w500,
//                   ),
//                   maxLines: 2,
//                   overflow: TextOverflow.ellipsis,
//                 ),
//                 const SizedBox(height: 8),
//                 SizedBox(
//                   height: 19,
//                   child: Row(
//                     children: [
//                       ImageIcon(
//                         AssetImage('assets/icons/Star.png'),
//                         color: Color(0xffEBA61E),
//                       ),
//                       SizedBox(
//                         width: 4,
//                       ),
//                       Text(
//                         model.rate.toString(),
//                         style: TextStyle(
//                             fontSize: 12,
//                             fontWeight: FontWeight.w600,
//                             color: Color(0xff666666)),
//                       ),
//                       SizedBox(
//                         width: 8,
//                       ),
//                       VerticalDivider(
//                         color: Color(0xff000000),
//                         thickness: 4,
//                       ),
//                       SizedBox(
//                         width: 8,
//                       ),
//                       Text(
//                         '${model.hour} Hrs ${model.minute} mins',
//                         style: const TextStyle(
//                             fontSize: 12,
//                             fontWeight: FontWeight.w600,
//                             color: Color(0xff666666)),
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   height: 17,
//                 ),
//                 Row(
//                   children: [
//                     Spacer(),
//                     GestureDetector(
//                       onTap: model.viewCertificate,
//                       child: Text(
//                         'View Certificate',
//                         style: const TextStyle(
//                             decoration: TextDecoration.underline,
//                             decorationColor: Color(0xff3F4D88),
//                             decorationThickness: 2,
//                             fontSize: 12,
//                             fontWeight: FontWeight.w600,
//                             color: Color(0xff3F4D88)),
//                       ),
//                     ),
//                     SizedBox(
//                       width: 24,
//                     )
//                   ],
//                 ),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:project/view/DeveloperViewCertificationScreen/developer_view_certification_screen.dart';

class DeveloperCompletedCourses extends StatelessWidget {
  DeveloperCompletedCourses({Key? key}) : super(key: key);

  final List<CompleteCourseModel> completeCourseList = [
    CompleteCourseModel(
      title: 'React JS',
      subTitle: 'How to build user interfaces.',
      hour: 4,
      minute: 20,
      rate: 4.5,
      image: 'assets/images/DefaultDeveloperProfileImage.png',
      viewCertificateScreen: DeveloperViewCertificationScreen(),
    ),
    CompleteCourseModel(
      title: 'Flutter Development',
      subTitle: 'Learn how to build beautiful apps with Flutter and Dart.',
      hour: 5,
      minute: 30,
      rate: 4.7,
      image: 'assets/images/DefaultDeveloperProfileImage.png',
      viewCertificateScreen: DeveloperViewCertificationScreen(),
    ),
    CompleteCourseModel(
      image: 'assets/images/course2.png',
      title: 'Dart Basics',
      subTitle: 'Master Dart programming language for Flutter development.',
      hour: 3,
      minute: 15,
      rate: 4.8,
      viewCertificateScreen: DeveloperViewCertificationScreen(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: completeCourseList.length,
      itemBuilder: (context, index) {
        return CompleteCourseCard(
          model: completeCourseList[index],
        );
      },
    );
  }
}

class CompleteCourseModel {
  final String title;
  final String subTitle;
  final double rate;
  final int hour;
  final int minute;
  final String image;
  final Widget viewCertificateScreen;

  const CompleteCourseModel({
    required this.image,
    required this.title,
    required this.subTitle,
    required this.rate,
    required this.hour,
    required this.minute,
    required this.viewCertificateScreen,
  });
}

class CompleteCourseCard extends StatelessWidget {
  const CompleteCourseCard({Key? key, required this.model}) : super(key: key);
  final CompleteCourseModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      padding: const EdgeInsets.only(right: 8.7),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 12,
            offset: const Offset(0, 3),
          ),
        ],
        color: Colors.white,
      ),
      child: Row(children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.3,
          height: 142,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              bottomLeft: Radius.circular(16),
            ),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(model.image),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              children: [
                Text(
                  model.title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff7D8AC3),
                  ),
                ),
                Spacer(),
                const ImageIcon(
                  AssetImage('assets/images/complete.png'),
                  color: Color(0xff209D3D),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              model.subTitle,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.star, color: Color(0xffEBA61E)),
                const SizedBox(width: 4),
                Text(
                  model.rate.toString(),
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff666666),
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  '${model.hour} Hrs ${model.minute} mins',
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff666666),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 17,
            ),
            Row(
              children: [
                Spacer(),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => model.viewCertificateScreen),
                    );
                  },
                  child: Text(
                    'View Certificate',
                    style: const TextStyle(
                        decoration: TextDecoration.underline,
                        decorationColor: Color(0xff3F4D88),
                        decorationThickness: 2,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff3F4D88)),
                  ),
                ),
                SizedBox(
                  width: 24,
                )
              ],
            ),
          ]),
        )
      ]),
    );
  }
}
