

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:torisim_applicatoin/model/monument.dart';
import 'package:url_launcher/url_launcher.dart';

class CategoryPage extends StatefulWidget {
  final String category;
  const new({super.key, required this.category});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {

  void launchMap(double lat,double long) async{
    final String googleMapsUrls = 
     "https://www.google.com/maps/search/?api=1&query=$lat,$long";
    await launchUrl(Uri.parse(googleMapsUrls));

  }



  List<Monument>? getMonuments() {
    switch (widget.category) {
      case "church":
        return [
          Monument(
            name: 'Church of St. George',
            description: """It is one of the oldest historical churches in the world,and it was a cave in which a Christian group worshiped in secret for fear of the oppression of the pagan Roman state.""",
            imagePath: 'https://cdn.pixabay.com/photo/2018/01/19/11/48/saint-coloman-3092260_1280.jpg',
            latitude: 32.32166,
            longitude: 36.09681,
            imagePath1: 'https://cdn.pixabay.com/photo/2022/08/16/15/11/church-7390546_1280.jpg',
            imagePath2: 'https://cdn.pixabay.com/photo/2014/10/20/22/22/budapest-495752_1280.jpg',
            imagePath3: 'https://cdn.pixabay.com/photo/2014/10/20/22/22/budapest-495752_1280.jpg',
          ),
          Monument(
            name: 'Church of St. Mary',
            description: """It is one of the oldest historical churches in the world, and it was a cave in which a Christian group worshiped in secret for fear of the oppression of the pagan Roman state.""",
            imagePath: 'https://cdn.pixabay.com/photo/2018/05/12/19/20/freiberg-3394376_1280.jpg',
            latitude: 32.32166,
            longitude: 36.09681,
            imagePath1: 'https://cdn.pixabay.com/photo/2014/10/20/22/22/budapest-495752_1280.jpg',
            imagePath2: 'https://cdn.pixabay.com/photo/2014/10/20/22/22/budapest-495752_1280.jpg',
            imagePath3: 'https://cdn.pixabay.com/photo/2014/10/20/22/22/budapest-495752_1280.jpg',
          ),
        ];
      case "cemetery":
        return [];
      case "wells":
        return [];
      case "caves":
        return [];
      default:
        [];
    }
  }
 Widget largerImage(BuildContext context,String monument){
    return GestureDetector(
      onTap: (){
        showDialog(
          context: context, 
          builder: (context){
              return Dialog(
                child: Image.network(monument, width: 300),
              );
          });
      },
      child: Image.network(monument, width: 50));
  }

  @override
  Widget build(BuildContext context) {
    final monuments = getMonuments();
    return Scaffold(
      appBar: AppBar(title: Text(widget.category)),
      body: ListView.builder(
        itemCount: monuments?.length,
        itemBuilder: (context, index) {
          final m = monuments?[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 5,
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                    child: Image.network(m!.imagePath),
                  ),
                  Row(
                    children: [
                      largerImage(context, m.imagePath1),
                      largerImage(context, m.imagePath2),
                      largerImage(context, m.imagePath3),],
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          m.name,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(m.description),
                        SizedBox(height: 20,),
                        IconButton(
                          onPressed: (){
                            launchMap(m.latitude, m.longitude);
                          }, 
                          icon: Icon(Icons.map))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}