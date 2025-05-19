import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/auth/presentation/cubits/auth_cubit.dart';
import 'package:travel_app/chat/chatscreen.dart';
import 'package:travel_app/profile/pages/profilemenu.dart';
import 'package:travel_app/profile/data/firebase_profile_repo.dart';
import 'package:travel_app/profile/presentation/cubits/cubits_profile.dart';
import 'package:travel_app/feed/feedscreen.dart';
import 'package:travel_app/gallery/photo_gallery_screen.dart';
import 'package:travel_app/addpost/createpost.dart';
import '../../../widgets/category_item.dart';
import '../../../widgets/recommended_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  State<HomeScreen> createState() => _HomeScreenState();
  
}

class _HomeScreenState extends State<HomeScreen> {
  var _selectedIndex = 2;
    
  void _onNavItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Container(
              constraints: const BoxConstraints(maxWidth: 600),
              margin: const EdgeInsets.symmetric(horizontal: 0),
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.only(
                          bottom: 80),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildHeader(),
                          const SizedBox(height: 20),
                          _buildGreeting(),
                          const SizedBox(height: 20),
                          _buildSearchBar(),
                          const SizedBox(height: 24),
                          _buildCategoriesSection(),
                          const SizedBox(height: 24),
                          _buildRecommendedSection(),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: _buildBottomNavigation(),
                  ),
                ],
              ),
            );
          },
        ),
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

Widget _buildHeader() {
  final user = context.read<AuthCubit>().currentUser;
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      const Icon(Icons.menu, size: 24, color: Color(0xFF1A1A1A)),
        Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            user!.email,
            style: const TextStyle(fontSize: 14, color: Color(0xFF666666)),
          ),
        ],
      ),
      GestureDetector(
        onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BlocProvider(
                  create: (context) => ProfileCubit(profileRepo: FirebaseProfileRepo()),
                  child: const ProfileScreen(), // No "const" here
                ),
              ),
            );
        },
        child: const Icon(Icons.person, size: 24, color: Color(0xFF1A1A1A)),
      ),
    ],
  );
}

  Widget _buildGreeting() {
    final user = context.read<AuthCubit>().currentUser;

    return Text(
        'Hey ${user?.name ?? 'Guest'}, Good Day!',
        style: const TextStyle(
        fontSize: 24, fontWeight: FontWeight.w600, color: Color(0xFF1A1A1A)),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: const TextField(
        decoration: InputDecoration(
          hintText: 'Search places',
          hintStyle: TextStyle(color: Color(0xFF666666), fontSize: 16),
          prefixIcon: Icon(Icons.search, color: Color(0xFF666666)),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 12),
        ),
        style: TextStyle(fontSize: 16),
      ),
    );
  }

  Widget _buildCategoriesSection() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'All Categories',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Color(0xFF1A1A1A),
              ),
            ),
            Row(
              children: [
                Text(
                  'See All',
                  style: TextStyle(color: Color(0xFF666666), fontSize: 14),
                ),
                SizedBox(width: 4),
                Icon(Icons.chevron_right, size: 16, color: Color(0xFF666666)),
              ],
            ),
          ],
        ),
        SizedBox(height: 16),

        // Wrap in SingleChildScrollView to ensure horizontal scrolling works
        SizedBox(
          height: 160,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal, // Enables sideways scrolling
            child: Row(
              children:[
                CategoryItem(
                  imageUrl:
                      'https://media.istockphoto.com/id/1442179368/photo/maldives-island.jpg?s=612x612&w=0&k=20&c=t38FJQ6YhyyZGN91A8tpn3nz9Aqcy_aXolImsOXOZ34=',
                  name: 'Beach',
                ),
                SizedBox(width: 12),
                CategoryItem(
                  imageUrl:
                      'https://images.stockcake.com/public/b/c/4/bc47d6bb-9ad3-4e30-8232-933b8255cdf5_large/mountain-reflection-view-stockcake.jpg',
                  name: 'Mountain',
                ),
                SizedBox(width: 12),
                CategoryItem(
                  imageUrl:
                      'https://images.unsplash.com/photo-1425913397330-cf8af2ff40a1?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8Zm9ycmVzdHxlbnwwfHwwfHx8MA%3D%3D',
                  name: 'Forrest',
                ),
                SizedBox(width: 12),
                CategoryItem(
                  imageUrl:
                      '',
                  name: 'City',
                ),
                SizedBox(width: 12),
                CategoryItem(
                  imageUrl: 'https://placehold.co/600x400/4682B4/4682B4',
                  name: 'Lake',
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRecommendedSection() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Recommended',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF1A1A1A)),
            ),
            Row(
              children: [
                Text('See All',
                    style: TextStyle(color: Color(0xFF666666), fontSize: 14)),
                SizedBox(width: 4),
                Icon(Icons.chevron_right, size: 16, color: Color(0xFF666666)),
              ],
            ),
          ],
        ),
        SizedBox(height: 16),
        RecommendedItem(
          imageUrl:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSgNgh9wEuxP21KK_JEDLHeep9q9Q6w5HsxjA&s',
          title: 'Padre Pio',
          location: 'Green Valley Panicuason, Naga City',
          rating: 4.7,
          deliveryType: 'Free',
          duration: '20 min',
        ),
      ],
    );
  }
}
