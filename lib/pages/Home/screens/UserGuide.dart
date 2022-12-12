import 'package:app/navkeys.dart';
import 'package:app/widgets/Heading.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ci.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';

class UserGuide extends StatelessWidget {
  const UserGuide({super.key});

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
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                MainHeading(
                  first: "USER",
                  second: "GUIDE",
                  size: 31,
                ),
                Container(
                  width: double.infinity,
                  height: 550,
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: SingleChildScrollView(
                    child: Text(
                        " Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aperiam, fugiat labore. Architecto iure distinctio inventore accusamus labore. Consequuntur dolore accusamus repellendus commodi accusantium incidunt porro laborum assumenda quia numquam, nobis aliquam, ullam natus libero voluptate voluptatum est nulla eaque odio adipisci illum laudantium quasi. Aliquid ut iste sed? Nesciunt vel aspernatur sint at. Cupiditate odio neque, iste itaque quo sapiente repellat ipsum dolor eos, est sit porro. Recusandae animi iusto magni quae sed consectetur sit temporibus nisi placeat non maxime reiciendis eum dolorem odio ad, sunt illo. Blanditiis perferendis reprehenderit eveniet, aspernatur delectus impedit .",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.alegreyaSans(
                            color: Colors.white, fontSize: 15)),
                  ),
                )
              ],
            )));
  }
}
