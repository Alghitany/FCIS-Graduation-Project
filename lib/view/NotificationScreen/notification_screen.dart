import 'package:flutter/material.dart';

import '../../widgets/Shared/shared_back_arrow.dart';
import 'notification_card_component.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                children: [
                  sharedBackArrow(screenWidth,context),

                  SizedBox(height: 16.5,),

                  Text(
                    "Notification",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Poppins",
                      color: Color(0xFF333333)
                    ),
                  ),

                  SizedBox(height: 32,),

                  NotificationCard(),
                  SizedBox(height: 6),
                  NotificationCard(),
                  SizedBox(height: 6),
                  NotificationCard(),
                  SizedBox(height: 6),
                  NotificationCard(),
                  SizedBox(height: 6),
                  NotificationCard(),
                  SizedBox(height: 6),
                  NotificationCard(),
                ],
              ),
            ),
          )
      ),
    );
  }
}
