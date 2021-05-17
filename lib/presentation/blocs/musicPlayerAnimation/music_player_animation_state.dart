part of 'music_player_animation_cubit.dart';

@immutable
abstract class MusicPlayerAnimationState extends Equatable {
  const MusicPlayerAnimationState();

  @override
  List<Object> get props => [];
}

class MusicPlayerAnimationInitial extends MusicPlayerAnimationState {}

class PlayMusic extends MusicPlayerAnimationState {
  final PodCast podCast;

  const PlayMusic(this.podCast);

  @override
  List<Object> get props => [podCast];
}

class StopMusic extends MusicPlayerAnimationState {}

class ResumeMusic extends MusicPlayerAnimationState {}

class PauseMusic extends MusicPlayerAnimationState {}
