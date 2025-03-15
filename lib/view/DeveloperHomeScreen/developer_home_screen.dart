import 'package:flutter/material.dart';
import 'package:project/view/InterestedCourses/interested_courses_screen.dart';

class DeveloperHomeScreen extends StatefulWidget {
  @override
  _DeveloperHomeScreenState createState() => _DeveloperHomeScreenState();
}

class _DeveloperHomeScreenState extends State<DeveloperHomeScreen> {
  int _selectedIndex = 0;
  bool _isJobsSelected = true;

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
        return JopsScreen();
      case 3:
        return JopsScreen();
      default:
        return HomeScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getScreen(_selectedIndex),
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
  TextEditingController search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Column(
                  children: [
                    Text(
                      'Hi, ALi',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      'What Would you like to learn \n Today? Search Below.',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    )
                  ],
                ),
                Spacer(),
                ImageIcon(AssetImage('assets/icons/icon (1).png')),
                SizedBox(
                  width: 16,
                ),
                ImageIcon(AssetImage('assets/icons/Doorbell.png'))
              ],
            ),
            SizedBox(
              height: 14,
            ),
            Container(
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 12,
                    spreadRadius: 0,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: TextField(
                controller: search, // Attach controller// Send message on enter
                decoration: InputDecoration(
                  hintText: "Search for..",
                  prefixIcon: Icon(Icons.search),
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
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                ),
              ),
            ),
            SizedBox(
              height: 48,
            ),
            Expanded(
                child: ListView(
              children: [
                Row(
                  children: [
                    Text(
                      'Polupar Courses',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    Spacer(),
                    Text(
                      'See All',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff465697)),
                    ),
                    ImageIcon(
                      AssetImage('assets/icons/Stroke 1.png'),
                      color: Color(0xff465697),
                    )
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                CoursesNameListView(),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 240,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return CourseContainerCard();
                    },
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Text(
                      'Recomended Jobs',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    Spacer(),
                    Text(
                      'See All',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff465697)),
                    ),
                    ImageIcon(
                      AssetImage('assets/icons/Stroke 1.png'),
                      color: Color(0xff465697),
                    )
                  ],
                ),
                SizedBox(
                  height: 13,
                ),
                RecommendedJopCardContainer(),
                RecommendedJopCardContainer(),
              ],
            ))
          ],
        ),
      ),
    );
  }
}

class RecommendedJopCardContainer extends StatefulWidget {
  const RecommendedJopCardContainer({super.key});

  @override
  State<RecommendedJopCardContainer> createState() =>
      _RecommendedJopCardContainerState();
}

class _RecommendedJopCardContainerState
    extends State<RecommendedJopCardContainer> {
  bool isSaved = false; // Track saved state

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      margin: EdgeInsets.only(bottom: 16, left: 4, right: 4),
      width: double.infinity,
      height: 109,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          blurStyle: BlurStyle.outer,
          color: Colors.black.withOpacity(0.2),
          blurRadius: 10,
          spreadRadius: 0,
          offset: const Offset(0, 4),
        )
      ], borderRadius: BorderRadius.circular(20)),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(right: 8),
            width: 88,
            height: 88,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            child: Image.asset('assets/images/companyLogo.png'),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 2.0, bottom: 4),
                child: Text(
                  'Junior Backend Engineer',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 8),
                child: Text(
                  'London, United Kingdom',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
                ),
              ),
              Row(
                children: const [
                  ImageIcon(
                    AssetImage('assets/images/coins2.png'),
                    color: Color(0xff5967A2),
                  ),
                  SizedBox(width: 20),
                  Text(
                    '\$500 - \$1,000',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                ],
              )
            ],
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              setState(() {
                isSaved = !isSaved; // Toggle saved state
              });
            },
            child: Icon(
              isSaved
                  ? Icons.bookmark
                  : Icons.bookmark_border, // Change icon dynamically
              color: isSaved
                  ? const Color(0xff465697)
                  : const Color(0xff5967A2), // Change color
              size: 24,
            ),
          ),
        ],
      ),
    );
  }
}

class CourseContainerCard extends StatefulWidget {
  const CourseContainerCard({super.key});

  @override
  State<CourseContainerCard> createState() => _CourseContainerCardState();
}

class _CourseContainerCardState extends State<CourseContainerCard> {
  bool isSaved = false; // Track saved state

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 11, bottom: 6),
      width: 277,
      height: 240,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(20), boxShadow: [
        BoxShadow(
          blurStyle: BlurStyle.outer,
          color: Colors.black.withOpacity(0.2),
          blurRadius: 10,
          spreadRadius: 0,
          offset: const Offset(0, 4),
        )
      ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            'assets/images/Course1.png',
            height: 134,
            width: double.infinity,
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                const Text(
                  'PhotoShop',
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff465697)),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isSaved = !isSaved; // Toggle state
                    });
                  },
                  child: Icon(
                    isSaved
                        ? Icons.bookmark
                        : Icons.bookmark_border, // Change icon
                    color: isSaved
                        ? Color(0xff465697)
                        : const Color(0xff5967A2), // Change color
                    size: 24,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 6),
          Padding(
            padding: EdgeInsets.only(left: 13.8, bottom: 7),
            child: Text(
              'Graphic Design Advanced',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 31),
            height: 23,
            child: Row(
              children: [
                const Text(
                  '7830 Views',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(width: 7),
                const VerticalDivider(
                  indent: 5,
                  endIndent: 1.5,
                  thickness: 4.29,
                  color: Color(0xff000000),
                ),
                const SizedBox(width: 6.3),
                const Icon(
                  Icons.star,
                  color: Color(0xffEBA61E),
                  size: 16,
                ),
                const SizedBox(width: 6.7),
                const Text(
                  '4.2',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CoursesNameListView extends StatefulWidget {
  const CoursesNameListView({super.key});

  @override
  State<CoursesNameListView> createState() => _CoursesNameListViewState();
}

class _CoursesNameListViewState extends State<CoursesNameListView> {
  int selectedIndex = -1;

  final List<String> courseNames = [
    'UI',
    'Graphic Design',
    'Frontend',
    'Backend',
    'Flutter'
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: courseNames.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: CousreNameContainer(
              name: courseNames[index],
              isSelected: selectedIndex == index, // Pass selection state
            ),
          );
        },
      ),
    );
  }
}

class CousreNameContainer extends StatelessWidget {
  const CousreNameContainer({
    required this.name,
    required this.isSelected,
    super.key,
  });

  final String name;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 21),
      height: 30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: isSelected ? const Color(0xff8A96C9) : const Color(0xffF2F4F9),
      ),
      child: Center(
        child: Text(
          name,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 13,
            color: isSelected
                ? Colors.white
                : Colors.black, // Change text color if selected
          ),
        ),
      ),
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

class JopsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Jops")),
      body: Center(child: Text("Jops Page")),
    );
  }
}

class CoursesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Courses")),
      body: Center(child: Text("Courses Screen")),
    );
  }
}
