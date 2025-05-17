import 'package:flutter/material.dart';
import 'package:travel_app/theme/main_theme.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentPage = 0;
  final totalPages = 4;

  final List<Map<String, String>> onboardingData = [
    {
      'image': 'images/onboard1.png',
      'title': 'All your favorites',
      'desc': 'Keep all your favorite photos in one place'
    },
    {
      'image': 'images/onboard2.png',
      'title': 'Share with ease',
      'desc': 'Share your moments effortlessly'
    },
    {
      'image': 'images/onboard3.png',
      'title': 'Access anytime',
      'desc': 'Access your gallery anytime, anywhere'
    },
    {
      'image': 'images/onboard4.png',
      'title': 'Stay organized',
      'desc': 'Organize your memories seamlessly'
    },
  ];

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size.width;
    final isSmallScreen = screenSize <= 640;

    return Scaffold(
      backgroundColor: GoletaAppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              Expanded(
                child: Column(
                  children: [
                    Image.asset(onboardingData[currentPage]['image']!,
                        width: isSmallScreen ? 180 : 240),
                    const SizedBox(height: 40),
                    Text(
                      onboardingData[currentPage]['title']!,
                      style: TextStyle(
                        fontFamily: 'Sen',
                        fontSize: isSmallScreen ? 20 : 24,
                        fontWeight: FontWeight.w800,
                        color: GoletaAppColors.headingText,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      onboardingData[currentPage]['desc']!,
                      style: TextStyle(
                        fontFamily: 'Sen',
                        fontSize: isSmallScreen ? 14 : 16,
                        color: GoletaAppColors.subheadingText,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        totalPages,
                        (index) => Container(
                          margin: const EdgeInsets.symmetric(horizontal: 6),
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: index == currentPage
                                ? GoletaAppColors.primaryButton
                                : GoletaAppColors.indicatorDot,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () => setState(() => currentPage =
                    currentPage + 1 == totalPages
                        ? totalPages - 1
                        : currentPage + 1),
                style: ElevatedButton.styleFrom(
                  backgroundColor: GoletaAppColors.primaryButton,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                child: Text(currentPage == totalPages - 1 ? 'START' : 'NEXT',
                    style: const TextStyle(
                        fontFamily: 'Sen', fontWeight: FontWeight.w700)),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const Text('Skip',
                    style: TextStyle(
                        fontSize: 16, color: GoletaAppColors.subheadingText)),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}