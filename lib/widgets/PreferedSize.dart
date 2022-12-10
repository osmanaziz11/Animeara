import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

PreferredSize customPreferredSize() {
  return PreferredSize(
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
  );
}
