// import 'package:flutter/material.dart';
// import 'package:project/widgets/Customized/send_message_container.dart';

// class DeveloperCommunityChatScreen extends StatefulWidget {
//   const DeveloperCommunityChatScreen({super.key});

//   @override
//   _DeveloperCommunityChatScreenState createState() =>
//       _DeveloperCommunityChatScreenState();
// }

// class _DeveloperCommunityChatScreenState
//     extends State<DeveloperCommunityChatScreen> {
//   final TextEditingController _messageController = TextEditingController();
//   List<Widget> messages = [ResiveMessage()]; // Store messages dynamically

//   void _sendMessage() {
//     String messageText = _messageController.text.trim(); // Get text
//     if (messageText.isNotEmpty) {
//       setState(() {
//         messages.add(
//             SendMessageContainer(messsage: messageText)); // Add message to list
//       });
//       _messageController.clear(); // Clear input field
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: Column(
//           children: [
//             // Top bar (exit icon)
//             Padding(
//               padding: const EdgeInsets.only(right: 16.0, top: 16),
//               child: Align(
//                 alignment: Alignment.topRight,
//                 child: ImageIcon(AssetImage('assets/icons/exit.png')),
//               ),
//             ),
//             SizedBox(height: 16),

//             // Profile and call button
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16.0),
//               child: Container(
//                 width: double.infinity,
//                 height: 80,
//                 child: Row(
//                   children: [
//                     Container(
//                       width: 56,
//                       height: 56,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(16),
//                         image: DecorationImage(
//                           fit: BoxFit.cover,
//                           image: AssetImage(
//                               'assets/images/DefaultDeveloperProfileImage2.png'),
//                         ),
//                       ),
//                     ),
//                     SizedBox(width: 10),
//                     Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text('Client Name',
//                             style: TextStyle(
//                                 fontSize: 16, fontWeight: FontWeight.w600)),
//                         SizedBox(height: 8),
//                         Text('UI Designer',
//                             style: TextStyle(
//                                 fontSize: 14,
//                                 fontWeight: FontWeight.w400,
//                                 color: Color(0xffB3B3B3))),
//                       ],
//                     ),
//                     Spacer(),
//                     GestureDetector(
//                       child: Image.asset('assets/images/phone2.png'),
//                       onTap: () {},
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             SizedBox(height: 8),

//             // Chat messages
//             Expanded(
//               child: Container(
//                 padding: EdgeInsets.only(left: 16, top: 16, right: 16),
//                 color: Color(0xffF2F4F5),
//                 child: ListView(
//                   children: [
//                     ...messages, // Display messages dynamically
//                   ],
//                 ),
//               ),
//             ),

//             // Input field with send button
//             Container(
//               padding: EdgeInsets.only(left: 16),
//               width: double.infinity,
//               height: 60,
//               color: Colors.white,
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   GestureDetector(
//                     onTap: () {},
//                     child: ImageIcon(AssetImage('assets/icons/emojy.png'),
//                         color: Color(0xff999999)),
//                   ),
//                   SizedBox(width: 15),

//                   // TextField with shadow
//                   Container(
//                     width: 246,
//                     height: 40,
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(15),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.black.withOpacity(0.2),
//                           blurRadius: 12,
//                           spreadRadius: 0,
//                           offset: Offset(0, 3),
//                         ),
//                       ],
//                     ),
//                     child: TextField(
//                       controller: _messageController, // Attach controller
//                       onSubmitted: (value) =>
//                           _sendMessage(), // Send message on enter
//                       decoration: InputDecoration(
//                         hintText: "Type your message",
//                         hintStyle: TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.w500,
//                             color: Color(0xffCCCCCC)),
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(15),
//                           borderSide: BorderSide.none,
//                         ),
//                         filled: true,
//                         fillColor: Colors.white,
//                         contentPadding:
//                             EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//                       ),
//                     ),
//                   ),

//                   SizedBox(width: 8),
//                   ImageIcon(AssetImage('assets/icons/microPhone.png'),
//                       color: Color(0xff666666)),
//                   SizedBox(width: 13.25),

//                   // Send button
//                   GestureDetector(
//                     onTap: _sendMessage, // Send message on tap
//                     child: ImageIcon(AssetImage('assets/icons/send.png'),
//                         color: Color(0xff465697)),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class ResiveMessage extends StatelessWidget {
//   const ResiveMessage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.only(bottom: 16),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.end,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Container(
//             padding: EdgeInsets.only(top: 16, right: 16, left: 16),
//             decoration: BoxDecoration(
//                 color: Color(0xffE6E6E6),
//                 borderRadius: BorderRadius.circular(16)),
//             width: 224,
//             height: 183,
//             child: Column(
//               children: [
//                 Text(
//                     style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
//                     'Lorem ipsum dolor sit amet consectetur. Congue donec imperdiet accumsan faucibus id amet vel leo at. Tellus vitae lacinia tristique consequat laoreet non mus ac interdum.  Tellus vitae lacinia tristique consequat. '),
//                 SizedBox(
//                   height: 12,
//                 ),
//                 Align(
//                     alignment: Alignment.topRight,
//                     child: Text(
//                       '08:20AM',
//                       style:
//                           TextStyle(fontWeight: FontWeight.w400, fontSize: 12),
//                     ))
//               ],
//             ),
//           ),
//           SizedBox(
//             width: 2,
//           ),
//           CircleAvatar(
//             backgroundColor: Colors.redAccent,
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:project/widgets/Customized/send_message_container.dart';

class DeveloperCommunityChatScreen extends StatefulWidget {
  const DeveloperCommunityChatScreen({super.key});

  @override
  _DeveloperCommunityChatScreenState createState() =>
      _DeveloperCommunityChatScreenState();
}

class _DeveloperCommunityChatScreenState
    extends State<DeveloperCommunityChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  List<Widget> messages = [ResiveMessage()]; // Store messages dynamically

  void _sendMessage() {
    String messageText = _messageController.text.trim(); // Get text
    if (messageText.isNotEmpty) {
      setState(() {
        messages.add(
            SendMessageContainer(messsage: messageText)); // Add message to list
      });
      _messageController.clear(); // Clear input field
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Top bar (exit icon)
            Padding(
              padding: const EdgeInsets.only(right: 16.0, top: 16),
              child: Align(
                alignment: Alignment.topRight,
                child: ImageIcon(AssetImage('assets/icons/exit.png')),
              ),
            ),
            SizedBox(height: 16),

            // Profile and call button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                width: double.infinity,
                height: 80,
                child: Row(
                  children: [
                    Container(
                      width: 56,
                      height: 56,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/images/react.png'),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Client Name',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600)),
                        SizedBox(height: 8),
                        Text('UI Designer',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Color(0xffB3B3B3))),
                      ],
                    ),
                    Spacer(),
                    GestureDetector(
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/icons/add.png'),
                          ),
                        ),
                      ),
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 8),

            // Chat messages
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 16, top: 16, right: 16),
                color: Color(0xffF2F4F5),
                child: ListView(
                  children: [
                    ...messages, // Display messages dynamically
                  ],
                ),
              ),
            ),

            // Input field with send button
            Container(
              padding: EdgeInsets.only(left: 16),
              width: double.infinity,
              height: 60,
              color: Colors.white,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: ImageIcon(AssetImage('assets/icons/emojy.png'),
                        color: Color(0xff999999)),
                  ),
                  SizedBox(width: 15),

                  // TextField with shadow
                  Expanded(
                    child: Container(
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
                        controller: _messageController, // Attach controller
                        onSubmitted: (value) =>
                            _sendMessage(), // Send message on enter
                        decoration: InputDecoration(
                          hintText: "Type your message",
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
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 16, vertical: 12),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(width: 8),
                  ImageIcon(AssetImage('assets/icons/microPhone.png'),
                      color: Color(0xff666666)),
                  SizedBox(width: 13.25),

                  // Send button
                  GestureDetector(
                    onTap: _sendMessage, // Send message on tap
                    child: ImageIcon(AssetImage('assets/icons/send.png'),
                        color: Color(0xff465697)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ResiveMessage extends StatelessWidget {
  const ResiveMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(top: 16, right: 16, left: 16),
            decoration: BoxDecoration(
                color: Color(0xffE6E6E6),
                borderRadius: BorderRadius.circular(16)),
            width: 224,
            height: 183,
            child: Column(
              children: [
                Text(
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                    'Lorem ipsum dolor sit amet consectetur. Congue donec imperdiet accumsan faucibus id amet vel leo at. Tellus vitae lacinia tristique consequat laoreet non mus ac interdum.  Tellus vitae lacinia tristique consequat. '),
                SizedBox(
                  height: 12,
                ),
                Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      '08:20AM',
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 12),
                    ))
              ],
            ),
          ),
          SizedBox(
            width: 2,
          ),
          CircleAvatar(
            backgroundColor: Colors.redAccent,
          ),
        ],
      ),
    );
  }
}
