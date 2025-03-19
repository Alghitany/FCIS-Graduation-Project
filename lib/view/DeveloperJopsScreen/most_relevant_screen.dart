import 'package:flutter/material.dart';
import 'package:project/view/DeveloperJopDetailsScreen/developer_jop_details_screen.dart';
import 'package:project/view/DeveloperJopsScreen/course_name_container.dart';
import 'package:project/view/DeveloperJopsScreen/developer_service_screen.dart';

class MostRelevantScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(vertical: 16),
      itemCount: 3,
      itemBuilder: (context, index) {
        return JobCard();
      },
    );
  }
}

class JobCard extends StatefulWidget {
  @override
  State<JobCard> createState() => _JobCardState();
}

class _JobCardState extends State<JobCard> {
  bool isSaved = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 12,
            spreadRadius: 0,
            offset: Offset(0, 3),
          ),
        ],
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(),
          SizedBox(height: 12),
          _buildBudget(),
          SizedBox(height: 12),
          SeeMoreText(
            text:
                "In search of a creative graphic designer to revamp our brand identity...",
            maxLines: 3,
          ),
          SizedBox(height: 12),
          _buildTags(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return DeveloperJopDetailsScreen();
              },
            ));
          },
          child: Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Need UI designer to create 12 Screens',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Posted 6 days ago',
                  style: TextStyle(
                    color: Color(0xff808080),
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),
        ),
        Spacer(),
        GestureDetector(
          onTap: () {
            setState(() {
              isSaved = !isSaved; // Toggle state
            });
          },
          child: Icon(
            isSaved ? Icons.bookmark : Icons.bookmark_border, // Change icon
            color: isSaved
                ? Color(0xff465697)
                : const Color(0xff5967A2), // Change color
            size: 24,
          ),
        ),
      ],
    );
  }

  Widget _buildBudget() {
    return Row(
      children: [
        Text(
          "Budget: ",
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
        ),
        Text(
          "200\$",
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }

  Widget _buildTags() {
    return SizedBox(
      height: 30,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        itemBuilder: (context, index) {
          List<String> tags = ['UI/UX', 'App design', 'Figma', 'Layout Design'];
          return CourseNameContainer(name: tags[index]);
        },
      ),
    );
  }
}
