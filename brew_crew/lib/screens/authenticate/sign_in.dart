// ignore_for_file: avoid_print

import 'package:brew_crew/services/auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: const Text('Sign in to Brew Crew'),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 50,
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
          onPressed: () async {
            dynamic result = await _auth.signInAnon();
            if (result == null) {
              print('error, signing in');
            } else {
              print('signed in');
              print(result.uid);
            }
          },
          child: const Text(
            'Sign in Anon',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
