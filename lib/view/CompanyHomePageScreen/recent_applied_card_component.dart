import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../CompanyChatWithDeveloperScreen/company_chat_with_developer_screen.dart';
import '../CompanySeeDeveloperResumeScreen/company_see_developer_resume_screen.dart';
import '../SendToApplicantsScreen/send_to_applicants_screen.dart';

Widget recentAppliedCardComponent(BuildContext context){
  return Padding(
    padding: const EdgeInsets.only(bottom: 12.0),
    child: Card(
        color: Colors.transparent,
        elevation: 0,
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: Color(0xFFF2F2F2)),
          borderRadius: BorderRadius.circular(8),
        ),
        child:Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 8, right: 16, bottom: 8),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.asset(
                          "assets/images/DefaultDeveloperProfileImage2.png",
                          width: 48,
                          height: 48,
                          fit: BoxFit.cover,
                        ),
                      ),

                      const SizedBox(width: 6,),

                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Client name",
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                color: Color(0xFF1A1A1A)
                            ),
                          ),

                          Text("Mansoura,Egypt.",
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w300,
                                fontSize: 12,
                                color: Color(0xFF4D4D4D)
                            ),
                          )
                        ],
                      ),

                      const Spacer(),

                      CircleAvatar(
                        radius: 16,
                        backgroundColor: const Color(0xFFF2F2F2),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: SvgPicture.asset(
                            "assets/icons/Phone.svg",
                            height: 16,
                            width: 16,
                            colorFilter: const ColorFilter.mode(
                              Color(0xFF999999),
                              BlendMode.srcIn,
                            ),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),

                      const SizedBox(width: 10,),

                      InkWell(
                        onTap: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: ((context)=> const CompanyChatWithDeveloperScreen())));
                        },
                        child: CircleAvatar(
                          radius: 16,
                          backgroundColor: const Color(0xFFF2F2F2),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: SvgPicture.asset(
                              "assets/icons/Message.svg",
                              height: 16,
                              width: 16,
                              colorFilter: const ColorFilter.mode(
                                Color(0xFF999999),
                                BlendMode.srcIn,
                              ),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 8.0,left: 40),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 125,
                          height: 28,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4)
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: ((context)=> const CompanySeeDeveloperResumeScreen())));
                            },
                            child: const Text("See Resume",
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF465697)
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(width: 38,),

                        SizedBox(
                          width: 125,
                          height: 28,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF7D8AC3),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4)
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (
                                      (context)=>const SendToApplicantsScreen())));
                            },
                            child: const Text("See Details",
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],

              ),
            ),
          ],
        )
    ),
  );
}