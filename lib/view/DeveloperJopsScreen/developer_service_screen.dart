import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:project/view/DeveloperJopsScreen/course_name_container.dart';
import 'package:project/view/DeveloperJopsScreen/most_relevant_screen.dart';
import 'package:project/view/DeveloperJopsScreen/recently_psoted_screen.dart';
import 'package:project/widgets/Shared/shared_back_arrow.dart';

class DeveloperServiceScreen extends StatefulWidget {
  @override
  _DeveloperServiceScreenState createState() => _DeveloperServiceScreenState();
}

class _DeveloperServiceScreenState extends State<DeveloperServiceScreen> {
  bool showMostRelevant = true;
  TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: sharedBackArrow(screenWidth, context),
              ),
              SizedBox(
                height: 8,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
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
                  controller:
                      search, // Attach controller// Send message on enter
                  decoration: InputDecoration(
                    hintText: "Search for job",
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
                height: 32,
              ),
              _buildTabBar(),
              Divider(),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, bottom: 16),
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 12),
                      padding: const EdgeInsets.symmetric(
                          vertical: 4, horizontal: 12),
                      height: 30,
                      decoration: BoxDecoration(
                        color: Color(0xffF2F2F2),
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Center(
                        child: Row(children: [
                          Text(
                            'Sort',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          ImageIcon(AssetImage('assets/icons/down arrow.png'))
                        ]),
                      ),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 12),
                      padding: const EdgeInsets.symmetric(
                          vertical: 4, horizontal: 12),
                      height: 30,
                      decoration: BoxDecoration(
                        color: Color(0xffF2F2F2),
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Center(
                        child: Row(children: [
                          Text(
                            'highest paid',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            ),
                          ),
                        ]),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: showMostRelevant
                    ? MostRelevantScreen()
                    : RecentlyPsotedScreen(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTabBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
      child: Row(
        children: [
          _tabItem('Most Relevant', showMostRelevant, () {
            setState(() => showMostRelevant = true);
          }),
          _tabItem('Recently Posted', !showMostRelevant, () {
            setState(() => showMostRelevant = false);
          }),
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
                width: 114,
                color: Color(0xff97A1CF),
                margin: EdgeInsets.only(top: 4),
              ),
          ],
        ),
      ),
    );
  }
}

class SeeMoreText extends StatefulWidget {
  final String text;
  final int maxLines;

  const SeeMoreText({
    Key? key,
    required this.text,
    this.maxLines = 3,
  }) : super(key: key);

  @override
  _SeeMoreTextState createState() => _SeeMoreTextState();
}

class _SeeMoreTextState extends State<SeeMoreText> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: isExpanded
                ? widget.text
                : widget.text.length > 100
                    ? '${widget.text.substring(0, 100)}... '
                    : widget.text,
            style: const TextStyle(color: Colors.black),
          ),
          if (!isExpanded && widget.text.length > 100)
            TextSpan(
              text: 'see more',
              style: const TextStyle(
                fontSize: 13,
                color: Color(0xff465697),
                fontWeight: FontWeight.w500,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () => setState(() => isExpanded = true),
            ),
        ],
      ),
    );
  }
}
