import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:walli/data/data.dart';

import '../models/wallpaper_model.dart';
import '../widgets/widgets.dart';

class CategorieScreen extends StatefulWidget {
  final String categorie;

  CategorieScreen({required this.categorie});

  @override
  _CategorieScreenState createState() => _CategorieScreenState();
}

class _CategorieScreenState extends State<CategorieScreen> {
  List<PhotosModel> photos = [];

  getCategorieWallpaper() async {
    Uri uri = Uri.parse(
        "https://api.pexels.com/v1/search?query=${widget.categorie}&per_page=30&page=1");
    await http.get(uri, headers: {"Authorization": API_KEY}).then((value) {
      //print(value.body);

      Map<String, dynamic> jsonData = jsonDecode(value.body);
      jsonData["photos"].forEach((element) {
        PhotosModel photosModel = PhotosModel.fromMap(element);
        photos.add(photosModel);
      });

      setState(() {
        photos = photos;
      });
    });
  }

  @override
  void initState() {
    getCategorieWallpaper();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //show back button
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: brandName(),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: wallPaper(photos, context),
      ),
    );
  }
}
