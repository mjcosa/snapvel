import 'package:travel_app/profile/domain/entities/profile_page.dart';

abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileLoaded extends ProfileState {
  final ProfileUser profileUser;
  ProfileLoaded(this.profileUser);
}

class ProfileError extends ProfileState {
  final String message;
  ProfileError(this.message);
}