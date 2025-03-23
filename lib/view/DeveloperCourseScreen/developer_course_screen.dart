import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../widgets/Shared/shared_back_arrow.dart';
import 'developer_course_card.dart';

class DeveloperCourseScreen extends StatefulWidget {
  const DeveloperCourseScreen({super.key});

  @override
  State<DeveloperCourseScreen> createState() => _DeveloperCourseScreenState();
}

class _DeveloperCourseScreenState extends State<DeveloperCourseScreen> {
  TextEditingController search = TextEditingController();
  int _selectedIndex = 1;

  final Color _selectedColor = const Color(0xFF465697);
  final Color _unselectedColor = const Color(0xFF808080);

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  void dispose() {
    search.dispose(); // Dispose of controller first
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Column(
                children: [
                  SvgPicture.asset(
                    "assets/icons/Home.svg",
                    colorFilter: ColorFilter.mode(
                      _selectedIndex == 0 ? _selectedColor : _unselectedColor,
                      BlendMode.srcIn,
                    ),
                    fit: BoxFit.contain,
                  ),
                  Text(
                    "Home",
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      color: _selectedIndex == 0 ? _selectedColor : _unselectedColor,
                    ),
                  ),
                ],
              ),
              onPressed: () {
                _onItemTapped(0);
                // Navigator.pushReplacement(
                //   context,
                //   MaterialPageRoute(builder: (context) => const DeveloperHomePageScreen()),
                // );
              },
            ),
            IconButton(
              icon: Column(
                children: [
                  SvgPicture.asset(
                    height: 23,
                    width: 23,
                    "assets/icons/Courses.svg",
                    colorFilter: ColorFilter.mode(
                      _selectedIndex == 1 ? _selectedColor : _unselectedColor,
                      BlendMode.srcIn,
                    ),
                    fit: BoxFit.contain,
                  ),
                  Text(
                    "Courses",
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      color: _selectedIndex == 1 ? _selectedColor : _unselectedColor,
                    ),
                  ),
                ],
              ),
              onPressed: () {
                _onItemTapped(1);
              },
            ),
            IconButton(
              icon: Column(
                children: [
                  SvgPicture.asset(
                    height: 23,
                    width: 23,
                    "assets/icons/Jobs.svg",
                    colorFilter: ColorFilter.mode(
                      _selectedIndex == 2 ? _selectedColor : _unselectedColor,
                      BlendMode.srcIn,
                    ),
                    fit: BoxFit.contain,
                  ),
                  Text(
                    "Jobs",
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      color: _selectedIndex == 2 ? _selectedColor : _unselectedColor,
                    ),
                  ),
                ],
              ),
              onPressed: () {
                _onItemTapped(2);
              },
            ),
            IconButton(
              icon: Column(
                children: [
                  SvgPicture.asset(
                    "assets/icons/OutlinedPerson.svg",
                    colorFilter: ColorFilter.mode(
                      _selectedIndex == 3 ? _selectedColor : _unselectedColor,
                      BlendMode.srcIn,
                    ),
                    fit: BoxFit.contain,
                  ),
                  Text(
                    "Profile",
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      color: _selectedIndex == 3 ? _selectedColor : _unselectedColor,
                    ),
                  ),
                ],
              ),
              onPressed: () {
                _onItemTapped(3);
              },
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Row(
                children: [
                  sharedBackArrow(343, context),
                  const SizedBox(width: 88),
                  const Text(
                    "Frontend",
                    style: TextStyle(
                      fontSize: 24,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Container(
                height: 56,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 12,
                      spreadRadius: 0,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: TextField(
                  controller: search,
                  decoration: InputDecoration(
                    hintText: "Search for course",
                    prefixIcon: const Icon(Icons.search, size: 30),
                    hintStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xffCCCCCC),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Two columns
                    crossAxisSpacing: 43, // Space between columns
                    mainAxisSpacing: 16, // Space between rows
                  ),
                  itemCount: 12, // Adjust the number of courses as needed
                  itemBuilder: (context, index) {
                    return const DeveloperCourseCard(
                      imagePath: 'assets/images/html_course.png',
                      title: 'HTML Course',
                      completedLessons: 12,
                      totalLessons: 30,
                      views: '28K',
                      date: '28 Jan 2024',
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
