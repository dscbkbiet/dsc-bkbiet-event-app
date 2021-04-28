import 'package:dsc_event/presentation/journeys/teamScreen/DeveloperPage.dart';
import 'package:dsc_event/presentation/journeys/homeScreen/Pages/blogs_list_page.dart';
import 'package:dsc_event/presentation/journeys/eventScreen/events_list_page.dart';
import 'package:dsc_event/presentation/journeys/homeScreen/Pages/podcast_list_page.dart';
import 'package:dsc_event/presentation/widgets/logo.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        centerTitle: true,
        title: Logo(
          height: 40,
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
        currentIndex: 0,
        onTap: (int index) {},
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.event), label: "Events"),
          BottomNavigationBarItem(
              icon: Icon(Icons.speaker_phone), label: "Pod Cast")
        ],
      ),
      body: PageView(
        children: [
          EventsListPage(),
          PodCastPage(),
          BlogPage(),
        ],
      ),
    );
  }
}
