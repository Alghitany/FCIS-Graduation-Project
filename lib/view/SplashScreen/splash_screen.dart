import 'package:flutter/material.dart';

import '../OnBoardingScreen/on_boarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    // Animation Controller
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2), // Duration of the fade-in effect
    );

    // Fade-in Animation
    _fadeAnimation = Tween<double>(begin: 0, end: 1)
        .animate(CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),);

    // Start the animation
    _animationController.forward();

    // Navigate after 3 seconds
    Future.delayed(const Duration(seconds: 3), (){
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const OnBoardingScreen()),
        );
      }
    });
  }
  @override
  void dispose() {
    // Dispose the controller to avoid memory leaks
    _animationController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: SizedBox(
              width: screenWidth * 0.6,
              height: screenHeight * 0.3,
              child: Image.asset('assets/images/SplashLogo.png', fit: BoxFit.contain),
            ),
          ),
        ),
      ),
    );
  }
}
