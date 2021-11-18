import 'package:equatable/equatable.dart';

class TeamEntity extends Equatable {
  final String memberImage;
  final String memberName;
  final String memberPost;
  final String? aboutMember;
  final String? memberLinkedIn;
  final String? memberInsta;
  final String? memberTwitter;
  final String? memberGitHub;

  TeamEntity(
      {required this.memberImage,
      required this.memberName,
      required this.memberPost,
      required this.aboutMember,
      required this.memberLinkedIn,
      required this.memberInsta,
      required this.memberTwitter,
      required this.memberGitHub});

  @override
  List<Object> get props => [memberName];
}
