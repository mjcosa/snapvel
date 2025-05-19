import 'package:flutter/material.dart';
import 'package:travel_app/chat/widget/chatbox.dart';
import 'package:travel_app/chat/widget/chatbubble.dart';
import 'package:travel_app/post/presentation/pages/home_screen.dart';
import 'package:travel_app/feed/feedscreen.dart';
import 'package:travel_app/gallery/photo_gallery_screen.dart';
import 'package:travel_app/addpost/createpost.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({Key? key}) : super(key: key);
  
  @override
  State<MessageScreen> createState() => _MsgScreenState();
  
}

class _MsgScreenState extends State<MessageScreen> {
  var _selectedIndex = 0;
    
  void _onNavItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }


@override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Colors.white,
    body: Center(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.0),
        ),
        constraints: const BoxConstraints(maxWidth: 480),
        child: const Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(74, 62, 74, 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 11.0),
                        child: Text(
                          'Karl Sto D. Great',
                          style: TextStyle(
                            color: Color(0xFF181C2E),
                            fontSize: 17,
                            fontFamily: 'Sen',
                          ),
                        ),
                      ),
                      MessageBubble(
                        message: 'Are you coming?',
                        time: '8:10 pm',
                        isSent: true,
                        showTimeCenter: true,
                      ),
                      MessageBubble(
                        message: 'Hay, Congratulation for UIAUIA',
                        time: '8:11 pm',
                        isSent: false,
                      ),
                      MessageBubble(
                        message: 'Hey Where are you now?',
                        time: '8:11 pm',
                        isSent: true,
                      ),
                      MessageBubble(
                        message: "I'm Coming , just wait ...",
                        time: '8:12 pm',
                        isSent: false,
                        showTimeCenter: true,
                      ),
                      MessageBubble(
                        message: 'Hurry Up, Man',
                        time: '8:12 pm',
                        isSent: true,
                      ),
                      MessageInput(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
    bottomNavigationBar: _buildBottomNavigation(),
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
          Navigator.push(context, MaterialPageRoute(builder: (context) => const CreatePost()));
          break;
        case 2:
          Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
          break;
        case 3:
          Navigator.push(context, MaterialPageRoute(builder: (context) => const FeedScreen()));
          break;
        case 4:
          Navigator.push(context, MaterialPageRoute(builder: (context) => const PhotoGalleryScreen()));
          break;
      }
    },
    child: Stack(
      alignment: Alignment.center,
      clipBehavior: Clip.none,
      children: [
        if (isSelected)
          Positioned(
            top: -10,
            left: -19,
            child: Container(
              width: 70,
              height: 70,
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