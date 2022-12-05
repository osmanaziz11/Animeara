import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BoardingScreen extends StatelessWidget {
  const BoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
          SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 5),
              width: double.infinity,
              height: 490,
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MenuCard1(),
                    SizedBox(
                      width: 10,
                    ),
                    MenuCard2()
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MenuCard3(),
                    SizedBox(
                      width: 10,
                    ),
                    MenuCard4()
                  ],
                ),
              ]),
            ),
          )
        ]));
  }

  InkWell MenuCard1() {
    return InkWell(
      onTap: () {},
      child: Container(
        width: 160,
        height: 230,
        decoration: BoxDecoration(
            color: Color(0xFFFFDC5E), borderRadius: BorderRadius.circular(10)),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/c1.png',
              width: 180,
            ),
            Text("Create Avatar",
                style: GoogleFonts.alegreya(
                    // fontWeight: FontWeight.w900,
                    color: const Color(0xff262626),
                    fontSize: 24))
          ],
        )),
      ),
    );
  }

  Container MenuCard2() {
    return Container(
      width: 160,
      height: 230,
      decoration: BoxDecoration(
          color: Color(0xffF38F5B), borderRadius: BorderRadius.circular(10)),
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/c2.png',
            width: 180,
            height: 190,
            fit: BoxFit.contain,
          ),
          Text("Saved Avatar",
              style: GoogleFonts.alegreya(
                  // fontWeight: FontWeight.w900,
                  color: const Color(0xff262626),
                  fontSize: 24))
        ],
      )),
    );
  }

  Container MenuCard3() {
    return Container(
      width: 160,
      height: 230,
      decoration: BoxDecoration(
          color: Color(0xffAADBFF), borderRadius: BorderRadius.circular(10)),
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/c3.png',
            width: 180,
          ),
          Text("User Guide",
              style: GoogleFonts.alegreya(
                  // fontWeight: FontWeight.w900,
                  color: const Color(0xff262626),
                  fontSize: 24))
        ],
      )),
    );
  }

  Container MenuCard4() {
    return Container(
      width: 160,
      height: 230,
      decoration: BoxDecoration(
          color: Color(0xffEBFFE1), borderRadius: BorderRadius.circular(10)),
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/c4.png',
            width: 180,
          ),
          Text("Settings",
              style: GoogleFonts.alegreya(
                  // fontWeight: FontWeight.w900,
                  color: const Color(0xff262626),
                  fontSize: 24))
        ],
      )),
    );
  }
}
