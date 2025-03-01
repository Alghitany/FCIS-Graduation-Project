import 'package:flutter/material.dart';

class NotificationCard extends StatefulWidget {
  const NotificationCard({super.key});

  @override
  State<NotificationCard> createState() => _NotificationCardState();
}

class _NotificationCardState extends State<NotificationCard> {
  bool isRead = false; // State to track if the notification is read

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300), // Smooth transition effect
      height: 138,
      width: 343,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isRead ? Colors.grey[100] : const Color(0xFF465697), // Light gray when read
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title Row
          Row(
            children: [
              if (!isRead) // Show dot only if unread
                const Icon(Icons.circle, color: Colors.white, size: 10),
              if (!isRead) const SizedBox(width: 8),
              Text(
                "Apply Success",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: isRead ? Colors.black : Colors.white, // Change text color when read
                  fontFamily: "Poppins",
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),

          // Description Text
          Text(
            "You have applied for a job in Queenify Group as UI Designer",
            style: TextStyle(
              fontSize: 14,
              color: isRead ? Colors.black : Colors.white,
              fontFamily: "Poppins",
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 12),

          // Time Row
          Row(
            children: [
              Icon(Icons.access_time, color: isRead ? Colors.grey : Colors.white, size: 14),
              const SizedBox(width: 4),
              Text(
                isRead ? "6 June" : "14h ago",
                style: TextStyle(
                  fontSize: 12,
                  color: isRead ? Colors.grey : Colors.white,
                ),
              ),
              const Spacer(),
              if (!isRead) // Show "Mark as read" only if unread
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isRead = true; // Update UI when marked as read
                    });
                  },
                  child: const Text(
                    "Mark as read",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
