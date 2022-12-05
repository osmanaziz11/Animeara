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
        backgroundColor: Colors.transparent,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(80),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            width: double.infinity,
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("ANIMERA",
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w900,
                          letterSpacing: 5,
                          color: const Color(0xffF8961E),
                          fontSize: 30)),
                  Icon(
                    Icons.menu,
                    color: Color.fromARGB(255, 207, 206, 206),
                  )
                ]),
          ),
        ),
        body: HomeScreen(),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          items: const [
            BottomNavigationBarItem(
                label: "Home",
                backgroundColor: Color.fromARGB(169, 6, 6, 6),
                icon: Icon(
                  Icons.home,
                )),
            BottomNavigationBarItem(
              label: "Notifications",
              icon: Icon(Icons.notifications),
              backgroundColor: Color.fromARGB(169, 6, 6, 6),
            ),
            BottomNavigationBarItem(
              label: "Profile",
              icon: Icon(Icons.dashboard),
              backgroundColor: Color.fromARGB(169, 6, 6, 6),
            ),
          ],
          iconSize: 20,
          unselectedFontSize: 11,
          selectedFontSize: 11,
          showUnselectedLabels: true,
          currentIndex: _currentIndex,
          unselectedItemColor: const Color.fromARGB(142, 255, 255, 255),
          selectedItemColor: const Color(0XFFF8961E),
          onTap: _navigate,
        ),
      ),
    );
  }
}
