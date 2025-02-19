import 'package:flutter/material.dart';
import 'package:project/view/CompanyFillProfileScreen/company_fill_profile_screen.dart';
import 'package:project/view/CompanyHomePageScreen/company_home_page_screen.dart';
import 'package:project/view/ContactInformationScreen/contact_information_screen.dart';
import 'package:project/view/DeveloperFillProfileScreen/developer_fill_profile_screen.dart';
import 'package:project/view/ResetPasswordScreen/reset_password_screen.dart';
import 'package:project/view/SplashScreen/splash_screen.dart';

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
        home:  DeveloperFillProfileScreen()
    );
  }
}
