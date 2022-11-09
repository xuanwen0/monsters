import 'package:flutter/material.dart';
import 'package:monsters_front_end/model/destressWayModel.dart';
import 'package:monsters_front_end/pages/destressWay_detail/destressWay_detail.dart';
import 'package:monsters_front_end/pages/style.dart';

class DestressWaysList extends StatelessWidget {
  final destressWays = DestressWay.fetchAll();

  DestressWaysList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: BackgroundColorLight,
        appBar: secondAppBar("紓壓方法"),
        body: Container(
          margin: EdgeInsets.fromLTRB(5, 5, 10, 20),
          alignment: Alignment.topCenter,
          child: ListView(
              children: destressWays
                  .map((destressWay) => Container(
                        margin: EdgeInsets.only(top: 20),
                        child: GestureDetector(
                          child: Row(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                //left block
                                Expanded(
                                  flex: 3,
                                  child: SizedBox(),
                                ),
                                //left image section
                                Expanded(
                                    flex: 32,
                                    child: Container(
                                        height: 120,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(
                                              width: 3,
                                              color: BackgroundColorWarm),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: imageContainer(
                                            destressWay.imagePath))),
                                //middle block
                                Expanded(
                                  flex: 5,
                                  child: SizedBox(),
                                ),
                                //right section
                                Expanded(
                                    flex: 60,
                                    child: Container(
                                        height: 120,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              flex: 4,
                                              child: Container(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Text(
                                                    destressWay.name,
                                                    style: TextStyle(
                                                        color:
                                                            BackgroundColorWarm,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize:
                                                            mediumTextSize,
                                                        height: 1),
                                                  )),
                                            ),
                                            Expanded(
                                                flex: 6,
                                                child: Container(
                                                    alignment:
                                                        Alignment.topLeft,
                                                    child: Text(
                                                      destressWay.intro,
                                                      style: TextStyle(
                                                          // color:
                                                          //     BackgroundColorWarm,
                                                          color: Colors.black,
                                                          fontSize:
                                                              contentTextSize),
                                                    ))),
                                          ],
                                        ))),
                              ]),
                          onTap: () =>
                              _onDestressWayTap(context, destressWay.id),
                        ),
                      ))
                  .toList()),
        ));
  }
}

Container imageContainer(String image) {
  Container imageBox = Container(
    alignment: Alignment.center,
    child: ClipRRect(
      child: Image.asset(
        image,
        height: 100,
        fit: BoxFit.fill,
        //TODO: Level 1
        //加上邊緣留白+ 圓形框 + 圓形框留白
        alignment: Alignment.center,
      ),
    ),
  );
  return imageBox;
}

Container textContainer(List destressWay) {
  Container textBox;

  textBox = Container(
      alignment: Alignment.topCenter,
      child: Expanded(
          flex: 2,
          child: Column(
            children: [
              Expanded(
                  flex: 3,
                  child: Container(
                      alignment: Alignment.centerLeft, child: Text("title1"))),
              Expanded(
                  flex: 7,
                  child: Container(
                      alignment: Alignment.centerLeft, child: Text("content"))),
            ],
          )));
  return textBox;
}

_onDestressWayTap(BuildContext context, int destressWayID) {
  Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => DestressWayDetail(destressWayID)));
}
