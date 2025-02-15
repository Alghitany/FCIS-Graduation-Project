import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/Customized/custom_button.dart';
import '../../widgets/Shared/shared_back_arrow.dart';
import 'alert_dialog_component.dart';
import 'bloc/timer_bloc.dart';
import 'bloc/timer_event.dart';
import 'bloc/timer_states.dart';
import 'custom_otp_container.dart';

class VerifyCodeScreen extends StatelessWidget {
  VerifyCodeScreen({super.key});
  final List<TextEditingController> _otpControllers = List.generate(4, (_) => TextEditingController());

  /// Validate OTP fields and check if the code matches `1111`
  void _validateAndProceed(BuildContext context) {
    // Check if all fields are filled
    bool allFieldsFilled = _otpControllers.every((controller) => controller.text.isNotEmpty);

    if (!allFieldsFilled) {
      // Show error if fields are not filled
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter the complete OTP.'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    // Combine the OTP inputs
    String otp = _otpControllers.map((controller) => controller.text).join();

    // Validate OTP
    if (otp == "1111") {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return alertDialog(context);
        },
      );
    } else {
      // Show error if OTP is incorrect
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Invalid verification code. Please try again.'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
    create: (_) => TimerBloc()..add(const StartTimerEvent(20)),
    child: Scaffold(
        body: SafeArea(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      sharedBackArrow(30, context),

                      const SizedBox(height: 8,),

                      const Text(
                        "Verify Code",
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                            fontFamily: "Poppins",
                            color: Color(0xFF333333)
                        ),
                      ),

                      const SizedBox(height: 16),

                      Image.asset(
                        'assets/images/VerifyCodeImage.png',
                        height: 300,
                        width: 375,
                        fit: BoxFit.contain,
                      ),

                      const SizedBox(height: 24),

                      RichText(
                        textAlign: TextAlign.center,
                        text: const TextSpan(
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            fontFamily: "Poppins",
                            color: Color(0xFFA2AACA),
                          ),
                          children: [
                            TextSpan(text: "Please enter the code we just sent to email\n"),
                            TextSpan(text: "example@gmail.com"),
                          ],
                        ),
                      ),

                      const SizedBox(height: 24,),

                      OTPInputFields(controllers: _otpControllers),

                      const SizedBox(height: 16,),

                      BlocBuilder<TimerBloc, TimerState>(
                        builder: (context, state) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const Text(
                                    "Resend",
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                      color: Color(0xFF384579),
                                    ),
                                  ),

                                  Text(
                                    state is TimerRunning
                                        ? ' 00:${state.remainingTime.toString().padLeft(2, '0')}'
                                        : ' 00:00',
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: "Poppins",
                                      color: Color(0xFFEBA61E),
                                    ),
                                  ),
                                ],
                              ),
                              GestureDetector(
                                onTap: state is TimerFinished
                                    ? () {
                                  context.read<TimerBloc>().add(const ResendCodeEvent(20));
                                }
                                    : null,
                                child: Text(
                                  "Didn’t get code?",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: "Poppins",
                                    color: state is TimerFinished
                                        ? const Color(0xFFEBA61E)
                                        : const Color(0xFF384579),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),

                      const SizedBox(height: 44,),

                      CustomButton(
                        text: "Verify",
                        onPressed: () => _validateAndProceed(context),
                      ),
                    ],
                  ),
                ),
            )
          ),
        ),
      );
    }
  }
class OTPInputFields extends StatelessWidget {
  final List<TextEditingController> controllers;

  OTPInputFields({required this.controllers, super.key});

  final List<FocusNode> _focusNodes = List.generate(4, (_) => FocusNode());

  void _handleTextChanged(String value, int index) {
    if (value.length == 1 && index < _focusNodes.length - 1) {
      _focusNodes[index + 1].requestFocus();
    } else if (value.isEmpty && index > 0) {
      _focusNodes[index - 1].requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(4, (index) {
        return CustomOTPContainer(
          controller: controllers[index],
          focusNode: _focusNodes[index],
          onChanged: (value) => _handleTextChanged(value, index),
        );
      }),
    );
  }
}
