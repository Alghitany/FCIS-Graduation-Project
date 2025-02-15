import 'package:flutter/material.dart';

class CustomLoginWith extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  final String icon;
  const CustomLoginWith({super.key, this.onPressed, required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFEDEFF5),
          disabledBackgroundColor: const Color(0xFFEDEFF5),
          minimumSize: const Size(double.infinity, 48),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: SizedBox(
          width: 180,
          height: 48,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  fontFamily: "Poppins",
                  color: Colors.black,
                ),
              ),

              Image.asset(icon,height: 24,width: 24,)
            ],
          ),
        )
    );
  }
}
