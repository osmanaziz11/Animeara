import 'dart:ffi';

import 'package:app/navkeys.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

InkWell MenuCard(color, title, imgURL, navpath) {
  return InkWell(
    onTap: () =>
        Navigation.mainNavigation.currentState!.pushNamed("/${navpath}"),
    child: Container(
      width: 160,
      height: 230,
      decoration: BoxDecoration(
          color: Color(color), borderRadius: BorderRadius.circular(10)),
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/${imgURL}",
            width: 180,
            height: 190,
            fit: BoxFit.contain,
          ),
          Text(title,
              style: GoogleFonts.alegreya(
                  // fontWeight: FontWeight.w900,
                  color: const Color(0xff262626),
                  fontSize: 24))
        ],
      )),
    ),
  );
}
