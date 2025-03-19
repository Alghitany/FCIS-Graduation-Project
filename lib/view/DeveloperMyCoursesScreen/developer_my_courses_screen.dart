import 'package:flutter/material.dart';
import 'package:project/view/DeveloperJopsScreen/most_relevant_screen.dart';
import 'package:project/view/DeveloperJopsScreen/recently_psoted_screen.dart';
import 'package:project/view/DeveloperMyCoursesScreen/developer_completed_courses.dart';
import 'package:project/view/DeveloperMyCoursesScreen/developer_on_going_courses.dart';
import 'package:project/widgets/Shared/shared_back_arrow.dart';

class DeveloperMyCoursesScreen extends StatefulWidget {
  @override
  _DeveloperMyCoursesScreenState createState() =>
      _DeveloperMyCoursesScreenState();
}

class _DeveloperMyCoursesScreenState extends State<DeveloperMyCoursesScreen> {
  bool onGoing = true;
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: size.height * 0.02),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 18.0, left: 24, bottom: 28),
                child: Row(
                  children: [
                    sharedBackArrow(width, context),
                    SizedBox(
                      width: 84,
                    ),
                    Text(
                      'My Courses',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
                    )
                  ],
                ),
              ),
              _buildSearchBar(),
              SizedBox(height: 24),
              _buildTabBar(),
              Divider(),
              Expanded(
                child: onGoing
                    ? DeveloperOnGoingCourses()
                    : DeveloperCompletedCourses(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 12,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: TextField(
        controller: searchController,
        decoration: InputDecoration(
          hintText: "Search for job",
          prefixIcon: Icon(Icons.search, color: Color(0xffCCCCCC)),
          hintStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Color(0xffCCCCCC)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        ),
      ),
    );
  }

  Widget _buildTabBar() {
    return Padding(
      padding:
          const EdgeInsets.only(left: 20.0, right: 140, top: 24, bottom: 7),
      child: Row(
        children: [
          _tabItem('Ongoing', onGoing, () => setState(() => onGoing = true)),
          _tabItem(
              'Completed', !onGoing, () => setState(() => onGoing = false)),
        ],
      ),
    );
  }

  Widget _tabItem(String title, bool isSelected, VoidCallback onTap) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: isSelected ? Color(0xff97A1CF) : Color(0xff666666),
              ),
            ),
            if (isSelected)
              Container(
                height: 4,
                width: 70,
                color: Color(0xff97A1CF),
                margin: EdgeInsets.only(top: 4),
              ),
          ],
        ),
      ),
    );
  }

  Widget _filterOption(String text, String? iconPath) {
    return Container(
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
      height: 30,
      decoration: BoxDecoration(
        color: Color(0xffF2F2F2),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Center(
        child: Row(
          children: [
            Text(
              text,
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
            ),
            if (iconPath != null) ...[
              SizedBox(width: 8),
              ImageIcon(AssetImage(iconPath)),
            ],
          ],
        ),
      ),
    );
  }
}
