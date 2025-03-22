import 'package:flutter/material.dart';
import 'package:project/widgets/Shared/shared_back_arrow.dart';

import 'job_card.dart';

class JobAppliedScreen extends StatefulWidget {
  const JobAppliedScreen({super.key});

  @override
  State<JobAppliedScreen> createState() => _JobAppliedScreenState();
}

class _JobAppliedScreenState extends State<JobAppliedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 16,),
                  sharedBackArrow(343, context),
                  SizedBox(height: 16,),
                  Text(
                    'Job Applied',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF7E89B7),
                    ),
                  ),
                  SizedBox(height: 32,),
                  JobCard(),
                  SizedBox(height: 16,),
                  JobCard(),
                  SizedBox(height: 16,),
                  JobCard(),
                  SizedBox(height: 16,),
                  JobCard(),
                  SizedBox(height: 16,),
                  JobCard(),
                  SizedBox(height: 16,),
                  JobCard(),
                  SizedBox(height: 16,),
                  JobCard(),

                ],
              ),
            ),
          ),
      ),
    );
  }
}
