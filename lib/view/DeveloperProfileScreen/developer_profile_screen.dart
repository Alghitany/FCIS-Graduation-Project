import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project/view/DeveloperProfileScreen/skill_card.dart';

import '../../widgets/Shared/profile_component_screen.dart';
import '../DeveloperHomePageScreen/developer_home_page_screen.dart';
import 'custom_cricle_phone_message_location_container.dart';

class DeveloperProfileScreen extends StatefulWidget {
  const DeveloperProfileScreen({super.key});

  @override
  State<DeveloperProfileScreen> createState() => _DeveloperProfileScreenState();
}

class _DeveloperProfileScreenState extends State<DeveloperProfileScreen> {
  final List<Map<String, dynamic>> skills = [
    {"color": Colors.orange, "percent": 86, "name": "HTML"},
    {"color": Colors.green, "percent": 48, "name": "React"},
    {"color": Colors.blue, "percent": 56, "name": "Java"},
    {"color": Colors.red, "percent": 75, "name": "Flutter"},
    {"color": Colors.purple, "percent": 65, "name": "Kotlin"},
    {"color": Colors.teal, "percent": 80, "name": "Dart"},
  ];

  int _selectedIndex = 3;

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
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SvgPicture.asset("assets/icons/menu.svg"),
                        const SizedBox(width: 90,),
                        const ProfileScreen(screenHeight: 750,screenWidth: 343,),
                        const Spacer(),
                        SvgPicture.asset("assets/icons/exit.svg"),
                      ],
                    ),
                    const SizedBox(height: 24,),
                    const Text(
                        "Ali Mohamed",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF333333),
                          fontFamily: "Poppins",
                        ),
                    ),
                    const SizedBox(height: 8,),
                    const Text(
                      "Frontend developer",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF333333),
                        fontFamily: "Poppins",
                      ),
                    ),
                    const SizedBox(height: 16,),
                    Row(
                      children: [
                        Spacer(),
                        CustomCirclePhoneMessageLocationContainer(
                          icon: "assets/icons/Phone.svg",
                          onTap: (){
                            //TODO Navigation Here
                          },
                        ),
                        SizedBox(width: 24,),
                        CustomCirclePhoneMessageLocationContainer(
                          icon: "assets/icons/mail.svg",
                          onTap: (){
                            //TODO Navigation Here
                          },
                        ),
                        SizedBox(width: 24,),
                        CustomCirclePhoneMessageLocationContainer(
                          icon: "assets/icons/location.svg",
                          onTap: (){
                            //TODO Navigation Here
                          },
                        ),
                        Spacer(),
                      ],
                    ),
                    SizedBox(height: 24,),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                            "Courses",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          fontFamily: "Poppins",
                        ),
                        ),
                    ),
                    SizedBox(height: 18),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3, // 2 columns
                        mainAxisSpacing: 16, // Vertical spacing
                        crossAxisSpacing: 16, // Horizontal spacing
                        childAspectRatio: 0.8, // Adjust card size
                      ),
                      itemCount: skills.length,
                      itemBuilder: (context, index) {
                        return SkillCard(
                          progressColor: skills[index]["color"],
                          progressPercent: skills[index]["percent"],
                          trackName: skills[index]["name"],
                        );
                      },
                    )
                  ],
                ),
              ),
          ),
      ),
    );
  }
}
