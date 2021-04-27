import 'package:cached_network_image/cached_network_image.dart';
import 'package:dsc_event/domain/entities/events_entity.dart';
import 'package:dsc_event/presentation/journeys/eventScreen/event_detail_screen.dart';
import 'package:dsc_event/presentation/widgets/loadingImage.dart';
import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  final EventsEntity events;

  const EventCard({Key key, @required this.events}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => EventDetailScreen(
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
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
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
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
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
      ),
    );
  }
}
