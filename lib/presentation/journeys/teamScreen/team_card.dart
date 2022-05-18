import 'package:cached_network_image/cached_network_image.dart';
import 'package:dsc_event/common/constants/Strings.dart';
import 'package:dsc_event/domain/entities/team_entity.dart';
import 'package:dsc_event/presentation/journeys/teamScreen/DeveloperPage.dart';
import 'package:dsc_event/presentation/widgets/git_image.dart';
import 'package:dsc_event/presentation/widgets/insta_image.dart';
import 'package:dsc_event/presentation/widgets/linkedin_image.dart';
import 'package:dsc_event/presentation/widgets/loadingImage.dart';
import 'package:dsc_event/presentation/widgets/twitter_image.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class TeamCard extends StatelessWidget {
  const TeamCard({
    Key? key,
    required this.teamEntity,
  }) : super(key: key);
  final TeamEntity teamEntity;

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
                        teamEntity: teamEntity,
                      )));
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
                        imageUrl: teamEntity.memberImage,
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
                            teamEntity.memberName,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            teamEntity.memberPost,
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
                              if (teamEntity.memberInsta != null &&
                                  teamEntity.memberInsta!.isNotEmpty)
                                InkWell(
                                    onTap: () => openLink(
                                        "${Strings.instagram}${teamEntity.memberInsta}",
                                        context),
                                    child: InstaImage(height: 20, width: 20)),
                              if (teamEntity.memberLinkedIn != null &&
                                  teamEntity.memberLinkedIn!.isNotEmpty)
                                InkWell(
                                    onTap: () => openLink(
                                        "${Strings.linkedIn}${teamEntity.memberLinkedIn}",
                                        context),
                                    child:
                                        LinkedInImage(height: 20, width: 20)),
                              if (teamEntity.memberTwitter != null &&
                                  teamEntity.memberTwitter!.isNotEmpty)
                                InkWell(
                                    onTap: () => openLink(
                                        "${Strings.twitter}${teamEntity.memberTwitter}",
                                        context),
                                    child: TwitterImage(height: 20, width: 20)),
                              if (teamEntity.memberGitHub != null &&
                                  teamEntity.memberGitHub!.isNotEmpty)
                                InkWell(
                                    onTap: () => openLink(
                                        "${Strings.gitHub}${teamEntity.memberGitHub}",
                                        context),
                                    child: GitHubImage(height: 20, width: 20))
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
      if (link.isNotEmpty) {
        if (!await launchUrl(Uri.parse(link),mode: LaunchMode.externalApplication))
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
