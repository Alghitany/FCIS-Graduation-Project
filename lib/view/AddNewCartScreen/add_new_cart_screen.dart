import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project/widgets/Customized/custom_button.dart';
import 'package:project/widgets/Shared/shared_back_arrow.dart';

import '../../widgets/Customized/custom_text_field.dart';
import '../validation_text_field.dart';

class AddNewCartScreen extends StatefulWidget {

  const AddNewCartScreen({super.key});

  @override
  State<AddNewCartScreen> createState() => _AddNewCartScreenState();
}

class _AddNewCartScreenState extends State<AddNewCartScreen> {
  TextEditingController cardName = TextEditingController();
  TextEditingController cardNumber = TextEditingController();

  GlobalKey <FormState> formState = GlobalKey();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    cardName.dispose();
    cardNumber.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Form(
                key: formState,
                child: Column(
                  children: [
                    SizedBox(height: 16,),
                    sharedBackArrow(343, context),
                    SizedBox(height: 16,),
                    Text(
                        'Add New Cart',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF7E89B7),
                      ),
                    ),
                    SizedBox(height: 72,),
                    Image.asset('assets/images/CreditCard.png'),
                    SizedBox(height: 40,),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Card Name',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Poppins',
                          color: Color(0xFF4D4D4D)
                        ),
                      ),
                    ),
                    SizedBox(height: 16,),
                    CustomTextField(
                        myController: cardName,
                        hintText: "Enter card name",
                        validator: (value) => validateName(value ?? "")
                    ),
                    SizedBox(height: 24,),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Card Number',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Poppins',
                            color: Color(0xFF4D4D4D)
                        ),
                      ),
                    ),
                    SizedBox(height: 16,),
                    CustomTextField(
                      myController: cardNumber,
                      hintText: "****  **65  8765  3456",
                      //TODO Validator
                    ),
                    SizedBox(height: 44,),
                    CustomButton(
                        text: 'Add New Cart',
                        onPressed: (){
                          //TODO Navigation
                        },
                    )
                  ],
                ),
              ),
          ),
      ),
    );
  }
}
