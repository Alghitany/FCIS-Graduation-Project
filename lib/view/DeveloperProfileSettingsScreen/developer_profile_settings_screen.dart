import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project/view/DeveloperProfileSettingsScreen/setting_service_row.dart';
import 'package:project/widgets/Shared/profile_component_screen.dart';

import 'logout_dialog.dart';

class DeveloperProfileSettingsScreen extends StatelessWidget {
  const DeveloperProfileSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 11),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 19.0),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: SvgPicture.asset('assets/icons/exit.svg'),
                    ),
                  ),
                  SizedBox(height: 23,),
                  ProfileScreen(screenWidth: 320, screenHeight: 320),
                  SizedBox(height: 8,),
                  Text(
                    'Ali',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      fontSize: 24,
                    ),
                  ),
                  SizedBox(height: 8,),
                  const Text(
                    'example@gmail.com',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      color: Color(0xFF909AC1),
                    ),
                  ),
                  SizedBox(height: 16,),
                  SettingServiceRow(
                    icon: "assets/icons/OutlinedPerson.svg",
                    text: "Edit Profile",
                    onTap: (){
                      //Todo Navigation Here
                    },
                  ),
                  SizedBox(height: 16,),
                  SettingServiceRow(
                    icon: "assets/icons/play.svg",
                    text: "My courses",
                    onTap: (){
                      //Todo Navigation Here
                    },
                  ),
                  SizedBox(height: 16,),
                  SettingServiceRow(
                    icon: "assets/icons/file.svg",
                    text: "My CV",
                    onTap: (){
                      //Todo Navigation Here
                    },
                  ),
                  SizedBox(height: 16,),
                  SettingServiceRow(
                    icon: "assets/icons/book.svg",
                    text: "Test & Quiz",
                    onTap: (){
                      //Todo Navigation Here
                    },
                  ),
                  SizedBox(height: 16,),
                  SettingServiceRow(
                    icon: "assets/icons/Bookmark.svg",
                    text: "Job saved",
                    onTap: (){
                      //Todo Navigation Here
                    },
                  ),
                  SizedBox(height: 16,),
                  SettingServiceRow(
                    icon: "assets/icons/Jobs.svg",
                    text: "Job Applied",
                    onTap: (){
                      //Todo Navigation Here
                    },
                  ),
                  SizedBox(height: 16,),
                  SettingServiceRow(
                    icon: "assets/icons/notifications.svg",
                    text: "Notifications",
                    onTap: (){
                      //Todo Navigation Here
                    },
                  ),
                  SizedBox(height: 16,),
                  SettingServiceRow(
                    icon: "assets/icons/payment.svg",
                    text: "Payment Option",
                    onTap: (){
                      //Todo Navigation Here
                    },
                  ),
                  SizedBox(height: 16,),
                  SettingServiceRow(
                    icon: "assets/icons/logout.svg",
                    text: "Logout",
                    onTap: (){
                      //Todo Navigation
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return LogoutDialog(context);
                        },
                      );
                    },
                  ),
                ],
              ),
          )
      ),
    );
  }
}
