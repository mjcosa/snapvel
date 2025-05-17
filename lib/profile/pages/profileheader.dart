import 'package:flutter/material.dart';
import 'package:travel_app/post/presentation/pages/editprofile_page.dart';
import '../../theme/main_theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/auth/presentation/cubits/auth_cubit.dart';
import 'package:travel_app/profile/data/firebase_profile_repo.dart';
import 'package:travel_app/profile/presentation/cubits/cubits_profile.dart';

class ProfileHeader extends StatelessWidget {
  final String userName; // <- Add this!

   const ProfileHeader({Key? key, required this.userName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () => Navigator.maybePop(context),
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: const BoxDecoration(
                    color: ProfileAppColors.iconCircle,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.arrow_back, color: ProfileAppColors.text),
                ),
              ),
              const Text(
                'Profile',
                style: TextStyle(
                  fontFamily: 'Sen',
                  fontSize: 17,
                  color: ProfileAppColors.text,
                ),
              ),
                GestureDetector(
                  onTap: () {
                    final user = context.read<AuthCubit>().currentUser;
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => BlocProvider(
                        create: (context) => ProfileCubit(profileRepo: FirebaseProfileRepo()),
                      child: ProfilePage(uid: user!.uid),
                        )
                    ));
                  },
                  child: const Icon(Icons.more_horiz, color: ProfileAppColors.text), // move here
                ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Row(
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: const BoxDecoration(
                  color: ProfileAppColors.primary,
                  shape: BoxShape.circle,
                ),
                child: const Center(
                  child: Icon(
                    Icons.person_outline,
                    color: Colors.white,
                    size: 50,
                  ),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Text(
                  userName.toUpperCase(), 
                  style: const TextStyle(
                    fontFamily: 'Sen',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: ProfileAppColors.text,
                  ),
                  overflow: TextOverflow.ellipsis, 
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
