import 'package:cached_network_image/cached_network_image.dart';
import 'package:dsc_event/common/constants/Strings.dart';
import 'package:dsc_event/domain/entities/team_entity.dart';
import 'package:dsc_event/presentation/widgets/git_image.dart';
import 'package:dsc_event/presentation/widgets/insta_image.dart';
import 'package:dsc_event/presentation/widgets/linkedin_image.dart';
import 'package:dsc_event/presentation/widgets/loadingImage.dart';
import 'package:dsc_event/presentation/widgets/logo.dart';
import 'package:dsc_event/presentation/widgets/twitter_image.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DeveloperPage extends StatelessWidget {
  const DeveloperPage({
    Key? key,
    required this.teamEntity,
  }) : super(key: key);

  final TeamEntity teamEntity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Logo(
          height: 40,
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
                      imageUrl: teamEntity.memberImage,
                      height: 80,
                      fit: BoxFit.fill,
                      placeholder: (context, url) => CarouselImageLoading(),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    "From the ${teamEntity.memberPost} desk",
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
          teamEntity.aboutMember != null
              ? Padding(
                  padding:
                      const EdgeInsets.only(top: 20.0, left: 15.0, right: 15.0),
                  child: Text(
                    teamEntity.aboutMember!,
                    style: TextStyle(fontSize: 15, height: 1.5),
                  ),
                )
              : SizedBox.shrink(),
          SizedBox(
            height: 15.0,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              teamEntity.memberName,
              textAlign: TextAlign.right,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30.0, left: 15.0),
            child: Column(
              children: [
                if (teamEntity.memberInsta != null &&
                    teamEntity.memberInsta!.isNotEmpty)
                  InkWell(
                    onTap: () {
                      openWeb("${Strings.instagram}${teamEntity.memberInsta}",
                          context);
                    },
                    child: Row(
                      children: [
                        InstaImage(height: 30, width: 30),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text("/${teamEntity.memberInsta}"),
                        )
                      ],
                    ),
                  ),
                if (teamEntity.memberLinkedIn != null &&
                    teamEntity.memberLinkedIn!.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: InkWell(
                      onTap: () {
                        openWeb(
                            "${Strings.linkedIn}${teamEntity.memberLinkedIn}",
                            context);
                      },
                      child: Row(
                        children: [
                          LinkedInImage(height: 30, width: 30),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text("/${teamEntity.memberLinkedIn}"),
                          )
                        ],
                      ),
                    ),
                  ),
                if (teamEntity.memberTwitter != null &&
                    teamEntity.memberTwitter!.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: InkWell(
                      onTap: () {
                        openWeb("${Strings.twitter}${teamEntity.memberTwitter}",
                            context);
                      },
                      child: Row(
                        children: [
                          TwitterImage(height: 30, width: 30),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text("/${teamEntity.memberTwitter}"),
                          )
                        ],
                      ),
                    ),
                  ),
                if (teamEntity.memberGitHub != null &&
                    teamEntity.memberGitHub!.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: InkWell(
                      onTap: () {
                        openWeb("${Strings.gitHub}${teamEntity.memberGitHub}",
                            context);
                      },
                      child: Row(
                        children: [
                          GitHubImage(height: 30, width: 30),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text("/${teamEntity.memberGitHub}"),
                          )
                        ],
                      ),
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
