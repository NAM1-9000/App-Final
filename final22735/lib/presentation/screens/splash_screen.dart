import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  void checkUserAuthentication() {
    final User? user = _firebaseAuth.currentUser;
    if (user != null) {
      Timer.periodic(
        const Duration(seconds: 3),
        (timer) => Navigator.of(context).pushReplacementNamed("/homeScreen"),
      );
    } else {
      Timer.periodic(
        const Duration(seconds: 3),
        (timer) => Navigator.of(context).pushReplacementNamed("/signInScreen"),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    checkUserAuthentication();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(child: CircularProgressIndicator()),
    );
  }
}
