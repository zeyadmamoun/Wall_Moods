import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'on_tap_wallpaper.dart';

class WallpaperScreen extends StatefulWidget {
  @override
  _WallpaperScreenState createState() => _WallpaperScreenState();
}

class _WallpaperScreenState extends State<WallpaperScreen> {

  List imgUrl=[];

   Future getData()async{
    http.Response response = await http.get('https://api.unsplash.com/photos?page=2&per_page=40&client_id=X7asfkWsnKSyLdcrbLdJR6uCJY3bmjLtqGNhtHw57ug');
    var imgData = jsonDecode(response.body);
    setState(() {
       imgUrl=imgData;
    });
    print(imgUrl);
    print(imgData.length);
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
                childAspectRatio: 0.8
        ),
            itemCount:imgUrl.length,
            itemBuilder: (context,index){
              return GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>WallpaperDownload(imgUrl.elementAt(index)['urls']['full'],imgUrl.elementAt(index)['links']['download'],imgUrl[index]['alt_description'])));
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: NetworkImage(imgUrl.elementAt(index)['urls']['small']),
                        fit: BoxFit.cover,
                      )
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                          begin: Alignment.bottomRight,
                          colors: [
                            Colors.black.withOpacity(0.4),
                            Colors.black.withOpacity(0.2),
                          ]
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(
                          height:10.0,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 130.0,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Icon(Icons.arrow_downward),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }
        ),
      ),
    );
  }
}
