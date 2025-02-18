import 'package:flutter/material.dart';

import 'developer_details_offer_screen.dart';

Widget availablePeopleCard(BuildContext context){
  return Card(
    elevation: 0,
    shape: const RoundedRectangleBorder(
      side: BorderSide(color: Color(0xFFE6E6E6)), // Border color
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0, top: 3.0, right: 8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CircleAvatar(
                radius: 24,
                backgroundImage: AssetImage("assets/images/DefaultDeveloperProfileImage.png"),
              ),

              const SizedBox(width: 4,),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Client name",
                    style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Poppins',
                        color: Color(0xFF4D4D4D)
                    ),
                  ),

                  const Text("UI/UXDesigner",
                    style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w300,
                        fontFamily: 'Poppins',
                        color: Color(0xFFB3B3B3)
                    ),
                  ),

                  const SizedBox(
                    width: 100,
                    child: Text(
                      "Lorem ipsum dolor sit amet consect....",
                      style: TextStyle(
                        fontSize: 10,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w300,
                        color: Color(0xFF808080),
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                    ),
                  ),

                  SizedBox(
                      height: 25,
                      width: 100,
                      child: ElevatedButton(
                          onPressed: (){
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context)=> const DeveloperDetailsOfferScreen())
                                ));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF7D8AC3),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            minimumSize: const Size(100, 25),
                          ),
                          child:  const Text("Send Offer",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 7,
                              fontWeight: FontWeight.w500,
                              fontFamily: "Poppins",
                            ),
                          )
                      )
                  )
                ],
              ),

              const Text("20\$",
                style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w300,
                    fontFamily: 'Poppins',
                    color: Color(0xFF3F4D88)
                ),
              ),
            ],
          ),
        )
      ],
    ),
  );
}