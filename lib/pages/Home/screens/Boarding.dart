import 'package:app/widgets/MenuCard.dart';
import 'package:app/widgets/PreferedSize.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BoardingScreen extends StatelessWidget {
  const BoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customPreferredSize(),
      body: Container(
          width: double.infinity,
          height: double.infinity,
          padding: const EdgeInsets.all(10),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text("Welcome back, Afreen!",
                style: GoogleFonts.alegreya(
                    // fontWeight: FontWeight.w900,
                    color: const Color.fromARGB(202, 255, 253, 253),
                    fontSize: 30)),
            SizedBox(
              height: 4,
            ),
            Text("How are you feeling today?",
                style: GoogleFonts.alegreya(
                    // fontWeight: FontWeight.w900,
                    color: const Color.fromARGB(142, 255, 255, 255),
                    fontSize: 20)),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              padding: const EdgeInsets.symmetric(vertical: 5),
              width: double.infinity,
              height: 490,
              child: SingleChildScrollView(
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MenuCard(0xFFFFDC5E, 'Create Avatar', 'c1.png', 'create'),
                      SizedBox(
                        width: 10,
                      ),
                      MenuCard(0xffF38F5B, 'My Avatar', 'c2.png', 'myavatar'),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MenuCard(0xffAADBFF, 'Ask Animera', 'c3.png', 'ask'),
                      SizedBox(
                        width: 10,
                      ),
                      MenuCard(0xffEBFFE1, 'User Guide', 'c4.png', 'manual'),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MenuCard(0xFFFFDC5E, 'About', 'c2.png', 'about'),
                      SizedBox(
                        width: 10,
                      ),
                      MenuCard(0xffAADBFF, 'Setting', 'c1.png', 'setting'),
                    ],
                  ),
                ]),
              ),
            )
          ])),
    );
  }
}
