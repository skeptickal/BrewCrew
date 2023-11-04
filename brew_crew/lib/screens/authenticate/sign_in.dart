// ignore_for_file: avoid_print

import 'package:brew_crew/services/auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  final dynamic toggleView;

  const SignIn({super.key, required this.toggleView});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  //text field state
  String email = '';
  String password = '';
  String error = '';

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
            onPressed: () {
              widget.toggleView();
            },
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
            key: _formKey,
            child: Column(children: [
              const SizedBox(height: 20),
              TextFormField(
                validator: (value) => value!.isEmpty ? 'Enter an email' : null,
                onChanged: (value) {
                  setState(() {
                    email = value;
                  });
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                validator: (value) => value!.length < 6
                    ? 'Enter a password 6+ characters long'
                    : null,
                obscureText: true,
                onChanged: (value) {
                  setState(() {
                    password = value;
                  });
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style:
                    ElevatedButton.styleFrom(backgroundColor: Colors.pink[400]),
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    print('valid');
                    dynamic result =
                        await _auth.signInWithEmailAndPassword(email, password);
                    if (result == null) {
                      setState(() {
                        error = 'could not sign in with those credentials';
                      });
                    }
                  }
                },
                child: const Text(
                  'Sign In',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(height: 20),
              Text(error,
                  style: const TextStyle(color: Colors.red, fontSize: 14.0))
            ]),
          )),
    );
  }
}
