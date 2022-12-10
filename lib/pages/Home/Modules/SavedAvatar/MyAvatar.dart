import 'package:app/navkeys.dart';
import 'package:app/widgets/Heading.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ci.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';

class MyAvatar extends StatefulWidget {
  const MyAvatar({super.key});

  @override
  State<MyAvatar> createState() => _MyAvatarState();
}

class _MyAvatarState extends State<MyAvatar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: InkWell(
            onTap: () => Navigation.mainNavigation.currentState!.pop(),
            child: Container(
              padding: const EdgeInsets.all(15),
              child: const Iconify(
                MaterialSymbols.arrow_back_ios_rounded,
                color: Colors.white,
                size: 44,
              ),
            ),
          ),
          backgroundColor: const Color(0xff181818),
          elevation: 0,
          actions: [
            Container(
              margin: const EdgeInsets.only(right: 10),
              child: const Iconify(
                Ci.menu_alt_02,
                color: Colors.white,
                size: 44,
              ),
            )
          ]),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            MainHeading(first: "YOUR", second: "ANIME"),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 15),
              width: double.infinity,
              height: 550,
              child: SingleChildScrollView(
                child: Column(children: [
                  Row(
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      GalleryCard(),
                      SizedBox(
                        width: 10,
                      ),
                      GalleryCard()
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GalleryCard(),
                      SizedBox(
                        width: 10,
                      ),
                      GalleryCard()
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GalleryCard(),
                      SizedBox(
                        width: 10,
                      ),
                      GalleryCard()
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  )
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }

  Container GalleryCard() {
    return Container(
      width: 150,
      height: 210,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Color(0xff201E1E),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(255, 85, 85, 85).withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 5,
            offset: const Offset(0, 0), // changes position of shadow
          ),
        ],
      ),
      child: Center(
          child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Text("Aqua Hair with Blue Eyes",
                style: GoogleFonts.alegreyaSans(
                    color: Colors.white, fontSize: 15)),
          ),
          Container(
            width: 120,
            margin: const EdgeInsets.only(top: 10),
            height: 120,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/Aqua/0.jpg"),
                  fit: BoxFit.fill),
              color: Colors.white,
              shape: BoxShape.rectangle,
            ),
          ),
        ],
      )),
    );
  }
}
