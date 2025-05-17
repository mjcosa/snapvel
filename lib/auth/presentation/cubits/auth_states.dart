// AUth states

import 'package:travel_app/auth/domain/entities/user.dart';

abstract class AuthStates {}

//Iitial
class AuthInitial extends AuthStates{}

// loading
class AuthLoading extends AuthStates{}


// authenticated
class Authenticated extends AuthStates{
  final AppUser user;
  Authenticated(this.user);
}

//unauthen
class Unauthenticated extends AuthStates{}

//error
class AuthError extends AuthStates {
  final String message;
  AuthError(this.message);
}