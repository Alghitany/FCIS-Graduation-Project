import 'package:flutter/material.dart';
import 'package:project/widgets/Customized/custom_button.dart';
import 'package:project/widgets/Shared/shared_back_arrow.dart';

class PaymentOptionScreen extends StatelessWidget {
  const PaymentOptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
              padding: EdgeInsets.only(right: 16,left: 16,top: 16),
              child: Column(
                children: [
                  sharedBackArrow(343, context),
                  SizedBox(height: 16,),
                  Text(
                    'Payment Option',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF7E89B7),
                    ),
                  ),
                  SizedBox(height: 72,),
                  Card(
                    elevation: 2, // Adds shadow effect
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16), // Rounded corners
                    ),
                    color: Colors.white, // Background color
                    child: Row(
                      children: [
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(top:21, bottom: 21 ,right: 18.0),
                          child: Text(
                            "Connected",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF6B78AC)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 32,),
                  Card(
                    elevation: 2, // Adds shadow effect
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16), // Rounded corners
                    ),
                    color: Colors.white, // Background color
                    child: Row(
                      children: [
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(top:21, bottom: 21 ,right: 18.0),
                          child: Text(
                            "Connected",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF6B78AC)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 124,),
                  CustomButton(
                      text: 'Add New Cart',
                      onPressed: (){
                        //TODO
                      },
                  )
                ],
              ),
          ),
      ),
    );
  }
}
