import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:walli/models/categories_model.dart';
import 'package:http/http.dart' as http;
import 'package:walli/models/wallpaper_model.dart';
import '../data/data.dart';
import '../widgets/widgets.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategorieModel> categories = [];
  List<PhotosModel> wallpapers = [];

  getTrendingWallpapers() async {
    Uri url = Uri.parse("https://api.pexels.com/v1/curated?per_page=15&page=1");
    var response = await http.get(url, headers: {"Authorization": API_KEY});
    Map<String, dynamic> jsonData = jsonDecode(response.body);
    jsonData["photos"].forEach((element) {
      PhotosModel photosModel = PhotosModel.fromMap(element);
      wallpapers.add(photosModel);
    });
  }

  @override
  void initState() {
    getTrendingWallpapers();
    categories = getCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: brandName(),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: Container(
          child: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                color: Color(0xfff5f8fd),
                borderRadius: BorderRadius.circular(30)),
            margin: EdgeInsets.symmetric(horizontal: 24),
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: "search wallpapers",
                        border: InputBorder.none),
                  ),
                ),
                Icon(Icons.search)
              ],
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Container(
            height: 80,
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 24),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return CategorieWidget(
                  title: categories[index].categorieName,
                  imgURL: categories[index].imgUrl,
                );
              },
            ),
          )
        ],
      )),
    );
  }
}

class CategorieWidget extends StatelessWidget {
  final String imgURL, title;
  CategorieWidget({required this.title, required this.imgURL});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 4),
      child: Stack(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              imgURL,
              height: 50,
              width: 100,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            color: Colors.black26,
            height: 50,
            width: 100,
            alignment: Alignment.center,
            child: Text(
              title,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 16),
            ),
          )
        ],
      ),
    );
  }
}
