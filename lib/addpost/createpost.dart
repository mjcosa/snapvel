import 'package:flutter/material.dart';
import 'package:travel_app/widgets/createpostwidget.dart';
import 'package:travel_app/post/presentation/pages/home_screen.dart';
import 'package:travel_app/feed/feedscreen.dart';
import 'package:travel_app/gallery/photo_gallery_screen.dart';
import 'package:travel_app/chat/chatscreen.dart';

class CreatePost extends StatefulWidget {
  const CreatePost({Key? key}) : super(key: key);

  @override
  CreatePostState createState() => CreatePostState();
}

class CreatePostState extends State<CreatePost> {
  String selectedTab = 'home';  
  bool showPhotoUpload = false;
  String location = '';
  int photoCount = 0;
  int messageCount = 0;

  void handlePhotoUpload() {
    if (photoCount < 1) {
      setState(() {
        photoCount++;
      });
    }
  }
  
  var _selectedIndex = 1;
    
  void _onNavItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: InputDesignStyles.defaultPadding,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                  color: const Color(0xFFECF0F4),
                  borderRadius: BorderRadius.circular(45),
                ),
                child: const Icon(Icons.menu, color: InputDesignStyles.textPrimary),
              ),
              const SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'JUAN DELA CRUZ',
                    style: InputDesignStyles.titleStyle,
                  ),
                  Text(
                    'jcruz@gmail.com',
                    style: InputDesignStyles.subtitleStyle,
                  ),
                ],
              ),
            ],
          ),
          Container(
            width: 45,
            height: 45,
            decoration: BoxDecoration(
              color: InputDesignStyles.primaryColor,
              borderRadius: BorderRadius.circular(45),
            ),
            child: const Icon(Icons.person_outline, color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget _buildPhotoUpload() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: InputDesignStyles.greyBackground,
        borderRadius: BorderRadius.circular(10),
      ),
      child: showPhotoUpload
          ? GestureDetector(
              onTap: handlePhotoUpload,
              child: Container(
                height: 120,
                decoration: BoxDecoration(
                  color: const Color(0xFFE5E5E5),
                  borderRadius: BorderRadius.circular(8),
                ),
                alignment: Alignment.center,
                child: Text(
                  '$photoCount/1',
                  style: const TextStyle(color: InputDesignStyles.iconGrey),
                ),
              ),
            )
          : GestureDetector(
              onTap: () => setState(() => showPhotoUpload = true),
              child: Column(
                children: [
                  const Icon(Icons.add, size: 28),
                  const SizedBox(height: 4),
                  Text(
                    'Add Photo',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  Widget _buildLocationInput() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: InputDesignStyles.defaultPadding),
      child: Stack(
        children: [
          TextField(
            onChanged: (value) => setState(() => location = value),
            decoration: const InputDecoration(
              hintText: 'Location',
              border: UnderlineInputBorder(),
            ),
            style: const TextStyle(fontSize: 16),
          ),
          const Positioned(
            right: 10,
            top: 15,
            child: Text(
              '0/30',
              style: TextStyle(color: InputDesignStyles.iconGrey),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: InputDesignStyles.defaultPadding),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity, // Full width inside the padding
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: InputDesignStyles.accentColor,
                padding: const EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(InputDesignStyles.borderRadius),
                ),
              ),
              child: Text('POST', style: InputDesignStyles.buttonTextStyle),
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: InputDesignStyles.greyBackground,
                padding: const EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(InputDesignStyles.borderRadius),
                ),
              ),
              child: Text('CANCEL', style: InputDesignStyles.buttonTextStyle),
            ),
          ),
        ],
      ),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: InputDesignStyles.backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxWidth: InputDesignStyles.maxContentWidth,
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      _buildHeader(),
                      const SizedBox(height: 24),
                      _buildPhotoUpload(),
                      const SizedBox(height: 24),
                      _buildLocationInput(),
                      const SizedBox(height: 24),
                      _buildButtons(),
                    ],
                  ),
                ),
              ),
            ),
            _buildBottomNavigation(),
          ],
        ),
      ),
    );
  }
}