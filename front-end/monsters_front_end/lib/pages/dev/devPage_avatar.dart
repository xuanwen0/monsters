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

class devPage_avatar extends StatefulWidget {
  @override
  _devPage_avatarState createState() => _devPage_avatarState();
}

class _devPage_avatarState extends State<devPage_avatar> {
  List avatars = [];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: secondAppBar("dev-avatar"),
        //future builder after getting avatars
        body: Container(
          height: 200,
          color: Colors.red,
          child: avatarContainer(),
        ));
  }

  Container avatarContainer() {
    Container avatarContainer = Container();
    //get avatars

    return avatarContainer;
  }
}
