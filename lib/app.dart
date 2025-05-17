import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/auth/data/firebase_auth_repo.dart';
import 'package:travel_app/auth/presentation/cubits/auth_cubit.dart';
import 'package:travel_app/auth/presentation/cubits/auth_states.dart';
import 'package:travel_app/post/presentation/pages/home_screen.dart';
import 'package:travel_app/intro/authpage.dart';
import 'package:travel_app/profile/data/firebase_profile_repo.dart';
import 'package:travel_app/profile/presentation/cubits/cubits_profile.dart';

/*
  Repos

  bloc providers

  auth state
*/

class MyApp extends StatelessWidget {

  final authRepo = FirebaseAuthReppo();
  final profileRepo = FirebaseProfileRepo();

  MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
  
    //provide cubit to app
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(create: (context) => AuthCubit(authRepo: authRepo)..checkAuth()),

        BlocProvider(create: (context) => ProfileCubit(profileRepo: profileRepo))
      ], 
      child: 
      MaterialApp(
          title: 'Snapvel App',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
                  primarySwatch: Colors.blue,
                  fontFamily: 'Inter',
                  scaffoldBackgroundColor: Colors.white,
                  appBarTheme: const AppBarTheme(
                    backgroundColor: Colors.white,
                    elevation: 0,
                  ),
                  textTheme: const TextTheme(
                    headlineMedium: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF1A1A1A),
                    ),
                    titleLarge: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF1A1A1A),
                    ),
                    titleMedium: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF1A1A1A),
                    ),
                    bodyLarge: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF1A1A1A),
                    ),
                    bodyMedium: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF666666),
                    ),
                    bodySmall: TextStyle(
                      fontSize: 12,
                      color: Color(0xFF666666),
                    ),
                  ),
                ),
          home: BlocConsumer<AuthCubit, AuthStates>(
              builder: (context, authState) {
              
              if (authState is Unauthenticated) {
                return const Authpage();
              }

              if (authState is Authenticated) {
                return const HomeScreen();
              }

              // loading
              else {
                return const Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
            },
            listener: (context, state) {},
          ),
        )
      );
  }
}
