import 'package:travel_app/auth/domain/entities/user.dart';


class ProfileUser extends AppUser {
  final String bio;
  final String phoneno;
  final String profileImageUrl;

  ProfileUser({
    required super.uid,
    required super.email,
    required super.name,
    required this.bio,
    required this.phoneno,
    required this.profileImageUrl,
  });

  ProfileUser copyWith({String? newName, String? newPhoneno, String? newBio, String? newProfileImageUrl}) {
    return ProfileUser(
      uid: uid,
      email: email,
      name: newName ?? name,
      phoneno: newPhoneno ?? phoneno,
      bio: newBio ?? bio,
      profileImageUrl: newProfileImageUrl ?? profileImageUrl,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'email': email,
      'name': name,
      'bio': bio,
      'profileImageUrl': profileImageUrl,
    };
  }

  factory ProfileUser.fromJson(Map<String, dynamic> json) {
    return ProfileUser(
      uid: json['uid'],
      email: json['email'], 
      name: json['name'], 
      bio: json['bio'] ?? '', 
      phoneno: json['phoneno'] ?? '', 
      profileImageUrl: json['profileImageUrl'] ?? '',
    );
  }
}