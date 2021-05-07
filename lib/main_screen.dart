import 'package:flutter/material.dart';
import 'wallpapers_screen.dart';
import 'popular_screen.dart';
import 'search_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var selectedIndex = 0;

  List  screens =<Widget>[
    WallpaperScreen(),
    SearchScreen(),
    PopularWallpapers(),
  ];

  changeIndex(index){
    setState(() {
      selectedIndex=index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(icon: Icon(Icons.dehaze,), onPressed: null,color: Colors.grey,),
        title: Row(
          children: [
            SizedBox(
              width: 30.0,
            ),
            Image.asset('images/06697eaa-46af-476e-865e-a13da4f01292_200x200.png',
              height:140,
              width: 150,
            ),
          ],
        ),
        actions: [
          IconButton(icon: Icon(Icons.turned_in_not,color: Colors.blueAccent,), onPressed: null)
        ],
      ),
      body: screens[selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black38,
              blurRadius: 3,
            ),
          ],
        ),
        child: BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.wallpaper),
                // ignore: deprecated_member_use
                title: Text('wallpapers')
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.arrow_back),
                  // ignore: deprecated_member_use
                  title: Text('Search')
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.developer_board),
                  // ignore: deprecated_member_use
                  title: Text('popular ')
              ),
            ],
          currentIndex: selectedIndex,
          selectedItemColor: Colors.blueAccent,
          onTap: changeIndex,
          backgroundColor: Colors.white,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child:Icon(Icons.search),
        onPressed: (){
          changeIndex(1);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
