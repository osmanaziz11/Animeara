// import 'package:app/pages/Home/Home.dart';
import 'package:app/pages/Home/Home.dart';
import 'package:app/pages/Notification.dart';
import 'package:app/pages/Profile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Application extends StatefulWidget {
  const Application({super.key});

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  int _currentIndex = 0;
  final List<Widget> _screens = const [
    HomeScreen(),
    NotificationScreen(),
    ProfileScreen()
  ];
  void _navigate(value) {
    setState(() {
      _currentIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _screens[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Color(0xff181818),
          items: const [
            BottomNavigationBarItem(
                label: "Home",
                backgroundColor: Colors.transparent,
                icon: Icon(
                  Icons.home,
                )),
            BottomNavigationBarItem(
              label: "Notifications",
              icon: Icon(Icons.notifications),
              backgroundColor: Colors.transparent,
            ),
            BottomNavigationBarItem(
              label: "Profile",
              icon: Icon(Icons.dashboard),
              backgroundColor: Colors.transparent,
            ),
          ],
          iconSize: 20,
          unselectedFontSize: 11,
          selectedFontSize: 11,
          showUnselectedLabels: true,
          currentIndex: _currentIndex,
          unselectedItemColor: const Color.fromARGB(142, 255, 255, 255),
          selectedItemColor: Colors.amber,
          onTap: _navigate,
        ),
      ),
    );
  }
}
