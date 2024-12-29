import "package:firebase_core/firebase_core.dart";
import 'package:flutter/material.dart';
import 'mainScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Initialize Firebase
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PRIME',
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.purple,
        scaffoldBackgroundColor: Colors.black,
      ),
      home: MainScreen(),
    );
  }
}
