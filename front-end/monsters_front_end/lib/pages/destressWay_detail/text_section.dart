import 'package:flutter/material.dart';
import '../style.dart';

class TextSection extends StatelessWidget {
  final String _title;
  final String _body;
  static const double _hpad = 16.0;

  TextSection(this._title, this._body);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(_hpad, 32.0, _hpad, 4.0),
          child: Text(
            _title,
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(_hpad, 10.0, _hpad, _hpad),
          child: Text(
            _body,
            style: Body1TextStyle,
          ),
        ),
      ],
    );
  }
}
