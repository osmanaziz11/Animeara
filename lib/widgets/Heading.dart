import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MainHeading extends StatelessWidget {
  late String first;
  late String second;
  double? size;
  MainHeading(
      {super.key, required this.first, required this.second, this.size});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(first,
            style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w900,
                letterSpacing: 5,
                color: const Color.fromARGB(255, 255, 255, 255),
                fontSize: size)),
        const SizedBox(width: 10),
        Text(second,
            style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w900,
                letterSpacing: 5,
                color: Colors.amber,
                fontSize: size)),
      ],
    );
  }
}
