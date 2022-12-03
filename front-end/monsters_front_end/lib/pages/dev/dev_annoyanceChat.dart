import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:monsters_front_end/main.dart';
import 'package:monsters_front_end/model/annoyanceModel.dart';
import 'package:monsters_front_end/model/audio_Model/audio_player.dart';
import 'package:monsters_front_end/pages/Timer_Widget.dart';
import 'package:monsters_front_end/pages/audio_main.dart';
import 'package:monsters_front_end/pages/drawing_colors.dart';
import 'package:monsters_front_end/pages/style.dart';
import 'package:monsters_front_end/repository/annoyanceRepo.dart';
import 'package:video_player/video_player.dart';

class dev_annoyanceChat extends StatefulWidget {
  @override
  _dev_annoyanceChatState createState() => _dev_annoyanceChatState();
}

class _dev_annoyanceChatState extends State<dev_annoyanceChat> {
  final AnnoyanceRepository annoyanceRepository = AnnoyanceRepository();
  final timerController = TimerController();
  final player = AudioPlayer();
  File? _contentFile;
  File? _moodFile;

  int _type = 1;
  String _content = "測試";
  String _mood = "否";
  int _index = 3;
  int _share = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: secondAppBar("dev-page"),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 100,
                    child: (_contentFile == null)
                        ? PopUpMen(
                            icon: const Icon(
                              Icons.drive_folder_upload,
                              color: Color.fromARGB(255, 164, 78, 38),
                              size: 100,
                            ),
                            menuList: [
                              PopupMenuItem(
                                child: ListTile(
                                    leading:
                                        const Icon(Icons.camera_alt_rounded),
                                    title: const Text("照相"),
                                    onTap: () => {
                                          //照相選項
                                          takePhoto(),
                                          Navigator.pop(context)
                                        }),
                              ),
                              PopupMenuItem(
                                child: ListTile(
                                    leading: const Icon(
                                        Icons.video_camera_front_rounded),
                                    title: const Text("錄影"),
                                    onTap: () => {
                                          //錄影選項
                                          recordVideo(),
                                          Navigator.pop(context)
                                        }),
                              ),
                              PopupMenuItem(
                                child: ListTile(
                                    leading: const Icon(
                                        Icons.keyboard_voice_rounded),
                                    title: const Text("錄音"),
                                    onTap: () => {
                                          //錄音選項
                                          Navigator.pop(context),
                                          recordAudio(context),
                                        }),
                              ),
                            ],
                          )
                        : Container(
                            height: 100,
                            width: 300,
                            margin: const EdgeInsets.only(top: 10),
                            color: Colors.teal,
                            child: TextButton(
                              child: const Text(
                                "重置多媒體煩惱為null",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                              onPressed: () {
                                _contentFile = null;
                                setState(() {});
                              },
                            ),
                          ),
                  ),
                ],
              ),
              (_moodFile == null)
                  ? Container(
                      height: 100,
                      width: 300,
                      margin: const EdgeInsets.all(10),
                      color: Colors.teal,
                      child: TextButton(
                        child: const Text(
                          "畫心情",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                        onPressed: () => _navigateAndDisplayPaint(context),
                      ),
                    )
                  : Container(
                      height: 100,
                      width: 300,
                      margin: const EdgeInsets.all(10),
                      color: Colors.teal,
                      child: TextButton(
                        child: const Text(
                          "重置心情為null",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                        onPressed: () {
                          _moodFile = null;
                          setState(() {});
                        },
                      ),
                    ),
              Container(
                height: 100,
                width: 300,
                color: Colors.amberAccent,
                child: TextButton(
                  child: const Text(
                    "新增煩惱",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.red,
                    ),
                  ),
                  onPressed: () {
                    _type = 2;
                    _content = "測試";
                    _mood = "否";
                    _index = 3;
                    _share = 0;
                    var pushContent;
                    if (_contentFile == null) {
                      pushContent = _content;
                    } else {
                      pushContent = null;
                    }
                    if (_moodFile == null) {
                      _mood = "否";
                    } else {
                      _mood = "是";
                    }
                    log("_type: " + _type.toString());
                    log("_content: " + pushContent.toString());
                    log("_mood: " + _mood);
                    log("_index: " + _index.toString());
                    log("_share: " + _share.toString());
                    log("_contentFile: " + _contentFile.toString());
                    log("_moodFile: " + _moodFile.toString());
                    annoyanceRepository.createAnnoyance(
                      Annoyance(
                        id: 0,
                        account: userAccount, //"Lin"
                        monsterId: 1,
                        type: _type, //4
                        content: pushContent, //"純文字不分享無多媒體"
                        mood: _mood, //"否"
                        index: _index, //3
                        share: _share, //0
                        contentFile: _contentFile, //null
                        moodFile: _moodFile, //null
                        time: '',
                        solve: 0,
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                color: Colors.blueGrey,
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Text(
                    "_content: \n" +
                        _content.toString() +
                        "\n\n\n" +
                        "_contentFile: \n" +
                        _contentFile.toString() +
                        "\n\n\n"
                            "_moodFile: \n" +
                        _moodFile.toString() +
                        "\n\n\n",
                    style: const TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  //新增煩惱-照相
  takePhoto() async {
    final media = await ImagePicker().pickImage(source: ImageSource.camera);
    if (media == null) return;
    final imageTemporary = File(media.path);

    _contentFile = imageTemporary;
    setState(() {});
  }

  //新增煩惱-錄影
  recordVideo() async {
    XFile? recordedVideo = await ImagePicker().pickVideo(
        source: ImageSource.camera, maxDuration: const Duration(seconds: 15));
    if (recordedVideo == null) return;
    _contentFile = File(recordedVideo.path);
    setState(() {});
  }

  //錄音功能
  recordAudio(BuildContext context) async {
    final media = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AudioMainPage()),
    );

    if (media == null) return;
    final audioTemporary = File(media);
    _contentFile = audioTemporary;
    setState(() {});
  }

  //畫心情功能
  _navigateAndDisplayPaint(BuildContext context) async {
    final moodImage = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Draw_mood()),
    );
    if (moodImage == null) {
      log("畫心情失敗");
    } else {
      final imageTemporary = File(moodImage.path);
      _moodFile = imageTemporary;
    }

    setState(() {});
  }
}

//彈出選單設置
class PopUpMen extends StatelessWidget {
  final List<PopupMenuEntry> menuList;
  final Widget? icon;

  const PopUpMen({Key? key, required this.menuList, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: ((context) => menuList),
      icon: icon,
      iconSize: 200,
    );
  }
}
