import 'package:flutter/material.dart';
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
      child: RaisedButton(
        child: Text('解答之書'),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AnswerbookPage()));
        },
      ),
    );
  }
}
