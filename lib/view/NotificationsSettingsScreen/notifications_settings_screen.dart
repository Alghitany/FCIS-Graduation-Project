import 'package:flutter/material.dart';
import 'package:project/widgets/Shared/shared_back_arrow.dart';

import 'notification_setting_row.dart';

class NotificationsSettingsScreen extends StatefulWidget {
  const NotificationsSettingsScreen({super.key});

  @override
  State<NotificationsSettingsScreen> createState() => _NotificationsSettingsScreenState();
}

class _NotificationsSettingsScreenState extends State<NotificationsSettingsScreen> {
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              sharedBackArrow(343, context),
              SizedBox(height: 16,),
              const Text(
                'Notification',
                style: TextStyle(
                  fontSize: 24,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF7E89B7)
                ),
              ),
              SizedBox(height: 60,),
              NotificationSettingRow(isSwitched: isSwitched,text: 'Special Offers'),
              SizedBox(height: 16,),
              NotificationSettingRow(isSwitched: isSwitched,text: 'Sound'),
              SizedBox(height: 16,),
              NotificationSettingRow(isSwitched: isSwitched,text: 'Vibrate'),
              SizedBox(height: 16,),
              NotificationSettingRow(isSwitched: isSwitched,text: 'General Notification'),
              SizedBox(height: 16,),
              NotificationSettingRow(isSwitched: isSwitched,text: 'Promo & Discount'),
              SizedBox(height: 16,),
              NotificationSettingRow(isSwitched: isSwitched,text: 'Payment Options'),
              SizedBox(height: 16,),
              NotificationSettingRow(isSwitched: isSwitched,text: 'App Update'),
              SizedBox(height: 16,),
              NotificationSettingRow(isSwitched: isSwitched,text: 'New Service Available'),
              SizedBox(height: 16,),
              NotificationSettingRow(isSwitched: isSwitched,text: 'New Tips Available'),
            ],
          ),
        ),
      ),

    );
  }
}
