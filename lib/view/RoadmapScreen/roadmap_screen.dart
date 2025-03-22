import 'package:flutter/material.dart';
import 'package:project/widgets/Shared/shared_back_arrow.dart';

import 'roadmap_card.dart';

class RoadmapScreen extends StatelessWidget {
  const RoadmapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 24,),
                    Row(
                      children: [
                        const SizedBox(width: 6,),
                        sharedBackArrow(343, context),
                        const SizedBox(width: 66,),
                        const Text(
                          'Roadmaps',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Poppins'
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 40,),
                    const RoadmapCard(
                      title: "Front End",
                      time: 20,
                    ),
                    SizedBox(height: 8,),
                    const RoadmapCard(
                      title: "UI / UX",
                      time: 15,
                    ),
                    SizedBox(height: 8,),
                    const RoadmapCard(
                      title: "Back End",
                      time: 30,
                    ),
                    SizedBox(height: 8,),
                    const RoadmapCard(
                      title: "Flutter",
                      time: 25,
                    ),
                  ],
                ),
              ),
          )
      ),
    );
  }
}
