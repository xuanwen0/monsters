import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:monsters_front_end/pages/lock/setting_lock_page.dart';
import 'package:monsters_front_end/pages/style.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Drawer_settings extends StatefulWidget {
  Drawer_settings({
    Key? key,
  }) : super(key: key);
  @override
  _Drawer_settingsState createState() => _Drawer_settingsState();
}

bool lock = false;

class _Drawer_settingsState extends State<Drawer_settings> {
  bool notice = false;
  bool music = false;
  @override
  void initState() {
    checkLock();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffffed4),
      body: Stack(
        children: <Widget>[
          Pinned.fromPins(
            Pin(start: 0.0, end: 0.0),
            Pin(size: 546.0, start: 101.0),
            child: Container(
              color: const Color(0xffffffff),
            ),
          ),
          //上一頁
          Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                icon: Icon(Icons.arrow_back_rounded),
                color: Color.fromRGBO(255, 187, 0, 1),
                iconSize: 57.0,
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )),
          //標題
          Pinned.fromPins(
            Pin(size: 94.0, middle: 0.5),
            Pin(size: 63.0, start: 11.0),
            child: Text(
              '設定',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 47,
                color: const Color(0xffa0522d),
              ),
              softWrap: false,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //通知
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  const Text(
                    '通知',
                    style: TextStyle(
                      fontFamily: 'Segoe UI',
                      fontSize: 40,
                      color: Color(0xffa0522d),
                    ),
                    softWrap: false,
                  ),
                  FlutterSwitch(
                    activeColor: const Color.fromRGBO(255, 187, 0, 1),
                    activeTextColor: BackgroundColorLight,
                    width: 125.0,
                    height: 45.0,
                    valueFontSize: 20.0,
                    toggleSize: 45.0,
                    value: notice,
                    borderRadius: 30.0,
                    padding: 8.0,
                    showOnOff: true,
                    onToggle: (val) {
                      setState(() {
                        notice = val;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: 20),
              //鎖定
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  const Text(
                    '鎖定',
                    style: TextStyle(
                      fontFamily: 'Segoe UI',
                      fontSize: 40,
                      color: Color(0xffa0522d),
                    ),
                    softWrap: false,
                  ),
                  FlutterSwitch(
                    activeColor: Color.fromRGBO(255, 187, 0, 1),
                    activeTextColor: BackgroundColorLight,
                    width: 125.0,
                    height: 45.0,
                    valueFontSize: 20.0,
                    toggleSize: 45.0,
                    value: lock,
                    borderRadius: 30.0,
                    padding: 8.0,
                    showOnOff: true,
                    onToggle: (val) {
                      setState(() {
                        lock = val;
                        if (lock == true) {
                          print('開啟密碼鎖');
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SettingLockPage()));
                        } else {
                          print('關閉密碼鎖');
                          saveLock('false');
                        }
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: 20),
              //音樂
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  const Text(
                    '音樂',
                    style: TextStyle(
                      fontFamily: 'Segoe UI',
                      fontSize: 40,
                      color: Color(0xffa0522d),
                    ),
                    softWrap: false,
                  ),
                  FlutterSwitch(
                    activeColor: Color.fromRGBO(255, 187, 0, 1),
                    activeTextColor: BackgroundColorLight,
                    width: 125.0,
                    height: 45.0,
                    valueFontSize: 20.0,
                    toggleSize: 45.0,
                    value: music,
                    borderRadius: 30.0,
                    padding: 8.0,
                    showOnOff: true,
                    onToggle: (val) {
                      setState(() {
                        music = val;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: 20),
              //顏色
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const <Widget>[
                  Text(
                    '顏色',
                    style: TextStyle(
                      fontFamily: 'Segoe UI',
                      fontSize: 40,
                      color: Color(0xffa0522d),
                    ),
                    softWrap: false,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const <Widget>[
                  Text(
                    '音樂',
                    style: TextStyle(
                      fontFamily: 'Segoe UI',
                      fontSize: 40,
                      color: Color(0xffa0522d),
                    ),
                    softWrap: false,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

void saveLock(String lock) async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  await pref.setString("lock", lock);
}

void checkLock() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  String? val = pref.getString("lock");
  if (val == 'true') {
    lock = true;
  } else {
    lock = false;
  }
}
