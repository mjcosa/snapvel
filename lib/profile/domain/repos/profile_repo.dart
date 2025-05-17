import 'package:travel_app/profile/domain/entities/profile_page.dart';

abstract class ProfileRepo {
  Future<ProfileUser?> fetchUserProfile(String uid);
  Future<void> updateProfile(ProfileUser updatedprofile);
  
}