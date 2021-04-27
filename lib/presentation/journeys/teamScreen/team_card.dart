import 'package:dsc_event/presentation/widgets/insta_image.dart';
import 'package:dsc_event/presentation/widgets/linkedin_image.dart';
import 'package:dsc_event/presentation/widgets/twitter_image.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class TeamCard extends StatelessWidget {
  const TeamCard(
      {Key key,
      this.memberImage,
      this.memberName,
      this.memberPost,
      this.memberLinkedIn,
      this.memberInsta,
      this.memberTwitter})
      : super(key: key);
  final String memberImage;
  final String memberName;
  final String memberPost;
  final String memberLinkedIn;
  final String memberInsta;
  final String memberTwitter;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: Column(
        children: [
          Expanded(flex: 6, child: Image.network(memberImage)),
          Expanded(flex: 3, child: Text(memberName)),
          Expanded(flex: 2, child: Text(memberPost)),
          Expanded(
              flex: 3,
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      openLink(memberInsta, context);
                    },
                    child: InstaImage(
                      height: 40,
                      width: 40,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      openLink(memberLinkedIn, context);
                    },
                    child: LinkedInImage(
                      height: 40,
                      width: 40,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      openLink(memberTwitter, context);
                    },
                    child: TwitterImage(
                      height: 40,
                      width: 40,
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }

  void openLink(String link, BuildContext context) async {
    try {
      if (link != null) {
        final url = link;
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
    } on Exception {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          "Error while opening url try again!",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red.shade700,
      ));
    }
  }
}
