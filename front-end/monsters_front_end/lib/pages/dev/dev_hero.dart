import 'package:flutter/material.dart';
import 'package:monsters_front_end/pages/dev/dev_randomMonster.dart';
import 'package:monsters_front_end/pages/drawer_personalInfo.dart';
import 'package:monsters_front_end/pages/style.dart';

class dev_hero extends StatefulWidget {
  const dev_hero({Key? key}) : super(key: key);

  @override
  State<dev_hero> createState() => _dev_heroState();
}

class _dev_heroState extends State<dev_hero> {
  //異步處理
  late Future _future;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: secondAppBar("dev_hero"),
        body: Center(
          child: GestureDetector(
              child: Container(
                height: 100,
                width: 100,
                color: Colors.red,
              ),
              onTap: () {
                changeAvatar(context);
                setState(() {});
              }),
        ));
  }

  Future<dynamic> changeAvatar(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return const AvatarWidget();
      },
    );
  }
}

class AvatarWidget extends StatefulWidget {
  const AvatarWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _AvatarWidget();
  }
}

class _AvatarWidget extends State<AvatarWidget> {
  int itemCounter = monsterNamesList.length;
  String selected = "";
  @override
  Widget build(BuildContext context) {
    return Material(
        type: MaterialType.transparency,
        child: Center(
          child: Container(
            height: 400,
            width: MediaQuery.of(context).size.width * 0.8,
            decoration: BoxDecoration(
              color: BackgroundColorLight,
              border: Border.all(width: 5, color: BackgroundColorWarm),
              borderRadius: BorderRadius.circular(22.0),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 300,
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: GridView(
                    padding: const EdgeInsets.all(10),
                    scrollDirection: Axis.vertical,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            mainAxisSpacing: 5,
                            crossAxisSpacing: 5),
                    children: List.generate(
                      itemCounter,
                      ((index) => GestureDetector(
                            onTap: () {
                              selected = monsterNamesList[index];
                              setState(() {});
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: 50,
                              width: 50,
                              decoration: (selected == monsterNamesList[index])
                                  ? BoxDecoration(
                                      color: BackgroundColorLight,
                                      borderRadius: const BorderRadius.all(
                                          Radius.elliptical(9999.0, 9999.0)),
                                      border: Border.all(
                                          width: 3,
                                          color: const Color(0xffa0522d)),
                                    )
                                  : null,
                              child: CircleAvatar(
                                minRadius: 10,
                                backgroundImage: AssetImage(
                                    getMonsterAvatarPath(
                                        monsterNamesList[index])),
                              ),
                            ),
                          )),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    avatarButton(false),
                    const Spacer(),
                    avatarButton(true),
                  ],
                ),
              ],
            ),
          ),
        ));
  }

  GestureDetector avatarButton(bool save) {
    return GestureDetector(
        child: Container(
          width: 100,
          height: 50,
          margin: const EdgeInsets.symmetric(horizontal: 20),
          decoration: const BoxDecoration(
            color: Color(0xffa0522d),
            borderRadius: BorderRadius.all(Radius.elliptical(80, 80)),
          ),
          child: Center(
            child: Text(
              (save == false) ? "取消" : "確定",
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
        ),
        onTap: () {
          if (save == false) {
            Navigator.pop(context);
          } else {}
        });
  }
}
