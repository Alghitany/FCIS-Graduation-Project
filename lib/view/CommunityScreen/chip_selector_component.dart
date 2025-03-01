import 'package:flutter/material.dart';

class ChipSelector extends StatefulWidget {
  const ChipSelector({super.key});

  @override
  ChipSelectorState createState() => ChipSelectorState();
}

class ChipSelectorState extends State<ChipSelector> {
  int? selectedIndex; // No default selected index

  final List<String> options = ["UI", "Graphic Design", "Frontend", "Backend"];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(options.length, (index) {
        bool isSelected = index == selectedIndex;
        return GestureDetector(
          onTap: () {
            setState(() {
              selectedIndex = isSelected ? null : index; // Toggle selection
            });
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            margin: const EdgeInsets.symmetric(horizontal: 4),
            decoration: BoxDecoration(
              color: isSelected ? const Color(0xFF8A96C9) : const Color(0xFFF2F4F9),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              options[index],
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        );
      }),
    );
  }
}
