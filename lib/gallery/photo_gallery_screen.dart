import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_app/chat/chatscreen.dart';
import 'package:travel_app/feed/feedscreen.dart';
import 'package:travel_app/post/presentation/pages/home_screen.dart';
import 'package:travel_app/addpost/createpost.dart';

class PhotoGalleryScreen extends StatefulWidget {
  const PhotoGalleryScreen({Key? key}) : super(key: key);

  @override
  State<PhotoGalleryScreen> createState() => _PhotoGalleryScreenState();
}

class _PhotoGalleryScreenState extends State<PhotoGalleryScreen> {
  int _currentIndex = 4; // Home is selected by default

  void _onNavItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: _buildMainContent(context),
      ),
      bottomNavigationBar: _buildBottomNavigation(context), // FIXED HERE
    );
  }


  Widget _buildMainContent(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 375),
        margin: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width > 375
              ? (MediaQuery.of(context).size.width - 375) / 2
              : 0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            _buildGreeting(),
            _buildSearchBar(),
            _buildPhotoSections(),
            const SizedBox(height: 100), // Space for bottom navigation
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 54, 24, 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildUserInfo(),
          _buildProfilePicture(),
        ],
      ),
    );
  }

  Widget _buildUserInfo() {
    return Row(
      children: [
        _buildMenuButton(),
        const SizedBox(width: 18),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'JUAN DELA CRUZ',
              style: GoogleFonts.sen(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF1F214D),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'jcruz@gmail.com',
              style: GoogleFonts.sen(
                fontSize: 14,
                color: const Color(0xFF676767),
              ),
            ),
            const SizedBox(height: 4),
          ],
        ),
      ],
    );
  }

  Widget _buildMenuButton() {
    return Container(
      width: 45,
      height: 45,
      decoration: BoxDecoration(
        color: const Color(0xFFECF0F4),
        borderRadius: BorderRadius.circular(45),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          3,
          (index) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: Container(
              width: 16,
              height: 2,
              decoration: BoxDecoration(
                color: const Color(0xFF181C2E),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProfilePicture() {
    return Container(
      width: 45,
      height: 45,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage('assets/icons/profile.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }


  Widget _buildGreeting() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 0, 24, 20),
      child: RichText(
        text: TextSpan(
          style: GoogleFonts.sen(
            fontSize: 16,
            color: const Color(0xFF1E1D1D),
          ),
          children: [
            const TextSpan(text: 'Hey Juan, '),
            TextSpan(
              text: 'Good Day!',
              style: GoogleFonts.sen(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      margin: const EdgeInsets.fromLTRB(24, 0, 24, 30),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFF6F6F6),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color(0xFFA0A5BA),
                width: 2,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search Album',
                hintStyle: GoogleFonts.sen(
                  fontSize: 14,
                  color: const Color(0xFF676767),
                ),
                border: InputBorder.none,
                isDense: true,
                contentPadding: EdgeInsets.zero,
              ),
              style: GoogleFonts.sen(
                fontSize: 14,
                color: const Color(0xFF676767),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPhotoSections() {
    return Column(
      children: [
        _buildPhotoSection(
          'My Favorites',
          [
            'assets/images/s1.jpg',
            'assets/images/s2.jpg'
          ],
          [
            'Person with arms raised overlooking coastal view',
            'Person looking at mountain lake view'
          ],
        ),
        _buildPhotoSection(
          'Beach & Chill',
          [
            'assets/images/s5.jpg',
            'assets/images/s6.jpg'
          ],
          [
            'Person relaxing at beach',
            'People sitting in beach chairs'
          ],
        ),
        _buildPhotoSection(
          'Mountain Hike',
          [
            'assets/images/s3.jpg',
            'assets/images/s4.jpg'
          ],
          [
            'Person at mountain summit',
            'Person overlooking mountain valley'
          ],
        ),
      ],
    );
  }

  Widget _buildPhotoSection(String title, List<String> imageUrls, List<String> altTexts) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.sen(
              fontSize: 20,
              color: const Color(0xFF32343E),
            ),
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              Expanded(
                child: _buildPhotoItem(imageUrls[0], altTexts[0]),
              ),
              const SizedBox(width: 23),
              Expanded(
                child: _buildPhotoItem(imageUrls[1], altTexts[1]),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPhotoItem(String imageUrl, String altText) {
    return AspectRatio(
      aspectRatio: 154 / 131,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          image: DecorationImage(
            image: imageUrl.startsWith('http')
              ? NetworkImage(imageUrl)
              : AssetImage(imageUrl) as ImageProvider,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

    Widget _buildBottomNavigation(BuildContext context) {
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
  bool isSelected = _currentIndex == index;

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

}}
