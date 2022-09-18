import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:monsters_front_end/pages/destressWay_detail/image_banner.dart';
import '../style.dart';

class TextSection extends StatelessWidget {
  final String _originalText;
  static const double _hpad = 16;

  TextSection(this._originalText);

  @override
  Widget build(BuildContext context) {
    String textType =
        switchTextType(_originalText); //text or title or imagePath
    String text = convertText(_originalText, textType);
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [flexContainer(textType, text)],
    );
  }

  flexContainer(String textType, String text) {
    if (textType == "title") {
      return titleContainer(text);
    } else if (textType == "content") {
      return contentContainer(text);
    } else if (textType == "imagePath") {
      return imageContainer(text);
    }
    return null;
  }

  //設定標題段落
  titleContainer(String title) {
    return Container(
      padding: const EdgeInsets.fromLTRB(_hpad, 15.0, _hpad, 0.0),
      child: Text(
        title,
        style: TitleTextStyle,
      ),
    );
  }

  //設定文字段落
  contentContainer(String content) {
    return Container(
      padding: const EdgeInsets.fromLTRB(_hpad, 10.0, _hpad, _hpad),
      child: Text(
        content,
        style: Body1TextStyle,
        textAlign: TextAlign.justify,
      ),
    );
  }

  //設定圖片段落
  imageContainer(String image) {
    return ImageBanner("assets/image/destress_item/" + image);
  }

  String convertText(String text, String type) {
    if (type == "imagePath") return text;
    return text.substring(0, text.lastIndexOf("."));
  }

  String switchTextType(String getText) {
    if (getText.endsWith(".title")) {
      return "title";
    } else if (getText.endsWith(".content")) {
      return "content";
    } else if (getText.endsWith(".jpg") || getText.endsWith(".png")) {
      return "imagePath";
    }
    log("ERROR text_SECTION.dart.switchTextType");
    return "text_SECTION.dart -> switchTextType ERROR";
  }
}
