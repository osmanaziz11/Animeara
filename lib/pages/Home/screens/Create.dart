import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateScreen extends StatelessWidget {
  const CreateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 170,
                height: 170,
                margin: const EdgeInsets.only(bottom: 15),
                child: const CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 185, 183, 183),

                  radius: 13, //radius is 35.
                  //AssetImage loads image URL.
                ),
              ),
              Text("Online",
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w900,
                      letterSpacing: 2,
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
                  onPressed: () {},
                  child: Text(
                    'ASK ANIMERA',
                    style: GoogleFonts.alegreyaSans(
                        fontWeight: FontWeight.w900,
                        letterSpacing: 3,
                        color: Colors.white,
                        fontSize: 20),
                  ),
                ),
              ),
            ]),
      ),
    );
  }
}
