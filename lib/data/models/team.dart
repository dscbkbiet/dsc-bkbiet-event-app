import 'package:dsc_event/domain/entities/team_entity.dart';

class Team extends TeamEntity {
  final String memberImage;
  final String memberName;
  final String memberPost;
  final String? aboutMember;
  final String? memberLinkedIn;
  final String? memberInsta;
  final String? memberTwitter;
  final String? memberGitHub;

  Team(
      {required this.memberImage,
      required this.memberName,
      required this.memberPost,
      required this.aboutMember,
      required this.memberLinkedIn,
      required this.memberInsta,
      required this.memberTwitter,
      required this.memberGitHub})
      : super(
            memberImage: memberImage,
            memberName: memberName,
            memberPost: memberPost,
            aboutMember: aboutMember,
            memberLinkedIn: memberLinkedIn,
            memberTwitter: memberTwitter,
            memberInsta: memberInsta,
            memberGitHub: memberGitHub);

  factory Team.fromJson(Map<dynamic, dynamic> value) {
    return Team(
        memberImage: value["memberImage"],
        memberName: value["memberName"],
        memberPost: value["memberPost"],
        aboutMember: value["aboutMember"],
        memberLinkedIn: value["memberLinkedIn"],
        memberTwitter: value["memberTwitter"],
        memberInsta: value["memberInsta"],
        memberGitHub: value["memberGitHub"]);
  }

  toJson() {
    return {
      "memberImage": memberImage,
      "memberName": memberName,
      "memberPost": memberPost,
      "aboutMember": aboutMember,
      "memberLinkedIn": memberLinkedIn,
      "memberTwitter": memberTwitter,
      "memberInsta": memberInsta,
      "memberGitHub": memberGitHub,
    };
  }
}
