import 'package:flutter/material.dart';
import 'package:project/view/AddNewCartScreen/add_new_cart_screen.dart';
import 'package:project/view/CompantNotificationScreen/campany_notification_screen.dart';
import 'package:project/view/CompanyChatWithDeveloperScreen/company_chat_with_developer_screen.dart';
import 'package:project/view/CompanyFillProfileScreen/company_fill_profile_screen.dart';
import 'package:project/view/CompanyHomePageScreen/company_home_page_screen.dart';
import 'package:project/view/CompanyHomeScreen/company_home_screen.dart';
import 'package:project/view/CompanyPostJobScreen/company_job_details.dart';
import 'package:project/view/CompanyPostJobScreen/company_post_job1_screen.dart';
import 'package:project/view/CompanyPostJobScreen/company_post_job2_screen.dart';
import 'package:project/view/CompanySendToApplicats/company_sendto_applicats_screen.dart';
import 'package:project/view/ContactInformationScreen/contact_information_screen.dart';
import 'package:project/view/CompanySeeDetailsScreen/company_see_details_screen.dart';
import 'package:project/view/CompanySeeResumeScreen/company_see_resume_screen.dart';
import 'package:project/view/DeveloperCommunityChatScreen/developer_community_chat_screen.dart';
import 'package:project/view/DeveloperCourseScreen/developer_course_screen.dart';
import 'package:project/view/DeveloperCoursesCategoryScreen/developer_courses_category_screen.dart';
import 'package:project/view/DeveloperCoursesScreen/developer_courses_screen.dart';
import 'package:project/view/DeveloperJopsScreen/developer_jops_screen.dart';
import 'package:project/view/DeveloperProfileScreen/developer_profile_screen.dart';
import 'package:project/view/DeveloperProfileSettingsScreen/developer_profile_settings_screen.dart';
import 'package:project/view/EditProfileScreen/edit_profile_screen.dart';
import 'package:project/view/JobAppliedScreen/job_applied_screen.dart';
import 'package:project/view/NotificationsSettingsScreen/notifications_settings_screen.dart';
import 'package:project/view/PaymentOptionScreen/payment_option_screen.dart';
import 'package:project/view/RoadmapScreen/roadmap_screen.dart';
import 'package:project/view/SplashScreen/splash_screen.dart';
import 'package:project/view/company_jops_screen/company_jops_screen.dart';

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
        home: DeveloperCommunityChatScreen());
  }
}
