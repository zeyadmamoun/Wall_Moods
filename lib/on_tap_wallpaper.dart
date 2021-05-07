import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class WallpaperDownload extends StatelessWidget {

  WallpaperDownload(this.picUrl,this.downloadLink,this.altDescription);
  final picUrl;
  final downloadLink;
  final altDescription;

  _launchURL() async {
     var url = downloadLink;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0x64000000),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(picUrl,
            fit: BoxFit.fill,
          ),
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
              begin: Alignment.bottomRight,
              colors: [
                Colors.black.withOpacity(0.8),
                Colors.black.withOpacity(0.1),
              ]
          ),
        ),
      ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(altDescription,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18
                ),
                textAlign:TextAlign.left,
              ),
             SizedBox(height: 20,),
             OutlineButton(
                 onPressed: (){
                   _launchURL();
                 },
               borderSide: BorderSide(color: Colors.white),
               shape: RoundedRectangleBorder(
                 borderRadius: BorderRadius.circular(20)
               ),
               child: Text('Download',
                 style: TextStyle(
                   color: Colors.white,
                 ),
               ),
             ),
              SizedBox(height:30 ,)
            ],
          )
        ],
      ),
    );
  }
}
