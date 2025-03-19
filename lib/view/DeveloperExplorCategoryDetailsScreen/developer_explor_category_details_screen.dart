import 'package:flutter/material.dart';
import 'package:project/widgets/Shared/shared_back_arrow.dart';

class DeveloperExplorCategoryDetailsScreen extends StatelessWidget {
  const DeveloperExplorCategoryDetailsScreen({super.key});

  final List<JopModel> jopList = const [
    JopModel(
        jobName: 'Junior Backend Engineer',
        location: 'London, United Kingdom',
        minSalary: 500,
        maxSalary: 1000,
        image: 'assets/images/CompanyLogoImage.png'),
    JopModel(
        jobName: 'Junior Backend Engineer',
        location: 'London, United Kingdom',
        minSalary: 500,
        maxSalary: 1000,
        image: 'assets/images/CompanyLogoImage.png'),
    JopModel(
        jobName: 'Junior Backend Engineer',
        location: 'London, United Kingdom',
        minSalary: 500,
        maxSalary: 1000,
        image: 'assets/images/CompanyLogoImage.png'),
    JopModel(
        jobName: 'Junior Backend Engineer',
        location: 'London, United Kingdom',
        minSalary: 500,
        maxSalary: 1000,
        image: 'assets/images/CompanyLogoImage.png'),
    JopModel(
        jobName: 'Junior Backend Engineer',
        location: 'London, United Kingdom',
        minSalary: 500,
        maxSalary: 1000,
        image: 'assets/images/CompanyLogoImage.png'),
    JopModel(
        jobName: 'Junior Backend Engineer',
        location: 'London, United Kingdom',
        minSalary: 500,
        maxSalary: 1000,
        image: 'assets/images/CompanyLogoImage.png'),
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          /// **Back Arrow Positioned at the Top**
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(top: 16.0, left: 16, bottom: 16),
              child: sharedBackArrow(screenWidth, context),
            ),
          ),

          /// **List of Job Containers**
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return JopContainer(jopModel: jopList[index]);
              },
              childCount: jopList.length,
            ),
          ),
        ],
      ),
    );
  }
}

class JopModel {
  final String jobName;
  final String image;
  final String location;
  final int minSalary;
  final int maxSalary;
  const JopModel({
    required this.image,
    required this.jobName,
    required this.location,
    required this.minSalary,
    required this.maxSalary,
  });
}

class JopContainer extends StatefulWidget {
  const JopContainer({super.key, required this.jopModel});
  final JopModel jopModel;

  @override
  State<JopContainer> createState() => _JopContainerState();
}

class _JopContainerState extends State<JopContainer> {
  bool isSaved = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.5, horizontal: 16),
      margin: EdgeInsets.only(top: 16),
      height: 109,
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
      child: Row(
        children: [
          Image.asset(widget.jopModel.image),
          SizedBox(width: 8),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 7.5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.jopModel.jobName,
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 4),
                Text(
                  widget.jopModel.location,
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    ImageIcon(
                      AssetImage('assets/images/coins2.png'),
                      color: Color(0xff3F4D88),
                    ),
                    SizedBox(width: 20),
                    Text(
                      '\$ ${widget.jopModel.minSalary} - \$ ${widget.jopModel.maxSalary}',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff3F4D88)),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Spacer(),
          GestureDetector(
            onTap: () {
              setState(() {
                isSaved = !isSaved;
              });
            },
            child: Icon(
              isSaved ? Icons.bookmark : Icons.bookmark_border,
              color: isSaved ? Color(0xff465697) : Color(0xff5967A2),
              size: 24,
            ),
          ),
          SizedBox(width: 57),
        ],
      ),
    );
  }
}
