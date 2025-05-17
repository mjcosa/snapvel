import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:travel_app/auth/domain/entities/user.dart';
import 'package:travel_app/auth/domain/repository/auth_repo.dart';
import 'package:flutter/foundation.dart';  

class FirebaseAuthReppo implements AuthRepo {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  @override
  Future<AppUser?> loginWithEmailPassword(String email, String password) async {
    try {
      UserCredential userCredential = await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Fetch Firestore user data after login
      final docSnapshot = await firebaseFirestore
          .collection('users')
          .doc(userCredential.user!.uid)
          .get();

      final userData = docSnapshot.data();

      AppUser user = AppUser(
        uid: userCredential.user!.uid,
        email: email,
        name: userData?['name'] ?? '',
      );

      return user;
    } catch (e) {
      throw Exception('Login failed: $e');
    }
  }

  @override
  Future<AppUser?> registerwithEmailPassword(String name, String email, String password) async {
    try {
      UserCredential userCredential = await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      AppUser user = AppUser(
        uid: userCredential.user!.uid,
        email: email,
        name: name,
      );

      await firebaseFirestore
          .collection("users")
          .doc(user.uid)
          .set(user.toJson());

      return user;
    } catch (e) {
      throw Exception('Create Account failed: $e');
    }
  }

  @override
  Future<void> logout() async {
    await firebaseAuth.signOut();
  }

  @override
  Future<AppUser?> getCurrentUser() async {
    final firebaseUser = firebaseAuth.currentUser;

    if (firebaseUser == null) {
      return null;
    }

    // Fetch Firestore details to get name
    final docSnapshot = await firebaseFirestore
        .collection('users')
        .doc(firebaseUser.uid)
        .get();

    debugPrint('[DEBUG] BUG HERE = $docSnapshot');
    
    final userData = docSnapshot.data();

    debugPrint('[DEBUG] BUG HERE = $userData');
    return AppUser(
      uid: firebaseUser.uid,
      email: firebaseUser.email!,
      name: userData?['name'] ?? '',
    );
  }

//   Future<AppUser?> updateCurrentUser() async {
//     final firebaseUser = firebaseAuth.currentUser;

//     if (firebaseUser == null) {
//       return null;
//     }

//     // Fetch updated Firestore user details
//     final docSnapshot = await firebaseFirestore
//         .collection('users')
//         .doc(firebaseUser.uid)
//         .get();

//     final userData = docSnapshot.data();

//     if (userData == null) {
//       return null;
//     }

//     return AppUser(
//       uid: firebaseUser.uid,
//       email: firebaseUser.email!,
//       name: userData['name'] ?? '',
//     );
//   }
// 
}