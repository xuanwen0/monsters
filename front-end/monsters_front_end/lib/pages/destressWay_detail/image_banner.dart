import 'package:flutter/material.dart';

class ImageBanner extends StatelessWidget {
  final String _assetsPath;
  const ImageBanner(this._assetsPath);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      constraints: const BoxConstraints.expand(
        height: 250.0,
      ),
      child: Image.asset(
        _assetsPath,
        fit: BoxFit.contain,
      ),
    );
  }
}
