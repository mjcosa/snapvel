import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/auth/data/firebase_auth_repo.dart';
import 'package:travel_app/auth/presentation/cubits/auth_cubit.dart';
import 'package:travel_app/auth/presentation/cubits/auth_states.dart';
import 'package:travel_app/onboarding/onboardingscreen.dart';
import 'package:travel_app/post/presentation/pages/home_screen.dart';
import 'package:travel_app/intro/authpage.dart';
import 'package:travel_app/profile/data/firebase_profile_repo.dart';
import 'package:travel_app/profile/presentation/cubits/cubits_profile.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final authRepo = FirebaseAuthReppo();
  final profileRepo = FirebaseProfileRepo();

  // Always show onboarding on app start:
  bool _showOnboarding = true;

  void _completeOnboarding() {
    setState(() {
      _showOnboarding = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(create: (context) => AuthCubit(authRepo: authRepo)..checkAuth()),
        BlocProvider(create: (context) => ProfileCubit(profileRepo: profileRepo))
      ], 
      child: MaterialApp(
        title: 'Snapvel App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          // your theme here
        ),
        home: _showOnboarding
            ? SplashScreen(onFinished: _completeOnboarding)
            : BlocConsumer<AuthCubit, AuthStates>(
                builder: (context, authState) {
                  if (authState is Unauthenticated) {
                    return const Authpage();
                  }
                  if (authState is Authenticated) {
                    return const HomeScreen();
                  }
                  return const Scaffold(
                    body: Center(child: CircularProgressIndicator()),
                  );
                },
                listener: (context, state) {},
              ),
      ),
    );
  }
}