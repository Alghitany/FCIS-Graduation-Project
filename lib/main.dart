import 'package:flutter/material.dart';
import 'package:project/view/CompantNotificationScreen/campany_notification_screen.dart';
import 'package:project/view/CompanyChatWithDeveloperScreen/company_chat_with_developer_screen.dart';
import 'package:project/view/CompanyFillProfileScreen/company_fill_profile_screen.dart';
import 'package:project/view/CompanyHomePageScreen/company_home_page_screen.dart';
import 'package:project/view/CompanyPostJobScreen/company_job_details.dart';
import 'package:project/view/CompanyPostJobScreen/company_post_job1_screen.dart';
import 'package:project/view/CompanyPostJobScreen/company_post_job2_screen.dart';
import 'package:project/view/ContactInformationScreen/contact_information_screen.dart';
import 'package:project/view/DeveloperCVDownloadedScreen/cv_downloaded_successfully_screen.dart';
import 'package:project/view/DeveloperFillProfileScreen/developer_fill_profile_screen.dart';
import 'package:project/view/DeveloperHomePageScreen/developer_home_page_screen.dart';
import 'package:project/view/DeveloperMyCVScreen/developer_my_cv_screen.dart';
import 'package:project/view/InterestedCourses/interested_courses_screen.dart';
import 'package:project/view/ResetPasswordScreen/reset_password_screen.dart';
import 'package:project/view/CompanySeeDetailsScreen/company_see_details_screen.dart';
import 'package:project/view/CompanySeeResumeScreen/company_see_resume_screen.dart';
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
        home: CvDownloadedSuccessfullyScreen());
  }
}
