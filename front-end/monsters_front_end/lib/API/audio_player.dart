import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_sound_lite/public/flutter_sound_player.dart';
import 'package:monsters_front_end/pages/Timer_Widget.dart';
import 'package:path_provider/path_provider.dart';

const pathToReadAudio = 'audio_example.aac';

class AudioPlayer {
  FlutterSoundPlayer? _audioPlayer;
  final timerController = TimerController();

  bool get isPlaying => _audioPlayer!.isPlaying;

  Future init() async {
    timerController.startTimer();
    _audioPlayer = FlutterSoundPlayer();
    await _audioPlayer!.openAudioSession();
  }

  void dispose() {
    _audioPlayer!.closeAudioSession();
    _audioPlayer = null;
  }

  Future _play(VoidCallback whenFinished) async {
    await _audioPlayer!
        .startPlayer(fromURI: pathToReadAudio, whenFinished: whenFinished);

    final directory = (await getApplicationDocumentsDirectory()).path;
    log(directory.toString());
  }

  Future _stop() async {
    await _audioPlayer!.stopPlayer();
  }

  Future togglePlaying({required VoidCallback whenFinished}) async {
    if (_audioPlayer!.isStopped) {
      await _play(whenFinished);
    } else {
      await _stop();
    }
  }
}
