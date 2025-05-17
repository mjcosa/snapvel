// auth cubit

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/auth/domain/entities/user.dart';
import 'package:travel_app/auth/domain/repository/auth_repo.dart';
import 'package:travel_app/auth/presentation/cubits/auth_states.dart';

class AuthCubit extends Cubit<AuthStates> {
  final AuthRepo authRepo;
  AppUser? _currentUser;  

  AuthCubit({required this.authRepo}) : super(AuthInitial());

  // check if user is authenticated
  void checkAuth() async {
    final AppUser? user = await authRepo.getCurrentUser();

    if (user != null ){
      _currentUser = user;
      emit(Authenticated(user));
    }
    else {
      emit(Unauthenticated());
    }
  }

  // Get current user
  AppUser? get currentUser => _currentUser;

  // login
  Future<void> login(String email, String pw) async {
    try {
      emit(AuthLoading());

      final user = await authRepo.loginWithEmailPassword(email, pw);

      if (user != null){
        _currentUser = user;
        emit(Authenticated(user));
      }
      else {
        emit(Unauthenticated());
      }
    } 
    catch (err){
      emit(AuthError(err.toString()));
    }
  }

  //register

  Future<void> register(String name, String email, String pw) async {
        try {
      emit(AuthLoading());

      final user = await authRepo.registerwithEmailPassword(name, email, pw);

      if (user != null){
        _currentUser = user;
        emit(Authenticated(user));
      }
      else {
        emit(Unauthenticated());
      }
    } 
    catch (err){
      emit(AuthError(err.toString()));
    }
  }
  
  //logout

  Future<void> logout() async {
    authRepo.logout();
    emit(Unauthenticated());
  }
}