// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, avoid_print, prefer_const_constructors_in_immutables, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:monsters_front_end/pages/annoyance.dart';
import 'package:monsters_front_end/pages/history.dart';
import 'package:monsters_front_end/pages/interaction.dart';
import 'package:monsters_front_end/pages/manual.dart';
import 'package:monsters_front_end/pages/social.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  //新增的浮出按鈕動畫用
  late AnimationController animationController;
  late Animation degOneTranslationAnimation;
  late Animation rotationAnimation;

  LocalStorage storage = LocalStorage('current_tab');

  double getRadiansFromDegree(double degree) {
    double unitRadian = 57.295779513;
    return degree / unitRadian;
  }

  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 250));
    degOneTranslationAnimation =
        Tween(begin: 0.0, end: 1.0).animate(animationController);
    rotationAnimation = Tween<double>(begin: 180.0, end: 0.0).animate(
        CurvedAnimation(parent: animationController, curve: Curves.easeOut));
    super.initState();
    animationController.addListener(() {
      setState(() {});
    });
  }

  final List<Widget> screens = [
    InteractionPage(),
    AnnoyancePage(),
    History(),
    Social(),
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = InteractionPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      // drawer: Drawer(
      //   child: ListView(
      //     padding: EdgeInsets.zero,
      //     children: <Widget>[
      //       DrawerTile(
      //         icon: Icon(Icons.person),
      //         text: "個人資料",
      //         onPressed: () {
      //           print("個人資料");
      //         },
      //       ),
      //       DrawerTile(
      //           icon: Icon(Icons.settings),
      //           text: "設定",
      //           onPressed: () {
      //             print("設定");
      //           }),
      //       DrawerTile(
      //           icon: Icon(Icons.info),
      //           text: "使用說明",
      //           onPressed: () {
      //             print("使用說明");
      //           }),
      //       DrawerTile(
      //           icon: Icon(Icons.thumb_up),
      //           text: "使用回饋",
      //           onPressed: () {
      //             print("使用回饋");
      //           }),
      //       DrawerTile(
      //         icon: Icon(Icons.power_settings_new),
      //         text: "登出",
      //         onPressed: () async {
      //           await showDialog(
      //             context: context,
      //             barrierDismissible: false,
      //             builder: (context) => AlertDialog(
      //               content: Text("Are you sure to exit current account"),
      //               actions: <Widget>[
      //                 TextButton(
      //                   child: Text("Cancel"),
      //                   onPressed: () => Navigator.pop(context),
      //                 ),
      //                 TextButton(
      //                   child: Text("Ok"),
      //                   onPressed: () => Navigator.pushNamedAndRemoveUntil(
      //                       context, "/login", ModalRoute.withName("/")),
      //                 ),
      //               ],
      //             ),
      //           );
      //         },
      //       ),
      //     ],
      //   ),
      // ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.transparent,
          onPressed: () {},
          child: Stack(
            children: <Widget>[
              Transform.translate(
                offset: Offset.fromDirection(getRadiansFromDegree(225),
                    degOneTranslationAnimation.value * 80),
                child: Transform(
                  transform: Matrix4.rotationZ(
                      getRadiansFromDegree(rotationAnimation.value))
                    ..scale(degOneTranslationAnimation.value),
                  alignment: Alignment.center,
                  child: CircularButton(
                    color: Colors.orangeAccent,
                    width: 70,
                    height: 70,
                    icon: Icon(
                      Icons.import_contacts,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => AnnoyancePage()));
                    }
                  ),
                ),
              ),
              Transform.translate(
                offset: Offset.fromDirection(getRadiansFromDegree(315),
                    degOneTranslationAnimation.value * 80),
                child: Transform(
                  transform: Matrix4.rotationZ(
                      getRadiansFromDegree(rotationAnimation.value))
                    ..scale(degOneTranslationAnimation.value),
                  alignment: Alignment.center,
                  child: CircularButton(
                    color: Colors.redAccent,
                    width: 70,
                    height: 70,
                    icon: Icon(
                      Icons.sentiment_dissatisfied,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
              Transform(
                transform: Matrix4.rotationZ(
                    getRadiansFromDegree(rotationAnimation.value)),
                alignment: Alignment.center,
                child: CircularButton(
                  color: Colors.blue,
                  width: 60,
                  height: 60,
                  icon: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    if (animationController.isCompleted) {
                      animationController.reverse();
                    } else {
                      animationController.forward();
                    }
                  },
                ),
              )
            ],
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = InteractionPage();
                        storage.setItem('current_tab', 0);
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.games,
                          color: storage.getItem('current_tab') == 0 ? Colors.blue : Colors.grey,
                        ),
                        Text(
                          '互動',
                          style: TextStyle(
                            color: storage.getItem('current_tab') == 0 ? Colors.blue : Colors.grey,
                          ),
                        )
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = AnnoyancePage();
                        storage.setItem('current_tab', 1);
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.book,
                          color: storage.getItem('current_tab') == 1 ? Colors.blue : Colors.grey,
                        ),
                        Text(
                          '圖鑑',
                          style: TextStyle(
                            color: storage.getItem('current_tab') == 1 ? Colors.blue : Colors.grey,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = History();
                        storage.setItem('current_tab', 2);
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.history,
                          color: storage.getItem('current_tab') == 2 ? Colors.blue : Colors.grey,
                        ),
                        Text(
                          '歷史紀錄',
                          style: TextStyle(
                            color: storage.getItem('current_tab') == 2 ? Colors.blue : Colors.grey,
                          ),
                        )
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = History();
                        storage.setItem('current_tab', 3);
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.social_distance_outlined,
                          color: storage.getItem('current_tab') == 3 ? Colors.blue : Colors.grey,
                        ),
                        Text(
                          '社交',
                          style: TextStyle(
                            color: storage.getItem('current_tab') == 3 ? Colors.blue : Colors.grey,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

// class DrawerTile extends StatelessWidget {
//   final Icon icon;
//   final String text;
//   final Function onPressed;

//   const DrawerTile(
//       {Key? key, required this.icon, this.text = "", required this.onPressed})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       title: Row(
//         children: <Widget>[
//           icon,
//           Text(text),
//           SizedBox(width: 24.0),
//         ],
//       ),
//       onTap: () => onPressed,
//     );
//   }
// }
class CircularButton extends StatelessWidget {
  final double width;
  final double height;
  final Color color;
  final Icon icon;
  final Function() onPressed;

  CircularButton({
    required this.color,
    required this.width,
    required this.height,
    required this.icon,
    required this.onPressed, 
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      width: width,
      height: height,
      child: IconButton(icon: icon, onPressed: onPressed, enableFeedback: true),
    );
  }
}
