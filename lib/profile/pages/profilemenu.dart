import 'package:flutter/material.dart';
import 'package:travel_app/auth/domain/entities/user.dart';
import 'package:travel_app/profile/pages/personalinfo.dart';
import 'profilelists.dart';
import 'profileheader.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/profile/pages/logout.dart';
import 'package:travel_app/theme/main_theme.dart';
import 'package:travel_app/auth/presentation/cubits/auth_cubit.dart';
import 'package:travel_app/profile/data/firebase_profile_repo.dart';
import 'package:travel_app/profile/presentation/cubits/cubits_profile.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreen();
}

class _ProfileScreen extends State<ProfileScreen>{

  late final authCubit = context.read<AuthCubit>();
  late final profileCubit = context.read<ProfileCubit>();

   late AppUser? currentUser = authCubit.currentUser;
  
  void _handleLogout() {
    // Implement logout logic here
    debugPrint('Logout pressed');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ProfileAppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              ProfileHeader(userName: currentUser!.name), // <- Pass userName here!
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.only(bottom: 20),
                  children: [
                    ProfileMenuItem(
                      title: 'Personal Info',
                      icon: const Icon(Icons.person_outline, color: ProfileAppColors.personalInfoIcon),
                      onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BlocProvider(
                                create: (context) => ProfileCubit(profileRepo: FirebaseProfileRepo()),
                                child: const InfoCard(), // No "const" here
                              ),
                            ),
                          );
                      },
                    ),
                    ProfileMenuItem(
                      title: 'Addresses',
                      icon: const Icon(Icons.location_on_outlined, color: ProfileAppColors.wishlistIcon),
                      onTap: () => debugPrint('Addresses pressed'),
                    ),
                    ProfileMenuItem(
                      title: 'Favourite',
                      icon: const Icon(Icons.favorite_outline, color: ProfileAppColors.favoriteIcon),
                      onTap: () => debugPrint('Favourite pressed'),
                    ),
                    ProfileMenuItem(
                      title: 'Notifications',
                      icon: const Icon(Icons.notifications_outlined, color: ProfileAppColors.notificationIcon),
                      onTap: () => debugPrint('Notifications pressed'),
                    ),
                    ProfileMenuItem(
                      title: 'FAQs',
                      icon: const Icon(Icons.help_outline, color: ProfileAppColors.text),
                      onTap: () => debugPrint('FAQs pressed'),
                    ),
                    ProfileMenuItem(
                      title: 'Settings',
                      icon: const Icon(Icons.settings_outlined, color: ProfileAppColors.text),
                      onTap: () => debugPrint('Settings pressed'),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: LogoutButton(onTap: _handleLogout),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
