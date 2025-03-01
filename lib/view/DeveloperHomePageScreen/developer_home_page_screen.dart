import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project/view/CommunityScreen/community_screen.dart';

import '../NotificationScreen/notification_screen.dart';
import 'chip_selector_component.dart';
import 'course_card_component.dart';
import 'job_card_component.dart';

class DeveloperHomePageScreen extends StatefulWidget {
  const DeveloperHomePageScreen({super.key});

  @override
  State<DeveloperHomePageScreen> createState() => _DeveloperHomePageScreenState();
}

class _DeveloperHomePageScreenState extends State<DeveloperHomePageScreen> {

  int _selectedIndex = 0;

  final Color _selectedColor = const Color(0xFF465697);
  final Color _unselectedColor = const Color(0xFF808080);

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
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
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const DeveloperHomePageScreen()),
                );
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
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Hi, ALi",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                            color: Colors.black
                            ),
                          ),

                          Text(
                            "What Would you like to learn \n Today? Search Below.",
                            style: TextStyle(
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: Color(0xFF808080),
                            ),
                            maxLines: 2,
                          )
                        ],
                      ),

                      const Spacer(flex: 1,),

                      IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const CommunityScreen()),
                          );
                        },
                        icon: SvgPicture.asset(
                          "assets/icons/CommunityIcon.svg",
                          height: 30,
                          width: 30,
                          fit: BoxFit.contain,
                        ),
                      ),

                      IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const NotificationScreen()),
                          );
                        },
                        icon: SvgPicture.asset(
                          "assets/icons/NotificationBell.svg",
                          height: 32,
                          width: 32,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 14,),

                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    height: 56,
                    width: 345,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 10,
                          spreadRadius: 1,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                      SvgPicture.asset(
                      "assets/icons/Search.svg",
                      fit: BoxFit.contain,
                        color: Colors.black,
                      ),
                        const SizedBox(width: 10),
                        const Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Search for..",
                              hintStyle: TextStyle(color: Color(0xFFCCCCCC)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 48,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Popular Courses",
                        style: TextStyle(
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: Color(0xFF333333)
                        ),
                      ),

                      Row(
                        children: [
                          const Text(
                            "SEE All",
                            style: TextStyle(
                              color: Color(0xFF465697),
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              fontFamily: "Poppins",
                            ),
                          ),

                          const SizedBox(width: 5,),

                          SvgPicture.asset(
                            "assets/icons/RightArrowIcon.svg",
                            fit: BoxFit.contain,
                            height: 10,
                            width: 7,
                            color: const Color(0xFF465697),
                          ),
                        ],
                      )
                    ],
                  ),

                  const SizedBox(height: 12,),

                  SizedBox(
                    height: 50, // Adjust height as needed
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: const [
                        ChipSelector(),
                      ],
                    ),
                  ),

                  const SizedBox(height: 10),

                  SizedBox(
                    height: 275,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: const [
                        CourseCard(imagePath: "assets/images/GraphicDesignAdvancedImage.png"),
                        SizedBox(width: 16),
                        CourseCard(imagePath: "assets/images/GraphicDesignAdvancedImage.png",),
                      ],
                    ),
                  ),

                  const SizedBox(height: 40),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Recommended Jobs",
                        style: TextStyle(
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                            color: Color(0xFF333333)
                        ),
                      ),

                      Row(
                        children: [
                          const Text(
                            "SEE ALL",
                            style: TextStyle(
                              color: Color(0xFF465697),
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              fontFamily: "Poppins",
                            ),
                          ),

                          const SizedBox(width: 5,),

                          SvgPicture.asset(
                            "assets/icons/RightArrowIcon.svg",
                            fit: BoxFit.contain,
                            height: 10,
                            width: 7,
                            color: const Color(0xFF465697),
                          ),
                        ],
                      )
                    ],
                  ),

                  const SizedBox(height: 20),

                  SizedBox(
                    height: 250,
                    child: ListView(
                      scrollDirection: Axis.vertical,
                      children: const [
                        JobCard(),
                        SizedBox(height: 10),
                        JobCard(),
                      ],
                    ),
                  ),

                ],
              ),
            ),
          ),
      ),
    );
  }
}
