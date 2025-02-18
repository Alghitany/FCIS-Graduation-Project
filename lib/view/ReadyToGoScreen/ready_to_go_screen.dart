import 'package:flutter/material.dart';
import 'package:project/widgets/Customized/custom_button.dart';
import '../../widgets/Shared/shared_back_arrow.dart';
import '../DeveloperHomePageScreen/developer_home_page_screen.dart';

class ReadyToGoScreen extends StatelessWidget {
  const ReadyToGoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: sharedBackArrow(screenWidth,context),
              ),

              SizedBox(height: screenHeight * 0.02,),

              Image.asset(
                "assets/images/ReadyToGoImage.png",
                height: screenHeight * 0.5,
                width: screenWidth,
                fit: BoxFit.contain,
              ),

              SizedBox(height: screenHeight * 0.06,),

              const Text("You are ready to go",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Poppins',
                  color: Color(0xFF979797)
                ),
              ),

              SizedBox(height: screenHeight * 0.06,),
              
              CustomButton(text: "Start Journey",
              onPressed: (){
                Navigator.pushAndRemoveUntil(context,
                    MaterialPageRoute(builder: ((context)=> const DeveloperHomePageScreen())),
                    (route)=> false);
              },
              )

            ],
          )),
    );
  }
}
