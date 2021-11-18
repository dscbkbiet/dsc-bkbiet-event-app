import 'package:dsc_event/common/constants/Strings.dart';
import 'package:dsc_event/presentation/journeys/teamScreen/DeveloperScreen.dart';
import 'package:dsc_event/presentation/widgets/git_image.dart';
import 'package:dsc_event/presentation/widgets/insta_image.dart';
import 'package:dsc_event/presentation/widgets/linkedin_image.dart';
import 'package:dsc_event/presentation/widgets/logo.dart';
import 'package:dsc_event/presentation/widgets/spotify_image.dart';
import 'package:dsc_event/presentation/widgets/twitter_image.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class DrawerView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 9,
          child: SingleChildScrollView(
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
                    openLink(Strings.playStoreLink, context);
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
          ),
        ),
        Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                    onTap: () => openLink(
                        "${Strings.instagram}${Strings.gdscInsta}", context),
                    child: InstaImage(height: 20, width: 20)),
                InkWell(
                    onTap: () => openLink("${Strings.gdscLinkedIn}", context),
                    child: LinkedInImage(height: 20, width: 20)),
                InkWell(
                  onTap: () => openLink("${Strings.web}", context),
                  child: Icon(
                    Icons.public_outlined,
                  ),
                ),
                InkWell(
                    onTap: () => openLink(
                        "${Strings.twitter}${Strings.gdscTwitter}", context),
                    child: TwitterImage(height: 20, width: 20)),
                InkWell(
                    onTap: () => openLink(
                        "${Strings.gitHub}${Strings.gdscGithub}", context),
                    child: GitHubImage(height: 20, width: 20))
              ],
            ))
      ],
    );
  }

  void openLink(String url, BuildContext context) async {
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
