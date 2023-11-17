import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:scheduler/features/bottomNavigation/bottom_navigation.dart';
import 'package:scheduler/features/onboard/onboarding_page.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          //user logged in
          if (snapshot.hasData) {
            return const BottomNavBar();
          } else {
            return const OnboardingScreen();
          }
        },
      ),
    );
  }
}
