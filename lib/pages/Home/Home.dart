// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:app/pages/Home/screens/Avatar.dart';
import 'package:app/pages/Home/screens/Boarding.dart';
import 'package:app/pages/Home/screens/Create.dart';
import 'package:app/pages/Home/screens/Generating.dart';
import 'package:app/pages/Home/screens/Manual.dart';
import 'package:app/pages/Home/screens/Setting.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<NavigatorState> navigatorKeyMain = GlobalKey();
  @override
  Widget build(BuildContext cxt) {
    return Navigator(
      key: navigatorKeyMain,
      initialRoute: '/',
      onGenerateRoute: (routeSetting) {
        if (routeSetting.name == '/create') {
          return CupertinoPageRoute(builder: (context) => CreateScreen());
        }
        if (routeSetting.name == '/avatar') {
          return CupertinoPageRoute(builder: (context) => AvatarScreen());
        }
        if (routeSetting.name == '/manual') {
          return CupertinoPageRoute(builder: (context) => ManualScreen());
        }
        if (routeSetting.name == '/setting') {
          return CupertinoPageRoute(builder: (context) => SettingScreen());
        }
        return CupertinoPageRoute(builder: (context) => GenerateAvatar());
      },
    );
  }
}
