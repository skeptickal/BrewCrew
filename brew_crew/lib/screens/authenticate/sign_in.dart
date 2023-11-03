// ignore_for_file: avoid_print

import 'package:brew_crew/services/auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  final toggleView;

  const SignIn({super.key, required this.toggleView});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();

  //text field state
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: const Text('Sign in to Brew Crew'),
        actions: [
          TextButton.icon(
            onPressed: () {},
            label: const Text(
              'Sign Up',
              style: TextStyle(color: Colors.black),
            ),
            icon: const Icon(
              Icons.person,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 50,
          ),
          child: Form(
            child: Column(children: [
              const SizedBox(height: 20),
              TextFormField(
                onChanged: (value) {
                  setState(() {
                    email = value;
                  });
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                obscureText: true,
                onChanged: (value) {
                  setState(() {
                    password = value;
                  });
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pink[400]),
                  onPressed: () {
                    widget.toggleView();
                    print(email);
                    print(password);
                  },
                  child: const Text(
                    'Sign In',
                    style: TextStyle(color: Colors.white),
                  ))
            ]),
          )),
    );
  }
}
