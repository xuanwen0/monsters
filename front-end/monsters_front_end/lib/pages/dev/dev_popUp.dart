import 'package:flutter/material.dart';
import 'package:monsters_front_end/pages/monsters_information.dart';
import 'package:monsters_front_end/pages/drawer_personalInfo.dart';
import 'package:monsters_front_end/pages/style.dart';

class dev_popUp extends StatefulWidget {
  const dev_popUp({Key? key}) : super(key: key);

  @override
  State<dev_popUp> createState() => _dev_popUpState();
}

class _dev_popUpState extends State<dev_popUp> {
  //異步處理
  late Future _future;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: secondAppBar("dev_popUp"),
        body: Center(
          child: GestureDetector(
              child: Container(
                height: 100,
                width: 100,
                color: Colors.red,
              ),
              onTap: () {
                popUp(context);
                setState(() {});
              }),
        ));
  }

  Future<dynamic> popUp(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        // return const EatingWidget();
        return const PresentWidget();
      },
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }
}

class EatingWidget extends StatefulWidget {
  const EatingWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _EatingWidget();
  }
}

class _EatingWidget extends State<EatingWidget> {
  String present_name = getRandomMonsterName_CH();
  @override
  Widget build(BuildContext context) {
    return Material(
        type: MaterialType.transparency,
        child: Center(
          child: Container(
            height: 180,
            width: MediaQuery.of(context).size.width * 0.8,
            decoration: BoxDecoration(
              color: BackgroundColorLight,
              border: Border.all(width: 5, color: BackgroundColorWarm),
              borderRadius: BorderRadius.circular(22.0),
            ),
            child: Container(
              height: 180,
              alignment: Alignment.topCenter,
              width: MediaQuery.of(context).size.width * 0.7,
              decoration: const BoxDecoration(
                color: BackgroundColorLight,
              ),
              child: Center(
                child: Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  height: 160,
                  width: MediaQuery.of(context).size.width * 0.45,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/image/present.png'),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}

class PresentWidget extends StatefulWidget {
  const PresentWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _PresentWidget();
  }
}

class _PresentWidget extends State<PresentWidget> {
  String present_name = getRandomMonsterName_CH();
  @override
  Widget build(BuildContext context) {
    return Material(
        type: MaterialType.transparency,
        child: Center(
          child: Container(
            height: 420,
            width: MediaQuery.of(context).size.width * 0.8,
            decoration: BoxDecoration(
              color: BackgroundColorLight,
              border: Border.all(width: 5, color: BackgroundColorWarm),
              borderRadius: BorderRadius.circular(22.0),
            ),
            child: Column(
              children: [
                Container(
                  height: 220,
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width * 0.7,
                  decoration: const BoxDecoration(
                    color: BackgroundColorLight,
                  ),
                  child: Center(
                    child: Container(
                      height: 220,
                      width: MediaQuery.of(context).size.width * 0.45,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/image/present.png'),
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    ),
                  ),
                ),
                Text(
                  "恭喜你獲得一隻怪獸！ \n",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: BackgroundColorWarm, fontSize: 20),
                ),
                Text(
                  "${present_name}",
                  style: TextStyle(
                      color: BackgroundColorWarm,
                      fontSize: 30,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  children: [
                    Container(
                      width: 105,
                      height: 45,
                      margin: EdgeInsets.only(
                        left: 30,
                        bottom: 3,
                      ),
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                          color: BackgroundColorWarm,
                          border:
                              Border.all(color: BackgroundColorWarm, width: 2),
                          borderRadius:
                              BorderRadius.all(Radius.circular(50.0))),
                      child: Center(
                        child: Text(
                          "查看圖鑑",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                    ),
                    Spacer(),
                    Container(
                      width: 105,
                      height: 45,
                      margin: EdgeInsets.only(
                        right: 30,
                        bottom: 3,
                      ),
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                          color: BackgroundColorWarm,
                          border:
                              Border.all(color: BackgroundColorWarm, width: 2),
                          borderRadius:
                              BorderRadius.all(Radius.circular(50.0))),
                      child: Center(
                        child: Text(
                          "謝謝",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
