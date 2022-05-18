import 'package:cached_network_image/cached_network_image.dart';
import 'package:dsc_event/common/extensions/ext.dart';
import 'package:dsc_event/domain/entities/events_entity.dart';
import 'package:dsc_event/presentation/widgets/loadingImage.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class EventDetailScreen extends StatefulWidget {
  const EventDetailScreen({Key? key, required this.events}) : super(key: key);
  final EventsEntity events;

  @override
  _EventDetailScreenState createState() => _EventDetailScreenState();
}

class _EventDetailScreenState extends State<EventDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            flexibleSpace: FlexibleSpaceBar(
              title: Text(widget.events.name.intelliTrim(size: 35)),
              background: Hero(
                tag: widget.events.id,
                child: Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    CachedNetworkImage(
                      imageUrl: widget.events.image,
                      fit: BoxFit.fill,
                      placeholder: (context, url) => CarouselImageLoading(),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                    const DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment(0.0, 0.5),
                          end: Alignment.center,
                          colors: <Color>[
                            Color(0x60000000),
                            Color(0x00000000),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            pinned: true,
            expandedHeight: height * 0.305,
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                height: height - 90,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40.0),
                        topRight: Radius.circular(40.0))),
                child: ListView(
                  scrollDirection: Axis.vertical,
                  physics: BouncingScrollPhysics(),
                  children: [
                    Column(
                      children: <Widget>[
                        SizedBox(
                          height: 10.0,
                        ),
                        Material(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Color(0xffD6EDEB),
                          child: Container(
                            height: 5.0,
                            width: 50.0,
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 25.0, vertical: 20.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Material(
                                color: Color(0xff007D74),
                                child: Container(
                                  padding: EdgeInsets.all(5.0),
                                  child: FittedBox(
                                    child: Text(
                                      widget.events.type,
                                      maxLines: 1,
                                      style: TextStyle(
                                          letterSpacing: 4.0,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              FittedBox(
                                child: Text(
                                  widget.events.date,
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 25.0, vertical: 0.0),
                          child: Row(
                            children: <Widget>[
                              Flexible(
                                child: Text(
                                  widget.events.name,
                                  maxLines: 2,
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 25.0, vertical: 10.0),
                          child: Text(widget.events.details),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 25.0, vertical: 10.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Material(
                                color: Color(0xff007D74),
                                borderRadius: BorderRadius.circular(30.0),
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                    backgroundColor: Color(0xff007D74),
                                  ),
                                  onPressed: () async {
                                    if (widget.events.eventUrl.isNotEmpty) {
                                      final url = widget.events.eventUrl;
                                      if (await canLaunchUrl(
                                          Uri(scheme: "https", path: url))) {
                                        launchUrl(Uri(
                                            scheme: "https",
                                            path: url.replaceAll(
                                                "https://", "")));
                                      } else
                                        // can't launch url, there is some error
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                          content: Text(
                                            "Error while opening url try again!",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          backgroundColor: Colors.red.shade700,
                                        ));
                                    }
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      widget.events.eventUrl.isEmpty
                                          ? "Coming Soon"
                                          : "Live",
                                      style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white,
                                          letterSpacing: 2.0),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
//              height: height - 0.50,
              ),
            ]),
          )
        ],
      ),
    );
  }
}
