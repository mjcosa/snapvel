import 'package:flutter/material.dart';
import 'package:travel_app/auth/domain/entities/user.dart';
import 'package:travel_app/profile/presentation/cubits/states_profile.dart';
import 'profileheader.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/theme/main_theme.dart';
import 'package:travel_app/auth/presentation/cubits/auth_cubit.dart';
import 'package:travel_app/profile/presentation/cubits/cubits_profile.dart';

class InfoCard extends StatefulWidget {
  const InfoCard({Key? key}) : super(key: key);

  @override
  State<InfoCard> createState() => _InfoCard();
}

class _InfoCard extends State<InfoCard> {
  late final authCubit = context.read<AuthCubit>();
  late final profileCubit = context.read<ProfileCubit>();
  late AppUser? currentUser = authCubit.currentUser;

  @override
  void initState() {
    super.initState();
    profileCubit.fetchUserProfile(currentUser!.uid);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        if (state is ProfileLoaded) {
          final user = state.profileUser;

          return Scaffold(
            backgroundColor: ProfileAppColors.background,
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    ProfileHeader(userName: currentUser!.name),
                    Expanded(
                      child: ListView(
                        padding: const EdgeInsets.only(bottom: 20),
                        children: [
                          _buildInfoItem(
                            title: "Full Name",
                            detail: user.name,
                            icon: const Icon(Icons.person_outline, color: ProfileAppColors.wishlistIcon),
                          ),
                          _buildInfoItem(
                            title: "Email",
                            detail: user.email,
                            icon: const Icon(Icons.email_outlined, color: ProfileAppColors.favoriteIcon),
                          ),
                          _buildInfoItem(
                            title: "Phone Number",
                            detail: user.phoneno,
                            icon: const Icon(Icons.phone_outlined, color: ProfileAppColors.notificationIcon),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        } else if (state is ProfileLoading) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else {
          return const Scaffold(
            body: Center(child: Text("Error loading profile")),
          );
        }
      },
    );
  }

  Widget _buildInfoItem({
    required String title,
    required String detail,
    required Icon icon,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title, 
                  style: const TextStyle(
                    fontSize: 14, 
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  detail,
                  style: const TextStyle(
                    fontSize: 16, 
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          icon,
        ],
      ),
    );
  }
}
