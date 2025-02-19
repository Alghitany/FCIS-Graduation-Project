import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'dart:io';
import 'package:image_picker/image_picker.dart';

class ProfileScreen extends StatefulWidget {
  final double screenWidth;
  final double screenHeight;

  const ProfileScreen({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
  });

  @override
  ProfileScreenState createState() => ProfileScreenState();
}

class ProfileScreenState extends State<ProfileScreen> {
  String? _imagePath;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Choose Image Source"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.camera),
                title: const Text("Camera"),
                onTap: () async {
                  Navigator.pop(context);
                  final pickedFile =
                  await _picker.pickImage(source: ImageSource.camera);
                  setState(() {
                    _imagePath = pickedFile?.path;
                  });
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text("Gallery"),
                onTap: () async {
                  Navigator.pop(context);
                  final pickedFile =
                  await _picker.pickImage(source: ImageSource.gallery);
                  setState(() {
                    _imagePath = pickedFile?.path;
                  });
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            CircleAvatar(
              radius: widget.screenWidth * 0.20,
              backgroundColor: const Color(0xFFE8F1FF),
              backgroundImage:
              _imagePath != null ? FileImage(File(_imagePath!)) : null,
              child: _imagePath == null
                  ? Padding(
                padding: EdgeInsets.only(top: widget.screenHeight * 0.07),
                child: SvgPicture.asset(
                  "assets/icons/FilledProfileIcon.svg",
                  height: widget.screenWidth * 0.3,
                  width: widget.screenWidth * 0.3,
                  colorFilter: const ColorFilter.mode(
                    Color(0xFFF5F9FF),
                    BlendMode.srcIn,
                  ),
                  fit: BoxFit.contain,
                ),
              )
                  : null, // Hide default icon when image is selected
            ),
            Positioned(
              bottom: 5,
              right: 5,
              child: InkWell(
                onTap: _pickImage,
                child: CircleAvatar(
                  radius: widget.screenWidth * 0.07,
                  backgroundColor: const Color(0xFF167F71),
                  child: SvgPicture.asset(
                    "assets/icons/EditIcon.svg",
                    height: widget.screenWidth * 0.06,
                    width: widget.screenWidth * 0.06,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
