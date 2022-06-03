import 'package:flutter/material.dart';
import 'package:modul1/layout/profile.dart';
import 'package:modul1/homeLayout/recentPlay.dart';
import 'package:modul1/homeLayout/Recomended.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:modul1/layout/login.dart';
import 'package:get/get.dart';

String Nama = ' ' ;
class navBar extends StatefulWidget {
  _navBar createState() => _navBar();
}

class _navBar extends State<navBar> {
  int index = 0;

  //shared preference
  void initState(){
    validationData().whenComplete(() async => Get.to(Nama == null? login() : navBar()));
    super.initState();
  }
  Future validationData()async{
    final SharedPreferences sharedPreferences =
    await SharedPreferences.getInstance();
    var obtainName = sharedPreferences.getString('nama');
    setState(() {
      Nama = obtainName!;
    });
    print(Nama);
  }

  //bottom navigation item
  List<BottomNavigationBarItem> navigationIcons() {
    return [
      BottomNavigationBarItem(
        icon: Icon(Icons.home_outlined),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.person_outlined),
        label: "Profile",
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.search_outlined),
        label: "Search",
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.library_music_outlined),
        label: "Library",
      ),
    ];
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        backgroundColor: Colors.white10,
        iconSize: 20,
        onTap: (int val) {
          setState(() {
            index = val;
          });
        },
        type: BottomNavigationBarType.fixed,
        elevation: 50.0,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        items: navigationIcons(),
      ),
      body: Stack(
        children: [
          render(
            0, home(),),
          render(
            1, Profile(),),
        ],
      ),

    );
  }

  //home
  Widget home() {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        decoration: bgColor(),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                header(),
                recentPlay(),
                SizedBox(height: 20.0),
                Text(
                  "Today Biggest Hits",
                  style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Recomended(
                  url:
                  "https://en.meming.world/images/en/thumb/7/7f/Polish_Jerry.jpg/300px-Polish_Jerry.jpg",
                ),
                Text(
                  "Recomended For Today",
                  style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Recomended(
                  url:
                  "https://www.designformusic.com/wp-content/uploads/2016/02/volta-music-trailer-music-album-cover-design.jpg",
                ),
                Text(
                  "Your Top Mixes",
                  style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Recomended(
                  url:
                  "https://d1csarkz8obe9u.cloudfront.net/posterpreviews/creative-music-album-cover-design-template-f4ce22c75f3fff9758bc01250abc6e05_screen.jpg?ts=1594215605",
                ),
                SizedBox(height: 10.0),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget header(){
    return Padding(
      padding: EdgeInsets.fromLTRB(15.0, 20.0, 15.0, 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Good Morning,\n$Nama",
            style: TextStyle(
              fontSize: 23.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Icon(Icons.settings),
        ],
      ),
    );
  }

  //background color
  BoxDecoration bgColor() {
    return BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.deepOrangeAccent.withOpacity(0.6),
            Colors.black.withOpacity(0.2),
            Colors.black.withOpacity(0.2),
          ],
          begin: Alignment.topCenter,
        ));
  }

  //navbar render
  Widget render(int tabInx, Widget view) {
    return IgnorePointer(
      ignoring: index != tabInx,
      child: Opacity(
        opacity: index == tabInx ? 1 : 0,
        child: view,
      ),
    );
  }
}