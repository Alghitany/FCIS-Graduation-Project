import 'package:flutter/material.dart';
import 'package:project/view/CompanyPostJobScreen/company_post_job1_screen.dart';

class CompanyJobsScreen extends StatefulWidget {
  @override
  _CompanyJobsScreenState createState() => _CompanyJobsScreenState();
}

class _CompanyJobsScreenState extends State<CompanyJobsScreen> {
  int _selectedIndex = 2; // Default to Jobs tab
  bool _isJobsSelected = true; // Track selected tab

  final List<Map<String, String>> jobs = [
    {"title": "UI Designer", "location": "Mansoura, Egypt"},
    {"title": "UX Designer", "location": "Mansoura, Egypt"},
    {"title": "UX Research", "location": "Mansoura, Egypt"},
    {"title": "UI Designer", "location": "Mansoura, Egypt"},
    {"title": "UI Designer", "location": "Mansoura, Egypt"},
    {"title": "UX Designer", "location": "Mansoura, Egypt"},
    {"title": "UX Research", "location": "Mansoura, Egypt"},
    {"title": "UI Designer", "location": "Mansoura, Egypt"},
    {"title": "UI Designer", "location": "Mansoura, Egypt"},
    {"title": "UX Designer", "location": "Mansoura, Egypt"},
    {"title": "UX Research", "location": "Mansoura, Egypt"},
    {"title": "UI Designer", "location": "Mansoura, Egypt"},
  ];

  void _deleteJob(int index) {
    setState(() {
      jobs.removeAt(index);
    });
  }

  void _onTabSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onTabClicked(bool isJobs) {
    if (!isJobs) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ChatsScreen()),
      );
    } else {
      setState(() {
        _isJobsSelected = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(right: 16.0, left: 16, top: 48),
        child: Column(
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () => _onTabClicked(true),
                  child: Column(
                    children: [
                      Text(
                        "All Jobs",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: _isJobsSelected
                              ? Color(0xff97A1CF)
                              : Color(0xff666666),
                        ),
                      ),
                      if (_isJobsSelected)
                        Container(
                          margin: EdgeInsets.only(top: 4),
                          height: 2,
                          width: 60,
                          color: Color(0xff97A1CF),
                        ),
                    ],
                  ),
                ),
                SizedBox(width: 100),
                GestureDetector(
                  onTap: () => _onTabClicked(false),
                  child: Column(
                    children: [
                      Text(
                        "Chats",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: !_isJobsSelected
                              ? Color(0xff97A1CF)
                              : Color(0xff666666),
                        ),
                      ),
                      if (!_isJobsSelected)
                        Container(
                          margin: EdgeInsets.only(top: 4),
                          height: 2,
                          width: 50,
                          color: Color(0xff97A1CF),
                        ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 32,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: jobs.length,
                itemBuilder: (context, index) {
                  return JobCard(
                    title: jobs[index]["title"]!,
                    location: jobs[index]["location"]!,
                    onDelete: () => _deleteJob(index),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   type: BottomNavigationBarType.fixed,
      //   elevation: 0,
      //   backgroundColor: Colors.white,
      //   showUnselectedLabels: true,
      //   currentIndex: _selectedIndex,
      //   onTap: _onTabSelected,
      //   selectedItemColor: Color(0xff465697),
      //   unselectedItemColor: Color(0xff808080),
      //   items: [
      //     BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
      //     BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
      //     BottomNavigationBarItem(icon: Icon(Icons.work), label: "Jobs"),
      //     BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
      //   ],
      // ),
    );
  }
}

class ChatsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chats"),
        backgroundColor: Colors.purple,
      ),
      body: Center(child: Text("Chats Page")),
    );
  }
}

class JobCard extends StatelessWidget {
  final String title;
  final String location;
  final VoidCallback onDelete;

  JobCard(
      {required this.title, required this.location, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 0,
      margin: EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(
          side: BorderSide(color: Color(0xffCCCCCC)),
          borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.green,
          child: CircleAvatar(
            radius: 24,
            backgroundImage:
                AssetImage('assets/images/DefaultCompanyProfileImage.png'),
          ),
        ),
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(location),
        trailing: TextButton(
          onPressed: onDelete,
          child: Text("Delete",
              style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                  color: Color(0xffFF0000))),
        ),
      ),
    );
  }
}
