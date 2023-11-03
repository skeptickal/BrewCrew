import 'package:brew_crew/firebase_options.dart';
import 'package:brew_crew/models/my_user.dart';
import 'package:brew_crew/screens/wrapper.dart';
import 'package:brew_crew/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  AuthService authService = AuthService();
  runApp(StreamProvider<MyUser?>.value(
    value: authService.user,
    catchError: (_, __) {},
    initialData: null,
    child: const MaterialApp(
      home: Wrapper(),
    ),
  ));
}
