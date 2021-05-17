import 'package:dsc_event/presentation/journeys/teamScreen/DeveloperScreen.dart';
import 'package:dsc_event/presentation/widgets/logo.dart';
import 'package:dsc_event/presentation/widgets/spotify_image.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class DrawerView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          DrawerHeader(
            child: Logo(height: 30),
            decoration: BoxDecoration(color: Colors.grey.shade900),
          ),
          ListTile(
            leading: Icon(
              Icons.group,
              color: Colors.black,
            ),
            title: Text("Team"),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => DeveloperScreen()));
            },
          ),
          ListTile(
            leading: SpotifyImage(
              height: 24,
              width: 24,
            ),
            title: Text("Spotify Podcast"),
            onTap: () {
              Navigator.pop(context);
              openSpotify(context);

            },
          ),
          ListTile(
            leading: Icon(
              Icons.rate_review,
              color: Colors.black,
            ),
            title: Text("Rate Us"),
            onTap: () {
              Navigator.pop(context);
              openLink(context);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.share,
              color: Colors.black,
            ),
            title: Text("Share"),
            onTap: () {
              Navigator.pop(context);
              Share.share(
                  'https://play.google.com/store/apps/details?id=com.bkbiet.dsc_event');
            },
          ),
        ],
      ),
    );
  }

  void openLink(BuildContext context) async {
    const url =
        "https://play.google.com/store/apps/details?id=com.bkbiet.dsc_event";
    if (await canLaunch(url))
      await launch(url);
    else
      // can't launch url, there is some error
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          "Error while opening url try again!",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red.shade700,
      ));
  }

  void openSpotify(BuildContext context) async {
    const url = "https://open.spotify.com/show/63yaglAHUitrDjH9WCXlSZ";
    if (await canLaunch(url))
      await launch(url);
    else
      // can't launch url, there is some error
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          "Error while opening url try again!",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red.shade700,
      ));
  }
}
