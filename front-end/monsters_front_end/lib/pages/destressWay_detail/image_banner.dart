import 'package:flutter/material.dart';
import 'package:monsters_front_end/pages/style.dart';

class ImageBanner extends StatelessWidget {
  final String _assetsPath;
  ImageBanner(this._assetsPath);

  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: BoxConstraints.expand(
          height: 200.0,
        ),
        decoration: BoxDecoration(color: BackgroundColorLight),
        child: Image.asset(
          _assetsPath,
          fit: BoxFit.cover,
        ));
  }
}
