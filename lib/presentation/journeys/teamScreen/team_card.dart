import 'package:cached_network_image/cached_network_image.dart';
import 'package:dsc_event/common/constants/Strings.dart';
import 'package:dsc_event/presentation/journeys/teamScreen/DeveloperPage.dart';
import 'package:dsc_event/presentation/widgets/git_image.dart';
import 'package:dsc_event/presentation/widgets/insta_image.dart';
import 'package:dsc_event/presentation/widgets/linkedin_image.dart';
import 'package:dsc_event/presentation/widgets/loadingImage.dart';
import 'package:dsc_event/presentation/widgets/twitter_image.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class TeamCard extends StatelessWidget {
  const TeamCard(
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
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => DeveloperPage(
                      memberImage: memberImage,
                      memberName: memberName,
                      memberPost: memberPost,
                      aboutMember: aboutMember,
                      memberLinkedIn: memberLinkedIn,
                      memberInsta: memberInsta,
                      memberTwitter: memberTwitter,
                      memberGitHub: memberGitHub)));
        },
        child: SizedBox(
          height: 90,
          child: Card(
            child: Row(
              children: [
                Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: CachedNetworkImage(
                        imageUrl: memberImage,
                        height: 80,
                        fit: BoxFit.fill,
                        placeholder: (context, url) => CarouselImageLoading(),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    )),
                Expanded(
                    flex: 6,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            memberName,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            memberPost,
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                                color: Colors.grey.shade700),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              InkWell(
                                  onTap: () => openLink(
                                      "${Strings.instagram}$memberInsta",
                                      context),
                                  child: InstaImage(height: 20, width: 20)),
                              InkWell(
                                  onTap: () => openLink(
                                      "${Strings.linkedIn}$memberLinkedIn",
                                      context),
                                  child: LinkedInImage(height: 20, width: 20)),
                              InkWell(
                                  onTap: () => openLink(
                                      "${Strings.twitter}$memberTwitter",
                                      context),
                                  child: TwitterImage(height: 20, width: 20)),
                              InkWell(
                                  onTap: () => openLink(
                                      "${Strings.gitHub}$memberGitHub",
                                      context),
                                  child: GitHubImage(height: 20, width: 20)),
                            ],
                          )
                        ],
                      ),
                    )),
              ],
            ),
          ),
        ),
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
