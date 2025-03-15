import 'package:flutter/material.dart';
import 'package:project/view/company_jops_screen/company_jops_screen.dart';

class CompanyProfileScreen extends StatefulWidget {
  const CompanyProfileScreen({super.key});

  @override
  State<CompanyProfileScreen> createState() => _CompanyProfileScreenState();
}

class _CompanyProfileScreenState extends State<CompanyProfileScreen> {
  void _deleteJob(int index) {
    setState(() {
      jobs.removeAt(index);
    });
  }

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(right: 16.0, left: 16, top: 32),
        child: Column(
          children: [
            Center(
              child: Container(
                width: 104,
                height: 104,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(64),
                    image: DecorationImage(
                        image: AssetImage(
                            'assets/images/DefaultCompanyProfileImage.png'))),
              ),
            ),
            SizedBox(
              height: 34,
            ),
            Text(
              'Company Name',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              'Mansoura',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff808080)),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              width: 216,
              height: 56,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset('assets/images/phone.png'),
                  Image.asset('assets/images/message.png'),
                  Image.asset('assets/images/location.png'),
                ],
              ),
            ),
            SizedBox(
              height: 11,
            ),
            Container(
              height: 77,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text(
                        'Jobs',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff808080)),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        '4 Jobs',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: VerticalDivider(
                      color: Color(0xffCCCCCC),
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        'Applicants',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff808080)),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        '3 Applicant',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 33,
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                'All Jobs',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(
              height: 12,
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
    );
  }
}
