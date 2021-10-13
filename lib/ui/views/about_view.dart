import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutView extends StatelessWidget {
  const AboutView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      color: Colors.red,
      child: Center(
        child: FittedBox(
          fit: BoxFit.contain,
          child: Text(
            'About',
            style: GoogleFonts.montserratAlternates(fontSize: size.width * 0.05, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
