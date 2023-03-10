import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget brandName() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Text("Walli",
          style: GoogleFonts.pacifico(
            fontSize: 32,
            color: Colors.blue,
            // fontWeight: FontWeight.bold,
          ))
    ],
  );
}
