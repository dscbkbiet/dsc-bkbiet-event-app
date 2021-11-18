import 'package:dsc_event/domain/entities/team_entity.dart';
import 'package:equatable/equatable.dart';

class TeamYearEntity extends Equatable{
  final String year;
  final List<TeamEntity> teamList;

  TeamYearEntity({required this.year, required this.teamList});

  @override
  List<Object?> get props => [year];
}