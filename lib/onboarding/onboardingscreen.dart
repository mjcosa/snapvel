import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_app/widgets/splashscreenwidget.dart';

class SplashScreen extends StatefulWidget {
  final VoidCallback onFinished;
  const SplashScreen({super.key, required this.onFinished});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int _currentIndex = 0;

  // List of data for each onboarding screen
  final List<_ScreenData> _screens = [
    _ScreenData(
      logoPath: 'assets/icons/snapvellogo.png',
      title: 'Snapvel',
      description: '',
    ),
    _ScreenData(
      logoPath: 'assets/images/splash1.jpg',
      title: 'Explore',
      description: 'Discover amazing places and share your experience.',
    ),
    _ScreenData(
      logoPath: 'assets/images/splash2.jpg',
      title: 'Create',
      description: 'Store and access your cherished photos easily',
    ),
    _ScreenData(
      logoPath: 'assets/images/splash3.jpg',
      title: 'Cherish',
      description: 'All your favorite moments, saved together',
    ),
    _ScreenData(
      logoPath: 'assets/images/splash4.jpg',
      title: 'Enjoy',
      description: 'Your best memories, all in one app.',
    ),
  ];

  void _handleNext() {
    if (_currentIndex < _screens.length - 1) {
      setState(() {
        _currentIndex++;
      });
    } else {
      widget.onFinished();
    }
  }

@override
Widget build(BuildContext context) {
  final screenSize = MediaQuery.of(context).size;
  final isTablet = screenSize.width <= 991 && screenSize.width > 640;
  final isMobile = screenSize.width <= 640;

  // Larger sizes for images and font
  double imageSize = 300.0;
  double fontSize = 30.0;

  if (isTablet) {
    imageSize = 400.0;
    fontSize = 26.0;
  } else if (isMobile) {
    imageSize = 280.0;
    fontSize = 24.0;
  }

  final currentScreen = _screens[_currentIndex];

  return Scaffold(
    backgroundColor: Colors.white,
    body: Stack(
      children: [
        // Bottom Left Circle
        const Positioned(
          left: -20,
          bottom: 0,
          child: DecorativeCircle(
            width: 173,
            height: 177,
            isTopRight: false,
          ),
        ),
        // Top Right Circle
        const Positioned(
          right: 0,
          top: -41,
          child: DecorativeCircle(
            width: 168,
            height: 177,
            isTopRight: true,
          ),
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,  // Center vertically
            crossAxisAlignment: CrossAxisAlignment.center, // Center horizontally
            mainAxisSize: MainAxisSize.min,
            children: [
              // Show logo for first screen, larger image for others
              ClipRRect(
                borderRadius: BorderRadius.circular(20),  // Adjust radius as you like
                child: Image.asset(
                  currentScreen.logoPath,
                  width: imageSize,
                  height: imageSize,
                  fit: BoxFit.cover,  // Use cover to fill the rounded rectangle nicely
                  errorBuilder: (context, error, stackTrace) => const SizedBox.shrink(),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                currentScreen.title,
                textAlign: TextAlign.center,  // Center text horizontally
                style: GoogleFonts.sen(
                  fontSize: fontSize,
                  fontWeight: FontWeight.w800,
                  color: const Color(0xFF1F214D),
                  height: 36 / 30, // lineHeight equivalent
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: Text(
                  currentScreen.description,
                  textAlign: TextAlign.center,  // Center text horizontally
                  style: GoogleFonts.sen(
                    fontSize: 16,
                    color: const Color(0xFF666666),
                    height: 1.4,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: _handleNext,
                child: Text(_currentIndex == _screens.length - 1 ? 'Get Started' : 'Next'),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

}

class _ScreenData {
  final String logoPath;
  final String title;
  final String description;

  _ScreenData({
    required this.logoPath,
    required this.title,
    required this.description,
  });
}
