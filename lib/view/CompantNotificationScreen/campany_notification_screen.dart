import 'package:flutter/material.dart';
import 'package:project/view/InterestedCourses/interested_courses_screen.dart';
import 'package:project/view/models/notification_model.dart';

import '../../widgets/Shared/shared_back_arrow.dart';

class CampanyNotificationScreen extends StatefulWidget {
  const CampanyNotificationScreen({super.key});

  @override
  State<CampanyNotificationScreen> createState() =>
      _CampanyNotificationScreenState();
}

class _CampanyNotificationScreenState extends State<CampanyNotificationScreen> {
  List<NotificationModel> notifications = [
    NotificationModel(
        text: '10 people have applied in the last 1 hour.', time: '14h ago'),
    NotificationModel(
        text: '10 people have applied in the last 1 hour..', time: '10h ago'),
    NotificationModel(
        text: '10 people have applied in the last 1 hour.', time: '5h ago'),
    NotificationModel(
        text: '10 people have applied in the last 1 hour.', time: '14h ago'),
    NotificationModel(
        text: '10 people have applied in the last 1 hour.', time: '8h ago'),
  ];

  // Function to delete a notification
  void deleteNotification(int index) {
    setState(() {
      notifications.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: screenHeight * 0.02, horizontal: screenWidth * 0.042),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              sharedBackArrow(
                  screenWidth, context), // Ensure this function is defined
              SizedBox(height: screenHeight * 0.019),
              Center(
                child: Text(
                  'Notifications',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(height: screenHeight * 0.039),
              Expanded(
                child: notifications.isEmpty
                    ? Center(
                        child: Text(
                          "No notifications available",
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      )
                    : ListView.builder(
                        itemCount: notifications.length,
                        itemBuilder: (context, index) {
                          return NotificationContainer(
                            notificationModel: notifications[index],
                            onDelete: () => deleteNotification(
                                index), // Pass delete function
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NotificationContainer extends StatelessWidget {
  final NotificationModel notificationModel;
  final VoidCallback onDelete;

  const NotificationContainer({
    super.key,
    required this.notificationModel,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: Color(0xffF2F4F5),
        borderRadius: BorderRadius.circular(12),
      ),
      width: double.infinity,
      height: 138,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 22.0, right: 22, top: 23),
            child: Text(
              notificationModel.text,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(left: 22.5, right: 32),
            child: Row(
              children: [
                ImageIcon(
                  AssetImage('assets/images/ic_clock.png'),
                  color: Colors.grey,
                ),
                SizedBox(width: 5),
                Text(
                  notificationModel.time,
                  style: TextStyle(
                      color: Color(0xff999999),
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                ),
                Spacer(),
                GestureDetector(
                  onTap: onDelete, // Call delete function when tapped
                  child: Text(
                    'Delete',
                    style: TextStyle(
                        color: Color(0xffFF0000),
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 14),
        ],
      ),
    );
  }
}
