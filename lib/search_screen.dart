import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'search_results.dart';

class SearchScreen extends StatefulWidget {

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String searchTag='popular';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:ListView(
        children: [
          Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  color: Color(0xffeff8ff)
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    SizedBox(width: 30.0,),
                    Expanded(
                      child: TextField(
                        onChanged: (text){
                          setState(() {
                            searchTag=text;
                          });
                        },
                        cursorColor: Colors.blueAccent,
                      ),
                    ),
                    SizedBox(width: 10.0,),
                    IconButton(icon: Icon(Icons.search,color: Colors.blueAccent,),
                      onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchResults(searchTerm: searchTag,)));
                      },
                    ),
                    SizedBox(width: 5.0,)
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 100,
          ),
          Image.asset('images/search-screen-pic - Copy.png'),
          Text('Start searching for your favourite categories',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.w800,
                fontSize: 20.0
            ),
          ),
        ],
      ),
        ],
      )
    );
  }
}
