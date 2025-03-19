import 'package:flutter/material.dart';
import 'package:project/view/DeveloperHomeScreen/developer_home_screen.dart';
import 'package:project/view/DeveloperJopsScreen/developer_service_screen.dart';

class DeveloperJopsScreen extends StatelessWidget {
  TextEditingController search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 24,
          ),
          Container(
            padding: EdgeInsets.all(16),
            width: double.infinity,
            height: 72,
            color: Color(0xffF5F6FA),
            child: Row(
              children: [
                Text(
                  '  Hi, \n ALi Mohamed',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                Spacer(),
                Image.asset('assets/images/profile.png')
              ],
            ),
          ),
          SizedBox(
            height: 24,
          ),
          Expanded(
              child: ListView(
            children: [
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
                height: 24,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    Text(
                      'Services for you',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    Spacer(),
                    Text(
                      'View All',
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
              ),
              ServiceContainer(
                ontap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return DeveloperServiceScreen();
                    },
                  ));
                },
                title: 'UX/UI designer',
                subTitle: '590 Freelancers available',
              ),
              ServiceContainer(
                ontap: () {},
                title: 'Front-end Developer',
                subTitle: '244 Freelancers available',
              ),
              SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    Text(
                      'Related Jobs',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    Spacer(),
                    Text(
                      'View All',
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
              ),
              SizedBox(
                height: 21,
              ),
              RelatedJopContainer(
                image: 'assets/images/companyLogo.png',
                text: 'Highspeed Studios',
                title: 'Backend Engineer',
                minSalary: 600,
                maxSalary: 900,
                location: 'Cairo, Egypt',
              ),
              RelatedJopContainer(
                image: 'assets/images/companyLogo (3).png',
                text: 'Highspeed Studios',
                title: 'Backend Engineer',
                minSalary: 600,
                maxSalary: 900,
                location: 'Cairo, Egypt',
              ),
              RelatedJopContainer(
                image: 'assets/images/companyLogo (3).png',
                text: 'Highspeed Studios',
                title: 'Backend Engineer',
                minSalary: 600,
                maxSalary: 900,
                location: 'Cairo, Egypt',
              ),
            ],
          ))
        ],
      ),
    );
  }
}

class ServiceContainer extends StatelessWidget {
  const ServiceContainer(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.ontap});
  final String title;
  final String subTitle;
  final VoidCallback ontap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.only(right: 16, left: 16, top: 12),
        height: 76,
        decoration: BoxDecoration(
            color: Color(0xffF2F2F2),
            border: Border(left: BorderSide(color: Color(0xff465697))),
            borderRadius: BorderRadius.circular(12)),
        child: Row(
          children: [
            Column(
              children: [
                Text(title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    )),
                SizedBox(
                  height: 4,
                ),
                Text(
                  subTitle,
                  style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff808080)),
                ),
              ],
            ),
            Spacer(),
            ImageIcon(
              AssetImage('assets/icons/Stroke 1.png'),
              color: Color(0xff465697),
            )
          ],
        ),
      ),
    );
  }
}

class RelatedJopContainer extends StatelessWidget {
  const RelatedJopContainer(
      {super.key,
      required this.image,
      required this.text,
      required this.title,
      required this.minSalary,
      required this.maxSalary,
      required this.location});
  @override
  final String text;
  final String title;
  final double minSalary;
  final double maxSalary;
  final String location;
  final String image;

  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 154,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 28,
              top: 20,
            ),
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 8),
                  width: 88,
                  height: 88,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  child: Image.asset(image),
                ),
                SizedBox(
                  width: 18,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      text,
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      title,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Row(
                      children: [
                        ImageIcon(
                          AssetImage('assets/images/coins2.png'),
                          color: Color(0xff5967A2),
                        ),
                        SizedBox(width: 15),
                        Text(
                          '\$ $minSalary - \$ $maxSalary',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: Color(0xff465697),
                        ),
                        SizedBox(width: 15),
                        Text(
                          location,
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Divider()
        ],
      ),
    );
  }
}
