import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';

class MyAudio extends ChangeNotifier {
  static Duration totalDuration;
  static Duration position;
  static String audioState;

  static AudioPlayer audioPlayer = AudioPlayer();

  static initAudio() {
    audioPlayer.onDurationChanged.listen((updatedDuration) {
      totalDuration = updatedDuration;
      // notifyListeners();
    });

    audioPlayer.onAudioPositionChanged.listen((updatedPosition) {
      position = updatedPosition;
      // notifyListeners();
    });

    audioPlayer.onPlayerStateChanged.listen((playerState) {
      if (playerState == PlayerState.STOPPED) audioState = "Stopped";
      if (playerState == PlayerState.PLAYING) audioState = "Playing";
      if (playerState == PlayerState.PAUSED) audioState = "Paused";
      // notifyListeners();
    });
  }

  static playAudio(String url) {
    audioPlayer.play(url).onError((error, stackTrace) {
      print(error);
      return 0;
    });
  }

  static pauseAudio() {
    audioPlayer.pause();
  }

  static resumeAudio() {
    audioPlayer.resume();
  }

  static stopAudio() {
    audioPlayer.stop();
  }

  static seekAudio(Duration durationToSeek) {
    audioPlayer.seek(durationToSeek);
  }
}
