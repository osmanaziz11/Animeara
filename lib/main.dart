// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

// Flutter Packages
import 'package:app/pages/Application.dart';
import 'package:app/pages/Home/Home.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: Color(0xff181818)),
      home:
          Application(), // Application contains all the app except authentication module
    );
  }
}
