import 'package:app/widgets/AppBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        color: Colors.amber,
                        fontSize: 30)),
                Icon(
                  Icons.menu,
                  color: Color.fromARGB(255, 207, 206, 206),
                )
              ]),
        ),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text("For Future Use",
              textAlign: TextAlign.center,
              style: GoogleFonts.montserrat(
                  letterSpacing: 5,
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontSize: 20))
        ]),
      ),
    );
  }
}
