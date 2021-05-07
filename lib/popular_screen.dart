import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:flutter/cupertino.dart';
import 'dart:convert';

class PopularWallpapers extends StatefulWidget {
  @override
  _PopularWallpapersState createState() => _PopularWallpapersState();
}

class _PopularWallpapersState extends State<PopularWallpapers> {

  List imgUrl=[];
  Future getPopularData()async{
    http.Response response = await http.get('https://api.unsplash.com/photos?per_page=50&order_by=popular&client_id=X7asfkWsnKSyLdcrbLdJR6uCJY3bmjLtqGNhtHw57ug');
    var imgData = jsonDecode(response.body);
    setState(() {
      imgUrl=imgData;
    });
  }

  @override
  void initState() {
    super.initState();
    getPopularData();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            mainAxisSpacing: 10.0,
          ),
          itemCount: imgUrl.length,
          itemBuilder:(context,index){
            return Container(
              width: double.infinity,
              height: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                    image: NetworkImage(imgUrl.elementAt(index)['urls']['regular']),
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
                  mainAxisAlignment: MainAxisAlignment.end,
                  children:<Widget> [
                    Row(
                      children:<Widget> [
                        SizedBox(width: 15),
                        Expanded(
                          flex: 4,
                          child: Text(imgUrl[index]['alt_description'],
                            style: TextStyle(color: Colors.white,fontSize: 17.0),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Icon(Icons.arrow_downward),
                            ),
                          ),
                        ),
                        SizedBox(width: 15,)
                      ],
                    ),
                    SizedBox(height: 20)
                  ],
                ),
              ),
            );
          }
      ),
    );
  }
}
