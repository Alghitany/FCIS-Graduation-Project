import 'package:flutter/material.dart';

class NotificationSettingRow extends StatefulWidget {
  late bool isSwitched;
  final String text;
  NotificationSettingRow({super.key, required this.isSwitched, required this.text});

  @override
  State<NotificationSettingRow> createState() => _NotificationSettingRowState();
}

class _NotificationSettingRowState extends State<NotificationSettingRow> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 40.0),
      child: Row(
        children: [
          Text(
            widget.text,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
              fontFamily: 'Poppins',
            ),
          ),
          const Spacer(),
          Switch(
            value: widget.isSwitched,
            onChanged: (value) {
              setState(() {
                widget.isSwitched = value; // Update state
              });
            },
            activeColor:Colors.white,
            inactiveThumbColor: Color(0xFFA2AACA),
            activeTrackColor: Color(0xFF5967A2),
            inactiveTrackColor: Colors.white,
          ),
        ],
      ),
    );
  }
}
