import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/profile/domain/repos/profile_repo.dart';
import 'package:travel_app/profile/presentation/cubits/states_profile.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepo profileRepo;

  ProfileCubit({required this.profileRepo}) : super(ProfileInitial()){
      debugPrint("Profile cubit initialized");
  }

  Future<void> fetchUserProfile(String uid) async {
    try {
            debugPrint('[DEBUG]data ====');
      emit(ProfileLoading());
      final user = await profileRepo.fetchUserProfile(uid);

      debugPrint('[DEBUG]data =+= $user');

      if (user != null){
        emit(ProfileLoaded(user));
      } else {
        emit(ProfileError("User not found"));
        }
    } catch (err) {
      emit(ProfileError(err.toString()));
    }
  }

  Future<void> updateProfile({
    required String uid,
    String? newName,
    String? newPhoneNo,
    String? newBio,
  }) async {

    emit(ProfileLoading());

    try {
      
      final currentUser = await profileRepo.fetchUserProfile(uid);

      if (currentUser == null){
        emit(ProfileError("Failed to Fetch user"));
        return;
      }

      final updatedProfile = currentUser.copyWith(
        newBio: newBio ?? currentUser.bio,
        newPhoneno: newPhoneNo ?? currentUser.phoneno,
      );

      await profileRepo.updateProfile(updatedProfile);
 
      await fetchUserProfile(uid);
    } catch (err) {
        emit(ProfileError("Error updating profile"));
    }
  }
}