import 'package:cached_network_image/cached_network_image.dart';
import 'package:dsc_event/common/constants/Strings.dart';
import 'package:dsc_event/presentation/widgets/git_image.dart';
import 'package:dsc_event/presentation/widgets/insta_image.dart';
import 'package:dsc_event/presentation/widgets/linkedin_image.dart';
import 'package:dsc_event/presentation/widgets/loadingImage.dart';
import 'package:dsc_event/presentation/widgets/logo.dart';
import 'package:dsc_event/presentation/widgets/twitter_image.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DeveloperPage extends StatelessWidget {
  const DeveloperPage(
      {Key key,
      @required this.memberImage,
      @required this.memberName,
      @required this.memberPost,
      @required this.aboutMember,
      @required this.memberLinkedIn,
      @required this.memberInsta,
      @required this.memberTwitter,
      @required this.memberGitHub})
      : super(key: key);
  final String memberImage;
  final String memberName;
  final String memberPost;
  final String memberLinkedIn;
  final String memberInsta;
  final String memberTwitter;
  final String memberGitHub;
  final String aboutMember;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Logo(
          height: 45,
        ),
        backgroundColor: Colors.grey.shade900,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        physics: BouncingScrollPhysics(),
        children: [
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 100,
                  width: 100,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: CachedNetworkImage(
                      imageUrl: memberImage,
                      height: 80,
                      fit: BoxFit.fill,
                      placeholder: (context, url) => CarouselImageLoading(),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    "From the $memberPost desk",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: "Dancing",
                        color: Colors.red,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0, left: 15.0, right: 15.0),
            child: Text(
              aboutMember,
              style: TextStyle(fontSize: 15, height: 1.5),
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              memberName,
              textAlign: TextAlign.right,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30.0, left: 15.0),
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    openWeb("${Strings.instagram}$memberInsta", context);
                  },
                  child: Row(
                    children: [
                      InstaImage(height: 30, width: 30),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text("/$memberInsta"),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                InkWell(
                  onTap: () {
                    openWeb("${Strings.linkedIn}$memberLinkedIn", context);
                  },
                  child: Row(
                    children: [
                      LinkedInImage(height: 30, width: 30),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text("/$memberLinkedIn"),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                InkWell(
                  onTap: () {
                    openWeb("${Strings.twitter}$memberTwitter", context);
                  },
                  child: Row(
                    children: [
                      TwitterImage(height: 30, width: 30),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text("/$memberTwitter"),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                InkWell(
                  onTap: () {
                    openWeb("${Strings.gitHub}$memberGitHub", context);
                  },
                  child: Row(
                    children: [
                      GitHubImage(height: 30, width: 30),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text("/$memberGitHub"),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 25.0,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void openWeb(String url, BuildContext context) async {
    if (await canLaunch(url))
      await launch(url);
    else
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          "Error while opening url try again!",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red.shade700,
      ));
  }
}
