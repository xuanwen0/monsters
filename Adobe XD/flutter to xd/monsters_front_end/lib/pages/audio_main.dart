import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_sound_lite/public/flutter_sound_player.dart';
import 'package:flutter_sound_lite/public/flutter_sound_recorder.dart';
import 'package:monsters_front_end/API/audio_recorder.dart';
import 'package:monsters_front_end/API/audio_player.dart';
import 'package:monsters_front_end/pages/Timer_Widget.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path_provider/path_provider.dart';

const pathToReadAudio = 'audio_example.aac';

class AudioMainPage extends StatefulWidget {
  @override
  _AudioMainPage createState() => _AudioMainPage();
}

class _AudioMainPage extends State<AudioMainPage> {
  Duration duration = Duration();
  final timerController = TimerController();
  final recorder = AudioRecorder();
  final player = AudioPlayer();
  File? _audio;

  @override
  void initState() {
    super.initState();
    recorder.init();
    player.init();
  }

  @override
  void dispose() {
    recorder.dispose();
    player.dispose();
    super.dispose();
  }

  void saveAudio() async {
    /*
    final directory = (await getApplicationDocumentsDirectory()).path;
    String datetime = DateTime.now().toIso8601String() + '_AudioRecord';
    _audio = File('$directory/$datetime.aac');
    */
    Navigator.pop(context, pathToReadAudio);
  }

  @override
  Widget build(BuildContext context) {
    final isFinished = recorder.isFinished;
    return Scaffold(
        body: Center(
            child: Container(
                color: Colors.black,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.mic, size: 32),
                    Container(
                        height: 300,
                        width: 300,
                        child: TimerWidget(controller: timerController)),

                    SizedBox(height: 16),
                    //start
                    buildStart(),
                    SizedBox(height: 20),
                    //play
                    Container(
                      child: (isFinished) ? buildPlay() : null,
                    ),
                    SizedBox(height: 20),
                    //save
                    Container(
                      child: (isFinished) ? buildSave() : null,
                    ),
                  ],
                ))));
  }

  Widget buildStart() {
    final isRecording = recorder.isRecording;
    final isFinished = recorder.isFinished;
    var icon = isRecording ? Icons.stop : Icons.mic;
    var text = isRecording ? 'STOP' : 'START';

    var primary = isRecording ? Colors.red : Colors.white;
    var onPrimary = isRecording ? Colors.white : Colors.black;
    if (isFinished) {
      icon = Icons.refresh;
      text = 'Record Again';
      primary = Color.fromARGB(255, 71, 172, 255);
      onPrimary = Colors.black;
      setState(() {});
    }

    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(175, 50),
        primary: primary,
        onPrimary: onPrimary,
      ),
      icon: Icon(icon),
      label: Text(text,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      onPressed: () async {
        await recorder.toggleRecording();
        final isRecording = recorder.isRecording;
        setState(() {});
        if (isRecording) {
          timerController.startTimer();
        } else {
          timerController.stopTimer();
        }
      },
    );
  }

  Widget buildPlay() {
    final isPlaying = player.isPlaying;
    final icon = isPlaying ? Icons.stop : Icons.play_arrow;
    final text = isPlaying ? 'Stop Playing' : 'Play Recording';

    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(175, 50),
        primary: Colors.white,
        onPrimary: Colors.black,
      ),
      icon: Icon(icon),
      label: Text(text,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      onPressed: () async {
        await player.togglePlaying(
            whenFinished: () => {timerController.stopTimer(), setState(() {})});
        setState(() {});
        final isPlaying = player.isPlaying;
        if (isPlaying) {
          timerController.startTimer();
        } else {
          timerController.stopTimer();
        }
        setState(() {});
      },
    );
  }

  Widget buildSave() {
    final icon = Icons.done_all_rounded;
    final text = 'Done';

    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(175, 50),
        primary: Colors.white,
        onPrimary: Colors.black,
      ),
      icon: Icon(icon),
      label: Text(text,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      onPressed: () async {
        saveAudio();
        setState(() {});
      },
    );
  }
}
