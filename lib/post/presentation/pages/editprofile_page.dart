import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/auth/domain/entities/user.dart';
import 'package:travel_app/auth/presentation/cubits/auth_cubit.dart';
import 'package:travel_app/profile/presentation/cubits/cubits_profile.dart';
import 'package:travel_app/profile/presentation/cubits/states_profile.dart';
import 'package:travel_app/profile/styles/editstyle.dart';

class ProfilePage extends StatefulWidget {
  final String uid;

  const ProfilePage({super.key, required this.uid});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
    
  late final authCubit = context.read<AuthCubit>();
  late final profileCubit = context.read<ProfileCubit>();

  late AppUser? currentUser = authCubit.currentUser;

  @override
  void initState(){
    super.initState();


    profileCubit.fetchUserProfile(currentUser!.uid);
  }

  void updateProfile(id, name, phoneNo, bio){
    final profileCubit = context.read<ProfileCubit>();
    profileCubit.updateProfile(
      uid: id,
      newName: name,
      newPhoneNo: phoneNo,
      newBio: bio,
      );
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        if (state is ProfileLoaded) {
          final user = state.profileUser;

          final TextEditingController nameController = TextEditingController(text: user.name);
          final TextEditingController phoneController = TextEditingController(text: user.phoneno);
          final TextEditingController bioController = TextEditingController(text: user.bio);

            return Scaffold(
            backgroundColor: Colors.white,
            body: SafeArea(
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),
                        // Header
                        Row(
                          children: [
                            Container(
                              width: 45,
                              height: 45,
                              decoration: BoxDecoration(
                                color: EditProfileStyles.backButtonColor,
                                borderRadius: BorderRadius.circular(22.5),
                              ),
                              child: IconButton(
                                icon: const Icon(Icons.arrow_back_ios_new, size: 20),
                                onPressed: () => Navigator.pop(context),
                              ),
                            ),
                            const SizedBox(width: 100),
                            const Text(
                              'Edit Profile',
                              style: EditProfileStyles.headerTextStyle,
                            ),
                          ],
                        ),

                        const SizedBox(height: 30),

                        // Profile Picture
                        Center(
                          child: Stack(
                            children: [
                               Container(
                                width: 130,
                                height: 130,
                                decoration: const BoxDecoration(
                                  color: EditProfileStyles.profilePicColor,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              Positioned(
                                right: 0,
                                bottom: 0,
                                child: Container(
                                  width: 41,
                                  height: 41,
                                  decoration: const BoxDecoration(
                                    color: EditProfileStyles.editButtonColor,
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(
                                    Icons.edit,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 40),

                        // Form Fields
                        const Text('Name', style: EditProfileStyles.labelStyle),
                        const SizedBox(height: 5),
                        TextFormField(
                          controller: nameController,
                          decoration: EditProfileStyles.inputDecoration,
                        ),

                        const SizedBox(height: 20),
                        const Text('Phone Number', style: EditProfileStyles.labelStyle),
                        const SizedBox(height: 5),
                        TextFormField(
                          controller: phoneController,
                          decoration: EditProfileStyles.inputDecoration,
                        ),

                        const SizedBox(height: 20),
                        const Text('BIO', style: EditProfileStyles.labelStyle),
                        const SizedBox(height: 5),
                        TextFormField(
                          controller: bioController,
                          decoration: EditProfileStyles.inputDecoration.copyWith(
                            contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                          ),
                          maxLines: 4,
                        ),

                        const SizedBox(height: 40),

                        // Save Button
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {

                                    updateProfile(
                                        user.uid,
                                        nameController.text,
                                        phoneController.text,
                                        bioController.text
                                        );
                              }
                            },
                            style: EditProfileStyles.saveButtonStyle,
                            child: const Text(
                              'SAVE',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        }
        else if (state is ProfileLoading) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator(),
          ),
        );
        } else {
          return const Center(child: Text("No Data"));
        }
      }
      );
    }
}