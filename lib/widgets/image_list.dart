import 'dart:convert';
import 'package:photo_viewer_app/widgets/image_view.dart';
import 'package:photo_viewer_app/widgets/spinner_loader.dart';

import '../models/image_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ImageList extends StatefulWidget {
  @override
  _ImageListState createState() => _ImageListState();
}

class _ImageListState extends State<ImageList> {
  List<ImageModel> images = new List();
  bool loading = false;
  getImages() async {
    setState(() => loading = true);
    var url =
        'https://api.unsplash.com/search/photos?per_page=30&client_id=896d4f52c589547b2134bd75ed48742db637fa51810b49b607e37e46ab2c0043&query=people';

    var res = await http.get(url);
    if (res.statusCode == 200) {
      Map<String, dynamic> jsonData = jsonDecode(res.body);
      jsonData["results"].forEach((el) {
        ImageModel imageModel = new ImageModel();
        imageModel = ImageModel.fromMap(el);
        images.add(imageModel);
        setState(() => loading = false);
      });
    } else {
      print('Data did not load');
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getImages();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.symmetric(vertical: 15),
      height: 600,
      child: SingleChildScrollView(
          child: !loading
              ? Container(
                  padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                  child: GridView.count(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    crossAxisCount: 2,
                    childAspectRatio: 0.6,
                    mainAxisSpacing: 6.0,
                    crossAxisSpacing: 6.0,
                    children: images.map((image) {
                      return GridTile(
                        child: Container(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ImageView(
                                            imgSrc: image.urls.regular,
                                            name: image.user.name,
                                          )));
                            },
                            child: Hero(
                              tag: image.urls.regular,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  image.urls.regular,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                )
              : SpinnerLoader()),
    );
  }
}
