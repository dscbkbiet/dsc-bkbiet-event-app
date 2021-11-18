import 'package:dsc_event/data/models/team.dart';
import 'package:dsc_event/domain/entities/teamyear_entity.dart';

class TeamYear extends TeamYearEntity {
  final String year;
  final List<Team> teamList;

  TeamYear({required this.year, required this.teamList})
      : super(year: year, teamList: teamList);

  factory TeamYear.fromJson(Map<dynamic, dynamic> value) {
    final List<Team> rTeamList = [];
    for (final item in value["team"]) {
      rTeamList.add(Team.fromJson(item));
    }
    return TeamYear(year: value["year"], teamList: rTeamList);
  }
}
