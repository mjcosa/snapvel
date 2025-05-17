import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/auth/domain/entities/user.dart';
import 'package:travel_app/auth/presentation/cubits/auth_cubit.dart';
import 'package:travel_app/post/presentation/pages/info_card.dart';
import 'package:travel_app/profile/presentation/cubits/cubits_profile.dart';
import 'package:travel_app/profile/presentation/cubits/states_profile.dart';

class ProfilePage extends StatefulWidget {
  final String uid;

  const ProfilePage({super.key, required this.uid});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
    
  late final authCubit = context.read<AuthCubit>();
  late final profileCubit = context.read<ProfileCubit>();

  late final AppUser? currentUser = authCubit.currentUser;

  @override
  void initState(){
    super.initState();

    profileCubit.fetchUserProfile(widget.uid);
  }

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {

        if (state is ProfileLoaded) {
          return Scaffold(
              appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              automaticallyImplyLeading: false,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Personal Info',
                    style: TextStyle(
                      fontSize: 17,
                      color: Color(0xFF181C2E),
                      fontFamily: 'Sen',
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // TODO: Handle Edit Action
                    },
                    child: const Text(
                      'EDIT',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFFFF7622),
                        decoration: TextDecoration.underline,
                        fontFamily: 'Sen',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            body: SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                        Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: const Color(0xFF1F214D),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: const Icon(
                          Icons.person_outline,
                          color: Colors.white,
                          size: 50,
                        ),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: Text(
                          currentUser!.name,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF32343E),
                            fontFamily: 'Sen',
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    const SizedBox(height: 36),
                    const InfoCard(), // assuming this exists properly
                  ],
                ),
              ),
            ),
          );
        } else if (state is ProfileLoading) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return const Center(child: Text('Failed to load profile'));
        }
      },
    );
  }

  Widget _buildBackButton(BuildContext context) {
    return Container(
      width: 45,
      height: 45,
      decoration: BoxDecoration(
        color: const Color(0xFFECF0F4),
        borderRadius: BorderRadius.circular(22.5),
      ),
      child: IconButton(
        icon: const Icon(Icons.chevron_left, color: Color(0xFF181C2E)),
        onPressed: () => Navigator.pop(context),
      ),
    );
  }
}