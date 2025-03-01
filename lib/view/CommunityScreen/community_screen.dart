import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project/view/CommunityScreen/chip_selector_component.dart';

import '../../widgets/Shared/shared_back_arrow.dart';
import 'community_card_component.dart';

class CommunityScreen extends StatelessWidget {
  const CommunityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                sharedBackArrow(screenWidth,context),

                Text(
                    "Community",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Poppins",
                      color: Colors.black
                    ),
                ),

                SizedBox(height: 18,),

                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  height: 56,
                  width: 345,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 10,
                        spreadRadius: 1,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        "assets/icons/Search.svg",
                        fit: BoxFit.contain,
                        color: Colors.black,
                      ),
                      const SizedBox(width: 10),
                      const Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Search for..",
                            hintStyle: TextStyle(color: Color(0xFFCCCCCC)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 48,),

                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                      "For you",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        color: Colors.black,
                      ),
                  ),
                ),

                SizedBox(height: 8,),

                SizedBox(
                  height: 170,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: const [
                      CommunityCard(
                        communityName: "React",
                        memberCount: "10,602",
                        iconPath: "assets/icons/CommunityNameIcon.svg",
                      ),
                      SizedBox(width: 10),
                      CommunityCard(
                        communityName: "React",
                        memberCount: "10,602",
                        iconPath: "assets/icons/CommunityNameIcon.svg",
                      ),
                      SizedBox(width: 10),
                      CommunityCard(
                        communityName: "React",
                        memberCount: "10,602",
                        iconPath: "assets/icons/CommunityNameIcon.svg",
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 40,),

                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Communities by interests",
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ),

                SizedBox(
                  height: 50, // Adjust height as needed
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: const [
                      ChipSelector(),
                    ],
                  ),
                ),

                SizedBox(
                  height: 170,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: const [
                      CommunityCard(
                        communityName: "React",
                        memberCount: "10,602",
                        iconPath: "assets/icons/CommunityNameIcon.svg",
                      ),
                      SizedBox(width: 10),
                      CommunityCard(
                        communityName: "React",
                        memberCount: "10,602",
                        iconPath: "assets/icons/CommunityNameIcon.svg",
                      ),
                      SizedBox(width: 10),
                      CommunityCard(
                        communityName: "React",
                        memberCount: "10,602",
                        iconPath: "assets/icons/CommunityNameIcon.svg",
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
      ),
    );
  }
}
