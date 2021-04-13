import 'package:cached_network_image/cached_network_image.dart';
import 'package:dsc_event/consts/Common.dart';
import 'package:dsc_event/consts/Strings.dart';
import 'package:dsc_event/model/events.dart';
import 'package:dsc_event/screens/DeveloperPage.dart';
import 'package:dsc_event/screens/PodCast.dart';
import 'package:dsc_event/screens/second.dart';
import 'package:dsc_event/shimmer/loadingImage.dart';
import 'package:dsc_event/stateManager/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ScrollController controllerEventsList = ScrollController();

  @override
  void initState() {
    super.initState();
    controllerEventsList.addListener(_scrollListenerEvents);
  }

  void _scrollListenerEvents() {
    if (controllerEventsList.offset >=
            controllerEventsList.position.maxScrollExtent &&
        !controllerEventsList.position.outOfRange) {
      Common.calls.getMoreEvents(context).catchError((e) {
        print(e);
      });
    }
  }

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
        currentIndex: 0,
        onTap: (int index) {
          if (index == 1)
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (_) => PodCast()));
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.event), label: "Events"),
          BottomNavigationBarItem(
              icon: Icon(Icons.speaker_phone), label: "Pod Cast")
        ],
      ),
      body: Container(
        child: Consumer(
          builder: (key, watch, _) {
            final List<Events> eventsList = watch(eventsProvider).event;
            return ListView(
              controller: controllerEventsList,
              scrollDirection: Axis.vertical,
              physics: BouncingScrollPhysics(),
              children: eventsList.map(_getEventsItem).toList(),
            );
          },
        ),
      ),
    );
  }

  Widget _getEventsItem(Events events) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Second(
                          events: events,
                        )));
          },
          child: Hero(
            tag: events.id,
            child: Container(
              margin: EdgeInsets.only(top: 20.0, left: 25.0, right: 25.0),
              child: Column(
                children: <Widget>[
                  Material(
                    elevation: 10.0,
                    borderRadius: BorderRadius.circular(20.0),
                    child: ClipRRect(
                      borderRadius: new BorderRadius.circular(20.0),
                      child: CachedNetworkImage(
                        imageUrl: events.image,
                        height: 350.0,
                        fit: BoxFit.contain,
                        placeholder: (context, url) => CarouselImageLoading(),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              FittedBox(
                child: Text(
                  events.name,
                  maxLines: 1,
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              FittedBox(
                child: Text(
                  events.date,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 25.0,
        ),
      ],
    );
  }
}