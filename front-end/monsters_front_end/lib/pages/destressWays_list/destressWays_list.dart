import 'package:flutter/material.dart';
import 'package:monsters_front_end/main.dart';
import 'package:monsters_front_end/model/destress_model/destressWay.dart';
import 'package:monsters_front_end/pages/destressWay_detail/destressWay_detail.dart';
import 'package:monsters_front_end/routes.dart';

class DestressWaysList extends StatelessWidget {
  final destressWay = DestressWay.fetchAll();

  DestressWaysList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("紓壓方式"),
      ),
      body: ListView(
        children: destressWay
            .map((way) => GestureDetector(
                  child: Text(way.name),
                  onTap: () => _onDestressWayTap(context, way.id),
                ))
            .toList(),
      ),
    );
  }
}

_onDestressWayTap(BuildContext context, int destressWayID) {
  Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => DestressWayDetail(destressWayID)));
}
