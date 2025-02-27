import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project/view/CompanyHomePageScreen/recent_applied_card_component.dart';
import '../CompanyPostJobScreen/company_post_job1_screen.dart';
import '../DeveloperDetailsOfferScreen/available_people_card.dart';
import '../NotificationScreen/notification_screen.dart';

class CompanyHomePageScreen extends StatefulWidget {
  const CompanyHomePageScreen({super.key});

  @override
  State<CompanyHomePageScreen> createState() => _CompanyHomePageScreenState();
}

class _CompanyHomePageScreenState extends State<CompanyHomePageScreen> {
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
    // Get screen width and height
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Adjust padding and font size based on screen size
    double padding = screenWidth * 0.04; // 4% of the screen width
    double fontSize =
        screenWidth < 600 ? 12.0 : 14.0; // Adjust font size for smaller screens
    double avatarRadius = screenWidth < 600 ? 30 : 36; // Adjust avatar size

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: padding),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: avatarRadius,
                      backgroundImage: const AssetImage(
                          "assets/images/DefaultCompanyProfileImage.png"),
                    ),
                    SizedBox(width: padding),
                    const Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Company name",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Color(0xFF333333),
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "Software Company",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: Color(0xFF808080),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const NotificationScreen()),
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
              ),
              SizedBox(
                  height: screenHeight *
                      0.04), // Adjust spacing based on screen height
              Padding(
                padding: EdgeInsets.only(left: padding),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Available People:",
                    style: TextStyle(
                      fontSize: fontSize,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF1A1A1A),
                    ),
                  ),
                ),
              ),
              Container(
                margin:
                    EdgeInsets.only(top: padding, left: padding, bottom: 24),
                height: 100,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    availablePeopleCard(context),
                    availablePeopleCard(context),
                    availablePeopleCard(context),
                    availablePeopleCard(context),
                    availablePeopleCard(context),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: padding),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Recent People Applied:",
                    style: TextStyle(
                      fontSize: fontSize,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF1A1A1A),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: padding, left: padding, bottom: 24, right: padding),
                height: 375,
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: <Widget>[
                    recentAppliedCardComponent(context),
                    recentAppliedCardComponent(context),
                    recentAppliedCardComponent(context),
                    recentAppliedCardComponent(context),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
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
                      color: _selectedIndex == 0
                          ? _selectedColor
                          : _unselectedColor,
                    ),
                  ),
                ],
              ),
              onPressed: () {
                _onItemTapped(0);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CompanyHomePageScreen()),
                );
              },
            ),
            IconButton(
              icon: Column(
                children: [
                  SvgPicture.asset(
                    "assets/icons/Search.svg",
                    colorFilter: ColorFilter.mode(
                      _selectedIndex == 1 ? _selectedColor : _unselectedColor,
                      BlendMode.srcIn,
                    ),
                    fit: BoxFit.contain,
                  ),
                  Text(
                    "Search",
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      color: _selectedIndex == 1
                          ? _selectedColor
                          : _unselectedColor,
                    ),
                  ),
                ],
              ),
              onPressed: () {
                _onItemTapped(1);
              },
            ),
            const SizedBox(width: 10),
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
                      color: _selectedIndex == 2
                          ? _selectedColor
                          : _unselectedColor,
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
                      color: _selectedIndex == 3
                          ? _selectedColor
                          : _unselectedColor,
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
      floatingActionButton: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CompanyPostJob1Screen()),
          );
        },
        child: Container(
          width: 64,
          height: 64,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xFF7D8AC3),
          ),
          alignment: Alignment.center,
          child: const Icon(
            Icons.add,
            color: Color(0xFFCCCCCC),
            size: 32,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
