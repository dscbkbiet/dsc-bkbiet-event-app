import 'package:dsc_event/consts/Strings.dart';
import 'package:dsc_event/screens/DeveloperPage.dart';
import 'package:dsc_event/screens/HomePage.dart';
import 'package:flutter/material.dart';

class PodCast extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset(
          Strings.logo,
          height: 45,
        ),
        backgroundColor: Colors.grey.shade900,
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => DeveloperPage()));
            },
            color: Colors.white,
          ),
        ],
        iconTheme: IconThemeData(color: Colors.white),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey.shade900,
        selectedItemColor: Colors.white.withOpacity(0.9),
        unselectedItemColor: Colors.white.withOpacity(0.5),
        currentIndex: 1,
        onTap: (int index) {
          if (index == 0)
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (_) => MyHomePage()));
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.event), label: "Events"),
          BottomNavigationBarItem(
              icon: Icon(Icons.speaker_phone), label: "Pod Cast")
        ],
      ),
      body: Center(
        child: Text("Coming Soon",style: TextStyle(fontSize: 40),),
      ),
    );
  }
}
