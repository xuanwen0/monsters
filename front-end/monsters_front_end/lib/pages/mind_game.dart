import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:monsters_front_end/pages/style.dart';
import 'package:monsters_front_end/repository/mindGameRepo.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../model/mindGameModel.dart';

class Psychologicial_game extends StatefulWidget {
  @override
  _Psychologicial_gameState createState() => _Psychologicial_gameState();
}

class _Psychologicial_gameState extends State<Psychologicial_game> {
  //異步處理
  late Future _future;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    _future = getMindGames();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    return Scaffold(
        backgroundColor: const Color(0xfffffed4),
        appBar: secondAppBar("心理小遊戲"),
        body: FutureBuilder<dynamic>(
            future: _future,
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.data == null) {
                return const Center(
                    child: Text(
                  "Loading...",
                  style: TextStyle(fontSize: 30),
                ));
              }
              return ListView.builder(
                itemCount: snapshot.data["itemCounter"],
                itemBuilder: (BuildContext context, int index) => Container(
                  decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                      width: 1.0,
                      color: BackgroundColorWarm,
                    )),
                  ),
                  height: 110,
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: 280,
                    child: ListTile(
                        title: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            color: const Color(0xffffffff),
                            borderRadius: BorderRadius.circular(23.0),
                            border: Border.all(
                                width: 1.0, color: const Color(0xffa0522d)),
                          ),
                          child: Center(
                            child: Text(
                              snapshot.data["result $index"]["name"],
                              style: const TextStyle(fontSize: BodyTextSize),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        onTap: () => launchUrlString(
                            snapshot.data["result $index"]["web"])),
                  ),
                ),
              );
            }));
  }

  Future<Map> getMindGames() async {
    Map socialResult = {};
    final MindGameRepository mindGameRepository = MindGameRepository();
    Future<Data> mindGames = mindGameRepository
        .searchMindGame()
        .then((value) => Data.fromJson(value!));
    await mindGames.then((value) async {
      await socialResult.putIfAbsent(
        "itemCounter",
        () => value.data.length,
      );
      for (int index = 0; index < value.data.length; index++) {
        socialResult.putIfAbsent(
          "result $index",
          () => {
            'id': value.data.elementAt(index).id,
            'name': value.data.elementAt(index).name,
            'web': value.data.elementAt(index).web,
          },
        );
      }
    });

    return socialResult;
  }
}

const String _svg_ryq30 =
    '<svg viewBox="13.7 21.9 45.6 41.1" ><path transform="translate(8.07, 15.61)" d="M 47.28736877441406 22.92952919006348 L 19.54702568054199 22.92952919006348 L 30.30613327026367 13.09178352355957 C 31.84870529174805 11.54302215576172 31.84870529174805 9.040220260620117 30.30613327026367 7.491456031799316 C 28.76356315612793 5.942692756652832 26.26174545288086 5.942692756652832 24.70621109008789 7.491456031799316 L 6.791648864746094 24.09420013427734 C 6.013882637023926 24.81282615661621 5.624999046325684 25.79164695739746 5.624999046325684 26.86958694458008 L 5.624999046325684 26.91914939880371 C 5.624999046325684 27.99708938598633 6.013882637023926 28.97590446472168 6.791648864746094 29.69453430175781 L 24.69325065612793 46.29727935791016 C 26.24878120422363 47.84604263305664 28.75060272216797 47.84604263305664 30.29317092895508 46.29727935791016 C 31.83573913574219 44.74851226806641 31.83573913574219 42.2457160949707 30.29317092895508 40.69694900512695 L 19.5340633392334 30.85920524597168 L 47.27440643310547 30.85920524597168 C 49.46512222290039 30.85920524597168 51.24102020263672 29.08742141723633 51.24102020263672 26.89437294006348 C 51.25398254394531 24.66414642333984 49.47808074951172 22.92952919006348 47.28736877441406 22.92952919006348 Z" fill="#ffbb00" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
