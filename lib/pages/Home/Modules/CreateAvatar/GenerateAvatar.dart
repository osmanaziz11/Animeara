import 'package:app/navkeys.dart';
import 'package:app/widgets/AppBar.dart';
import 'package:app/widgets/Heading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ci.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';

class GeneratedAvatar extends StatefulWidget {
  const GeneratedAvatar({super.key});

  @override
  State<GeneratedAvatar> createState() => _GeneratedAvatarState();
}

class _GeneratedAvatarState extends State<GeneratedAvatar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(children: [
          MainHeading(first: "YOUR", second: "AVATAR"),
          const SizedBox(
            height: 30,
          ),
          Text("Aqua Hair with Blue Eyes",
              textAlign: TextAlign.center,
              style:
                  GoogleFonts.alegreyaSans(color: Colors.white, fontSize: 20)),
          const SizedBox(
            height: 20,
          ),
          Container(
            width: 170,
            height: 170,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/Aqua/1.jpg'),
                  fit: BoxFit.fill),
              color: Colors.white,
              shape: BoxShape.rectangle,
            ),
          ),
          actionBtns()
        ]),
      ),
    );
  }

  Column actionBtns() {
    return Column(
      children: [
        Container(
          height: 40,
          width: double.infinity,
          margin: const EdgeInsets.only(top: 10),
          padding: const EdgeInsets.symmetric(horizontal: 80),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff1E1E1E)),
            onPressed: () {
              Navigation.mainNavigation.currentState!.pushNamed('/chat');
            },
            child: Text(
              'Save',
              style: GoogleFonts.alegreyaSans(
                  fontWeight: FontWeight.w900,
                  letterSpacing: 3,
                  color: Colors.white,
                  fontSize: 20),
            ),
          ),
        ),
        Container(
          height: 40,
          width: double.infinity,
          margin: const EdgeInsets.only(top: 10),
          padding: const EdgeInsets.symmetric(horizontal: 80),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff1E1E1E)),
            onPressed: () {
              Navigation.mainNavigation.currentState!.pushNamed('/chat');
            },
            child: Text(
              'Share',
              style: GoogleFonts.alegreyaSans(
                  fontWeight: FontWeight.w900,
                  letterSpacing: 3,
                  color: Colors.white,
                  fontSize: 20),
            ),
          ),
        ),
        Container(
          height: 40,
          width: double.infinity,
          margin: const EdgeInsets.only(top: 10),
          padding: const EdgeInsets.symmetric(horizontal: 80),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff1E1E1E)),
            onPressed: () {
              Navigation.mainNavigation.currentState!.pushNamed('/feedback');
            },
            child: Text(
              'Feedback',
              style: GoogleFonts.alegreyaSans(
                  fontWeight: FontWeight.w900,
                  letterSpacing: 3,
                  color: Colors.white,
                  fontSize: 20),
            ),
          ),
        ),
      ],
    );
  }
}
