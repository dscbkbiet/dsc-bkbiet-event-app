import 'package:bloc/bloc.dart';
import 'package:dsc_event/data/models/podcast.dart';
import 'package:dsc_event/presentation/journeys/homeScreen/music_controller.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'music_player_animation_state.dart';

class MusicPlayerAnimationCubit extends Cubit<MusicPlayerAnimationState> {
  MusicPlayerAnimationCubit() : super(MusicPlayerAnimationInitial());

  void playPodCast(PodCast podCast) {
    MyAudio.initAudio();
    MyAudio.playAudio(podCast.audioUrl);
    emit(PlayMusic(podCast));
  }
}
