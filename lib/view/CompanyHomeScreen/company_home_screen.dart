import 'package:flutter/material.dart';
import 'package:project/view/CompanyPostJobScreen/company_post_job1_screen.dart';
import 'package:project/view/CompanyProfileScreen/company_profile_screen.dart';
import 'package:project/view/company_jops_screen/company_jops_screen.dart';

class CompanyHomeScreen extends StatefulWidget {
  @override
  _CompanyHomeScreenState createState() => _CompanyHomeScreenState();
}

class _CompanyHomeScreenState extends State<CompanyHomeScreen> {
  int _selectedIndex = 0; // Default to Jobs tab
  bool _isJobsSelected = true; // Track selected tab

  final List<Map<String, String>> jobs = [
    {"title": "UI Designer", "location": "Mansoura, Egypt"},
    {"title": "UX Designer", "location": "Mansoura, Egypt"},
    {"title": "UX Research", "location": "Mansoura, Egypt"},
    {"title": "UI Designer", "location": "Mansoura, Egypt"},
  ];

  void _onTabSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _getScreen(int index) {
    switch (index) {
      case 0:
        return HomeScreen();
      case 1:
        return SearchScreen();
      case 2:
        return CompanyJobsScreen();
      case 3:
        return CompanyProfileScreen();
      default:
        return HomeScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getScreen(_selectedIndex),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return CompanyPostJob1Screen();
            },
          ));
        },
        child: Icon(Icons.add, size: 30),
        backgroundColor: Color(0xff7D8AC3),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        currentIndex: _selectedIndex,
        onTap: _onTabSelected,
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(icon: Icon(Icons.work), label: "Jobs"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home")),
      body: Center(child: Text("Home Page")),
    );
  }
}

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Search")),
      body: Center(child: Text("Search Page")),
    );
  }
}
