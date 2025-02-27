import 'package:flutter/material.dart';

class SendMessageContainer extends StatelessWidget {
  const SendMessageContainer({super.key, required this.messsage});
  final String messsage;

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now(); // Get current date & time
    int hour = now.hour;
    int minute = now.minute;
    String amPm = now.hour >= 12 ? "PM" : "AM";

    return Container(
      margin: EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: Colors.green,
          ),
          SizedBox(
            width: 2,
          ),
          Container(
            padding: EdgeInsets.only(top: 16, right: 16, left: 16),
            decoration: BoxDecoration(
                color: Color(0xffE6E6E6),
                borderRadius: BorderRadius.circular(16)),
            width: 224,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  messsage,
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 12,
                ),
                Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      '$hour:$minute $amPm',
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 12),
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
