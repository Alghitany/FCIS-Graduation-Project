import 'package:flutter/material.dart';
import 'package:project/view/DeveloperCVDownloadedScreen/cv_downloaded_successfully_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: CvDownloadedSuccessfullyScreen());
  }
}
