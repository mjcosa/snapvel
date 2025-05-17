import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:travel_app/profile/domain/entities/profile_page.dart';
import 'package:travel_app/profile/domain/repos/profile_repo.dart';

class FirebaseProfileRepo implements ProfileRepo{
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  @override
  Future<ProfileUser?> fetchUserProfile(String uid) async {
    try {

      final userDoc = await firebaseFirestore.collection('users').doc(uid).get();
      debugPrint("[DEBUG] DATA IS $userDoc");
      if (userDoc.exists) {
        final userData = userDoc.data();

        if (userData != null){
          return ProfileUser(
          uid: userData['uid'],
          email: userData['email'],
          name: userData['name'],
          bio: userData['bio'] ?? '',
          phoneno: userData['phoneNo'] ?? '',
          profileImageUrl: userData['profileImageUrl'].toString(),
          );
        }
      }
      return null;
    }
    catch (err) {
        return null;
    }
  }

  @override
  Future<void> updateProfile(ProfileUser updatedprofile) async{
    try{

      await firebaseFirestore
        .collection('users')
        .doc(updatedprofile.uid)
        .update({
        'bio': updatedprofile.bio,
        'phoneNo': updatedprofile.phoneno,
        'profileImageUrl': updatedprofile.profileImageUrl,
        });
    }
    catch (err){
      throw Exception(err);
    }
  }
}