import 'package:flutter/material.dart';
import 'package:travel_app/chat/chatscreen.dart';
import 'package:travel_app/post/presentation/pages/home_screen.dart';
import 'package:travel_app/widgets/postcard.dart';


class FeedScreen extends StatefulWidget {
  const FeedScreen({Key? key}) : super(key: key);
  
  @override
  State<FeedScreen> createState() => _FeedScreenState();
  
}

class _FeedScreenState extends State<FeedScreen> {
  var _selectedIndex = 3;
    
  void _onNavItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 480),
          margin: const EdgeInsets.symmetric(horizontal: 8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          child: Column(
            children: [
              const SizedBox(height: 54),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // User Profile Section
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Juan Dela Cruz',
                                    style: TextStyle(
                                      color: Color(0xFF1F214D),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: 'Sen',
                                    ),
                                  ),
                                  Text(
                                    'jcruz@gmail.com',
                                    style: TextStyle(
                                      color: Color(0xFF676767),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Sen',
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(width: 3),
                              Padding(
                                padding: const EdgeInsets.only(top: 24),
                                child: Image.network(
                                  'https://cdn.builder.io/api/v1/image/assets/TEMP/6029676c620bbd52dddc70bb5eb55359a624c3aa?placeholderIfAbsent=true&apiKey=41aedbfc202f4fad9ee59f7f26112921',
                                  width: 8,
                                  height: 8 * 1.6,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 20),
                        Image.network(
                          'https://cdn.builder.io/api/v1/image/assets/TEMP/aad099be6ebbd99e32d9eb7f5bfe01b7e7aa563f?placeholderIfAbsent=true&apiKey=41aedbfc202f4fad9ee59f7f26112921',
                          width: 45,
                          height: 45,
                          fit: BoxFit.contain,
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    RichText(
                      text: const TextSpan(
                        style: TextStyle(
                          color: Color(0xFF1E1D1D),
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          height: 2,
                          fontFamily: 'Sen',
                        ),
                        children: [
                          TextSpan(text: 'Hey Juan, '),
                          TextSpan(
                            text: 'Good Day!',
                            style: TextStyle(fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    // First Post Card
                    const PostCard(
                      avatarUrl: 'https://cdn.builder.io/api/v1/image/assets/TEMP/aad099be6ebbd99e32d9eb7f5bfe01b7e7aa563f?placeholderIfAbsent=true&apiKey=41aedbfc202f4fad9ee59f7f26112921',
                      username: 'Crystal Davidson',
                      location: 'Boracay Malay, Aklan',
                      imageUrl: 'https://cdn.builder.io/api/v1/image/assets/TEMP/f4ff9843194e53988ac3e886b22c6e6b3ee00363?placeholderIfAbsent=true&apiKey=41aedbfc202f4fad9ee59f7f26112921',
                      likes: '1.2k',
                      comments: '52',
                    ),
                    const SizedBox(height: 24),
                    // Second Post Card
                    const PostCard(
                      avatarUrl: 'https://cdn.builder.io/api/v1/image/assets/TEMP/aad099be6ebbd99e32d9eb7f5bfe01b7e7aa563f?placeholderIfAbsent=true&apiKey=41aedbfc202f4fad9ee59f7f26112921',
                      username: 'Lebron James Reid',
                      location: 'Mount Apo Kidapawan, Cotabato',
                      imageUrl: 'https://cdn.builder.io/api/v1/image/assets/TEMP/5a41f4a7f712dad0621214eed9ca98179c93838a?placeholderIfAbsent=true&apiKey=41aedbfc202f4fad9ee59f7f26112921',
                      likes: '605',
                      comments: '14',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 21),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNavigation(), // <--- move this here!
    );
  }

  Widget _buildBottomNavigation() {
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 40, 28, 94), // Dark Purple Background
      ),
      padding:
          const EdgeInsets.symmetric(vertical: 6), // Reduced height slightly
      constraints: const BoxConstraints(maxWidth: 600),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _navItem(Icons.add, 'Chat', 0),
          _navItem(Icons.share, 'Post', 1),
          _navItem(Icons.home, 'Home', 2),
          _navItem(Icons.article, 'Feed', 3),
          _navItem(Icons.photo, 'Gallery', 4),
        ],
      ),
    );
  }

  Widget _navItem(IconData icon, String label, int index) {
  bool isSelected = _selectedIndex == index;

  return GestureDetector(
    onTap: () {
      _onNavItemTapped(index);
      // Navigate based on index
      switch (index) {
        case 0:
          Navigator.push(context, MaterialPageRoute(builder: (context) => const MessageScreen()));
          break;
        case 1:
          Navigator.push(context, MaterialPageRoute(builder: (context) => const Placeholder()));
          break;
        case 2:
          Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
          break;
        case 3:
          Navigator.push(context, MaterialPageRoute(builder: (context) => const FeedScreen()));
          break;
        case 4:
          Navigator.push(context, MaterialPageRoute(builder: (context) => const Placeholder()));
          break;
      }
    },
    child: Stack(
      alignment: Alignment.center,
      clipBehavior: Clip.none,
      children: [
        if (isSelected)
          Positioned(
            top: -20,
            child: Container(
              width: 90,
              height: 90,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 224, 171, 91),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.orange.withAlpha(13),
                    blurRadius: 15,
                    spreadRadius: 3,
                  ),
                ],
              ),
            ),
          ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: isSelected ? const Color.fromARGB(255, 0, 0, 0) : Colors.white70,
              size: 30,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? const Color.fromARGB(255, 0, 0, 0) : Colors.white70,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
}