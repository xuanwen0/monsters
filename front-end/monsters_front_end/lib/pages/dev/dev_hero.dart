import 'package:flutter/material.dart';
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
          child: Hero(
              tag: 'Avatar_change',
              child: GestureDetector(
                child: Container(
                  height: 200,
                  color: Colors.red,
                ),
                onTap: () => changeAvatar(context),
              )),
        ));
  }

  Future changeAvatar(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        int itemCounter = 5;
        return Center(
          child: Container(
            height: 300,
            width: MediaQuery.of(context).size.width * 0.7,
            decoration: BoxDecoration(
              color: BackgroundColorLight,
              border: Border.all(width: 5, color: BackgroundColorWarm),
              borderRadius: BorderRadius.circular(22.0),
            ),
            child: GridView(
              padding: const EdgeInsets.all(10),
              scrollDirection: Axis.vertical,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4, mainAxisSpacing: 5, crossAxisSpacing: 5),
              children: List.generate(
                itemCounter,
                ((index) => Container(
                      alignment: Alignment.center,
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: BackgroundColorLight,
                        borderRadius: const BorderRadius.all(
                            Radius.elliptical(9999.0, 9999.0)),
                        border: Border.all(
                            width: 2, color: const Color(0xffa0522d)),
                      ),
                      child: const CircleAvatar(
                        minRadius: 30,
                        backgroundImage: AssetImage(
                            'assets/image/Avatar/Avatar_Baku_JPG.jpg'),
                      ),
                    )),
              ),
            ),
          ),
        );
      },
    );
  }
}
