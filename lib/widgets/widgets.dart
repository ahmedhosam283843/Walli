import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/wallpaper_model.dart';
import '../views/image_view.dart';

Widget brandName() {
  return RichText(
    textAlign: TextAlign.center,
    text: TextSpan(
      style: GoogleFonts.pacifico(
        fontSize: 32,
        color: Colors.blue,
        // fontWeight: FontWeight.bold,
      ),
      children: const <TextSpan>[
        TextSpan(text: 'Walli'),
      ],
    ),
  );
}

Widget wallPaper(List<PhotosModel> listPhotos, BuildContext context) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 0.6,
        physics: const ClampingScrollPhysics(),
        shrinkWrap: true,
        mainAxisSpacing: 6.0,
        crossAxisSpacing: 6.0,
        children: listPhotos.map((wallpaper) {
          return GridTile(
              child: GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ImageView(
                            imgUrl: wallpaper.src.portrait,
                          )));
            },
            child: Hero(
              tag: wallpaper.src.portrait,
              child: Container(
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.network(
                      wallpaper.src.portrait,
                      fit: BoxFit.cover,
                    )),
              ),
            ),
          ));
        }).toList()),
  );
}
