import 'dart:convert';
import 'on_tap_wallpaper.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

class SearchResults extends StatefulWidget {
  SearchResults({this.searchTerm});
  final String searchTerm;

  @override
  print(imgUrl.length);
  images = imgUrl['results'];
}


_SearchResultsState createState() => _SearchResultsState();
}

class _SearchResultsState extends State<SearchResults> {
  Map <String,dynamic>imgUrl ;
  List images=[];
  
  Future getSearchResults()async{
    http.Response response = await http.get('https://api.unsplash.com/search/photos?query="${widget.searchTerm}"&per_page=50&client_id=X7asfkWsnKSyLdcrbLdJR6uCJY3bmjLtqGNhtHw57ug');
   var imgData = jsonDecode(response.body);
    setState(() {
      imgUrl=imgData;
    });
    print(imgUrl);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getSearchResults();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 10.0),
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                childAspectRatio: 0.8
            ),
            itemCount:images.length,
            itemBuilder: (context,index){
              return GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>WallpaperDownload(images.elementAt(index)['urls']['full'],images.elementAt(index)['links']['download'],images.elementAt(index)['alt_description'])));
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: NetworkImage(images.elementAt(index)['urls']['small']),
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

