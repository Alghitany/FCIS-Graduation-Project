import 'package:flutter_svg/svg.dart';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:project/widgets/Customized/custom_button.dart';

class CourseSelectionScreen extends StatefulWidget {
  @override
  Widget build(BuildContext context) {
    final random = Random();
    List<Widget> innerContainers = [];

    // Minimum container width
    double minContainerWidth = 109;

    // List to store the positions of the containers to prevent overlap
    List<Offset> positions = [];

    // List of courses to be displayed
    final List<String> courses = [
      "HTML",
      "Mysql",
      "JAVASCRIPT",
      "CSS",
      "C",
      "C++",
      "React",
      "BOOT STRAP",
      "UI/UX",
      "C#",
      "Java",
      "Cloud Storage"
    ];

    // Function to check if a new position overlaps with existing positions
    bool isOverlapping(
        Offset newPosition, double containerWidth, double containerHeight) {
      for (var position in positions) {
        // Check if the new position overlaps with any existing container
        if ((newPosition.dx < position.dx + containerWidth) &&
            (newPosition.dx + containerWidth > position.dx) &&
            (newPosition.dy < position.dy + containerHeight) &&
            (newPosition.dy + containerHeight > position.dy)) {
          return true;
        }
      }
      return false;
    }

    // Function to calculate text width dynamically
    double calculateTextWidth(String text, TextStyle style) {
      final textSpan = TextSpan(text: text, style: style);
      final textPainter = TextPainter(
        text: textSpan,
        maxLines: 2,
        textDirection: TextDirection.ltr,
      );
      textPainter.layout();
      return textPainter.width;
    }

    // Get the screen width and height for responsive design
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    // Padding from the parent container's border
    double parentPadding = 5;

    // Reduced container height to make the containers closer together
    double containerHeight =
        screenHeight * 0.04; // Reduced height to make containers closer

    // Generate containers with course names
    for (int i = 0; i < courses.length; i++) {
      double left, top;
      bool foundPosition = false;

      // Try to find a unique position
      while (!foundPosition) {
        // Calculate the text width for each course dynamically
        double textWidth =
            calculateTextWidth(courses[i], TextStyle(fontSize: 14));

        // Ensure the container's width is dynamic based on the text width, and apply a minimum width
        double containerWidth =
            max(textWidth + 60, minContainerWidth); // 70 padding on each side

        // Generate random position within bounds of parent container
        left = random.nextDouble() *
                (screenWidth - containerWidth - .5 * parentPadding) +
            parentPadding; // Random X position ensuring padding from the left

        // Calculate Y position based on container height
        top =
            (i * containerHeight) + parentPadding; // Avoid overlap with padding

        // Create an Offset for the current position
        Offset newPosition = Offset(left, top);

        // Check if the new position overlaps with any existing container
        if (!isOverlapping(newPosition, containerWidth, containerHeight)) {
          // If no overlap, add the position and create the container
          positions.add(newPosition);
          innerContainers.add(Positioned(
            left: left,
            top: top,
            child: Container(
              width: containerWidth,
              height: containerHeight,
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 20), // Horizontal padding
                  child: Text(
                    courses[i], // Display the course name
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14), // Adjust font size
                  ),
                ),
              ),
            ),
          ));
          foundPosition = true; // Stop the loop for this container
        }
      }
    }

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              sharedBackArrow(screenWidth, context),
              SizedBox(
                height: screenHeight * .039,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                child: Text(
                  "Select the course You're interested in..",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                child: CustomTextField(
                    myController: TextEditingController(),
                    hintText: 'Search course'),
              ),
              SizedBox(
                height: 40,
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Text(
                  'Our Popular Course:',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Color(0xffB3B3B3)),
                ),
              ),
              SizedBox(height: 20), // Adds spacing before the stack
              Expanded(
                child: Container(
                  width: screenWidth,
                  decoration: BoxDecoration(border: Border.all()),
                  child: Stack(
                    children: innerContainers,
                  ),
                ),
              ),
              SizedBox(
                height: 18,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  margin: EdgeInsets.only(right: 16),
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(8)),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('others '),
                      Icon(Icons.arrow_forward_sharp)
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                child: CustomButton(
                  text: 'Confirm',
                  onPressed: () {},
                ),
              ),
              SizedBox(
                height: 36,
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget sharedBackArrow(double screenWidth, BuildContext context) {
  return Align(
    alignment: Alignment.centerLeft,
    child: InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        width: screenWidth * 0.08,
        height: screenWidth * 0.08,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: const Color(0xFFE6E6E6))),
        child: const Icon(Icons.arrow_back),
      ),
    ),
  );
}

class CustomTextField extends StatefulWidget {
  final String? Function(String?)? validator;
  final TextEditingController myController;
  final String hintText;
  final bool isPassword;
  final VoidCallback? onSuffixTap;
  final Icon? icon;

  const CustomTextField({
    super.key,
    this.validator,
    required this.myController,
    required this.hintText,
    this.isPassword = false,
    this.onSuffixTap,
    this.icon,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _isObscured = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validator,
      controller: widget.myController,
      obscureText: widget.isPassword ? _isObscured : false,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: const TextStyle(
          fontSize: 14,
          fontFamily: "Poppins",
          fontWeight: FontWeight.w500,
          color: Color(0xFFC8CDE0),
        ),
        contentPadding: const EdgeInsets.only(top: 12, bottom: 12, left: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color(0xFF97A1CF)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color(0xFF97A1CF)),
        ),
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: SvgPicture.asset(
                  _isObscured
                      ? "assets/icons/EyeOpen.svg"
                      : "assets/icons/EyeClosed.svg",
                  height: 15,
                  width: 23,
                ),
                onPressed: () {
                  setState(() {
                    _isObscured = !_isObscured;
                  });
                },
              )
            : (widget.onSuffixTap != null
                ? InkWell(
                    onTap: widget.onSuffixTap,
                    child: const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Icon(
                        Icons.add,
                        color: Color(0xFFCCCCCC),
                        size: 24,
                      ),
                    ),
                  )
                : null),
      ),
    );
  }
}
