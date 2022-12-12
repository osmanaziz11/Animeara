import 'package:app/navkeys.dart';
import 'package:app/widgets/AppBar.dart';
import 'package:app/widgets/Heading.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ci.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';

class Animera extends StatelessWidget {
  const Animera({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          MainHeading(
            first: "ASK",
            second: "ANIMERA",
            size: 31,
          ),
          Container(
            height: 500,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 170,
                  height: 170,
                  margin: const EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/c4.png'),
                        fit: BoxFit.fill),
                    shape: BoxShape.circle,
                  ),
                ),
                Text("Online",
                    style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1,
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 20)),
                Container(
                  height: 40,
                  width: double.infinity,
                  margin: const EdgeInsets.only(top: 50),
                  padding: EdgeInsets.symmetric(horizontal: 80),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff1E1E1E)),
                    onPressed: () {
                      Navigation.mainNavigation.currentState!
                          .pushNamed('/chat');
                    },
                    child: Text(
                      'Chat',
                      style: GoogleFonts.alegreyaSans(
                          fontWeight: FontWeight.w900,
                          letterSpacing: 3,
                          color: Colors.white,
                          fontSize: 20),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 40,
                  width: double.infinity,
                  // margin: const EdgeInsets.only(top: 10),
                  padding: EdgeInsets.symmetric(horizontal: 80),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff1E1E1E)),
                    onPressed: () {
                      Navigation.mainNavigation.currentState!
                          .pushNamed('/voiceHelp');
                    },
                    child: Text(
                      'Voice',
                      style: GoogleFonts.alegreyaSans(
                          fontWeight: FontWeight.w900,
                          letterSpacing: 3,
                          color: Colors.white,
                          fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
