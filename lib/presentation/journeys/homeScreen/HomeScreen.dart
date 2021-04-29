import 'package:dsc_event/presentation/journeys/eventScreen/events_list_page.dart';
import 'package:dsc_event/presentation/journeys/homeScreen/Pages/blogPage/blogs_page.dart';
import 'package:dsc_event/presentation/journeys/homeScreen/Pages/podcastPage/podcast_list_page.dart';
import 'package:dsc_event/presentation/journeys/teamScreen/DeveloperScreen.dart';
import 'package:dsc_event/presentation/widgets/logo.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController _pageController = PageController();
  int selectedIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
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
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => DeveloperScreen()));
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
        currentIndex: selectedIndex,
        onTap: (int index) {
          if (index != selectedIndex && index == 0) {
            _pageController.animateToPage(
              0,
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeInOut,
            );
          } else if (index != selectedIndex && index == 1) {
            _pageController.animateToPage(
              1,
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeInOut,
            );
          } else if (index != selectedIndex && index == 2) {
            _pageController.animateToPage(
              2,
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeInOut,
            );
          }
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.event), label: "Events"),
          BottomNavigationBarItem(
              icon: Icon(Icons.edit_outlined), label: "Blog"),
          BottomNavigationBarItem(
              icon: Icon(Icons.speaker_phone), label: "Pod Cast")
        ],
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        children: [
          EventsListPage(),
          BlogPage(),
          PodCastPage(),
        ],
      ),
    );
  }
}
