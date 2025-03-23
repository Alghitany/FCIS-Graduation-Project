import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project/view/DeveloperCoursesScreen/roadmap_category.dart';

import 'course_card.dart';
import 'new_course_card.dart';



class DeveloperCoursesScreen extends StatefulWidget {
  const DeveloperCoursesScreen({super.key});

  @override
  State<DeveloperCoursesScreen> createState() => _DeveloperCoursesScreenState();
}

class _DeveloperCoursesScreenState extends State<DeveloperCoursesScreen> {
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
    // TODO: implement dispose
    super.dispose();
    search.dispose();
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
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  color: const Color(0xFFF5F6FA),
                  child: Row(
                    children: [
                      const SizedBox(width: 18,),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hi,',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Poppins',
                            ),
                          ),
                          Text(
                            'Ali Mohamed',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Poppins',
                            ),
                          )
                        ],
                      ),
                      const Spacer(),
                      Container(
                        width: 56,
                        height: 56,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(32), // Updated radius
                          border: Border.all(
                            color: const Color(0xFF999999), // Border color
                            width: 1, // Adjust as needed
                          ),
                        ),
                        alignment: Alignment.center, // Center the icon
                        child: SvgPicture.asset(
                          "assets/icons/OutlinedPerson.svg",
                          height: 24,
                          width: 24,
                          color: const Color(0xFF999999),
                        ),
                      ),
                      const SizedBox(width: 18,),
                    ],
                  ),
                ),
                const SizedBox(height: 12,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
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
                          controller: search, // Attach controller// Send message on enter
                          decoration: InputDecoration(
                            hintText: "Search for the job",
                            prefixIcon: const Icon(Icons.search,size: 30,),
                            hintStyle: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Color(0xffCCCCCC)),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding:
                            const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Text(
                            'Roadmaps',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF3F3F3F)
                            ),
                          ),
                          const Spacer(),
                          const Text(
                            'View ALL',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Poppins',
                              color: Color(0xFF465697),
                            ),
                          ),
                          const SizedBox(width: 4,),
                          SvgPicture.asset('assets/icons/RightArrowIcon.svg'),
                          const SizedBox(width: 30,),
                        ],
                      ),
                      const SizedBox(height: 8,),
                      const Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          RoadmapCategory(
                            icon: 'assets/icons/frontend.svg',
                            roadmapText: 'Frontend',
                          ),
                          SizedBox(width: 24,),
                          RoadmapCategory(
                            icon: 'assets/icons/business.svg',
                            roadmapText: 'Business',
                          ),
                          SizedBox(width: 24,),
                          RoadmapCategory(
                            icon: 'assets/icons/graphic_designer.svg',
                            roadmapText: 'Graphic \nDesigner',
                          ),
                          SizedBox(width: 24,),
                          RoadmapCategory(
                            icon: 'assets/icons/figma.svg',
                            roadmapText: 'UX/UI \nFigma',
                          ),
                        ],
                      ),
                      const SizedBox(height: 16,),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Ongoing Courses',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Poppins',
                            color: Color(0xFF333333)
                          ),
                        ),
                      ),
                      SizedBox(height: 8,),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            CourseCard(
                              imagePath: "assets/images/ReactCourse.png",
                              title: "React Js",
                              completedLessons: 12,
                              totalLessons: 30,
                            ),
                            SizedBox(width: 14),
                            CourseCard(
                              imagePath: "assets/images/JavascriptCourse.png",
                              title: "JavaScript",
                              completedLessons: 5,
                              totalLessons: 20,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 16,),
                      Row(
                        children: [
                          const Text(
                            'Related Courses',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Poppins',
                                color: Color(0xFF333333)
                            ),
                          ),
                          const Spacer(),
                          const Text(
                            'View ALL',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Poppins',
                              color: Color(0xFF465697),
                            ),
                          ),
                          const SizedBox(width: 4,),
                          SvgPicture.asset('assets/icons/RightArrowIcon.svg'),
                          const SizedBox(width: 30,),
                        ],
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            NewCourseCard(
                              imagePath: 'assets/images/frontend.png', // Change to your image
                              title: 'Frontend',
                              totalCourses: 10,
                              duration: '8h 30min',
                              rating: 4.6,
                            ),
                            const SizedBox(width: 16),
                            NewCourseCard(
                              imagePath: 'assets/images/UIUX.png', // Change to your image
                              title: 'UI/UX',
                              totalCourses: 12,
                              duration: '10h 15min',
                              rating: 4.8,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )
          )
      ),
    );
  }
}
