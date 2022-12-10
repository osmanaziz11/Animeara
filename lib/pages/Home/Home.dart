// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:app/navkeys.dart';
import 'package:app/pages/Home/Modules/AskAnimera/VoiceHelp.dart';
import 'package:app/pages/Home/Modules/CreateAvatar/GenerateAvatar.dart';
import 'package:app/pages/Home/screens/About.dart';
import 'package:app/pages/Home/Modules/AskAnimera/Animera.dart';
import 'package:app/pages/Home/Modules/AskAnimera/chatHelp.dart';
import 'package:app/pages/Home/screens/Boarding.dart';
import 'package:app/pages/Home/Modules/CreateAvatar/CreateAvatar.dart';
import 'package:app/pages/Home/Modules/SavedAvatar/MyAvatar.dart';
import 'package:app/pages/Home/screens/Setting.dart';
import 'package:app/pages/Home/screens/UserGuide.dart';
import 'package:app/pages/Home/Modules/CreateAvatar/feedbackScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext cxt) {
    return Navigator(
      key: Navigation.mainNavigation,
      initialRoute: '/',
      onGenerateRoute: (routeSetting) {
        if (routeSetting.name == '/') {
          return CupertinoPageRoute(builder: (context) => BoardingScreen());
        }
        if (routeSetting.name == '/create') {
          return CupertinoPageRoute(builder: (context) => CreateAvatar());
        }
        if (routeSetting.name == '/manual') {
          return CupertinoPageRoute(builder: (context) => UserGuide());
        }
        if (routeSetting.name == '/chat') {
          return CupertinoPageRoute(builder: (context) => chatWithAnimera());
        }
        if (routeSetting.name == '/ask') {
          return CupertinoPageRoute(builder: (context) => Animera());
        }
        if (routeSetting.name == '/myavatar') {
          return CupertinoPageRoute(builder: (context) => MyAvatar());
        }
        if (routeSetting.name == '/about') {
          return CupertinoPageRoute(builder: (context) => About());
        }
        if (routeSetting.name == '/generateAvatar') {
          return CupertinoPageRoute(builder: (context) => GeneratedAvatar());
        }
        if (routeSetting.name == '/feedback') {
          return CupertinoPageRoute(builder: (context) => AvatarFeedBack());
        }
        if (routeSetting.name == '/voiceHelp') {
          return CupertinoPageRoute(builder: (context) => VoiceHelp());
        }
      },
    );
  }
}
