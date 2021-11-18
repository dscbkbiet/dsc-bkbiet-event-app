part of 'team_list_cubit.dart';

abstract class TeamListState extends Equatable {
  const TeamListState();

  @override
  List<Object> get props => [];
}

class TeamListInitial extends TeamListState {}

class TeamListLoading extends TeamListState {}

class TeamListLoaded extends TeamListState {
  final List<TeamYearEntity> team;

  TeamListLoaded(this.team);
}

class TeamListError extends TeamListState {}
