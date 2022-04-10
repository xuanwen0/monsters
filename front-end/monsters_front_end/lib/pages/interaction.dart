import 'package:flutter/material.dart';
import 'package:monsters_front_end/pages/psychologicial_game.dart';
import 'answerbook.dart';

class InteractionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _InteractionPage());
  }
}

class _InteractionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        RaisedButton(
          child: Text('解答之書'),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AnswerbookPage()));
          },
        ),
        RaisedButton(
          child: Text('心理小遊戲'),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => Psychologicial_game()));
          },
        ),
      ],
    ));
  }
}
