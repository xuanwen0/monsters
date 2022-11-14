import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:painter/painter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';

class Draw_mood extends StatefulWidget {
  @override
  _Draw_moodState createState() => _Draw_moodState();
}

class _Draw_moodState extends State<Draw_mood> {
  File? _paint;
  //bool _finished = false;
  PainterController _controller = _newController();
  ScreenshotController screenshotController = ScreenshotController();

  @override
  void initState() {
    super.initState();
  }

  static PainterController _newController() {
    PainterController controller = PainterController();
    controller.thickness = 5.0;
    controller.backgroundColor = Colors.white;
    return controller;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> actions;
    actions = <Widget>[
      IconButton(
          icon: const Icon(
            Icons.undo,
          ),
          tooltip: '返回上一畫',
          onPressed: () {
            if (_controller.isEmpty) {
              showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) => const Text('沒有上一畫了'));
            } else {
              _controller.undo();
            }
          }),
      IconButton(
          icon: const Icon(Icons.delete),
          tooltip: '清除畫板',
          onPressed: _controller.clear),
      IconButton(
        icon: const Icon(Icons.check),
        tooltip: '完成',
        onPressed: () {
          screenshotController.capture().then((capturedImage) async {
            _savedAndPush(capturedImage);
          }).catchError((onError) {
            print(onError);
          });
        },
      )
    ];
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 254, 195),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_rounded),
          color: Colors.white,
          iconSize: 35.0,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: Color.fromRGBO(160, 82, 45, 1),
        centerTitle: true,
        title: const Text(
          '畫心情',
          style: TextStyle(fontSize: 30.0),
        ),
        actions: actions,
      ),
      bottomNavigationBar: BottomAppBar(
        color: Color.fromRGBO(160, 82, 45, 1),
        child: DrawBar(_controller),
      ),
      body: Center(
          child: Screenshot(
              controller: screenshotController,
              child:
                  AspectRatio(aspectRatio: 1.0, child: Painter(_controller)))),
    );
  }

  _savedAndPush(image) async {
    final directory = (await getApplicationDocumentsDirectory()).path;
    String datetime = DateTime.now().toIso8601String() + '_MoodPaint';
    _paint = File('$directory/$datetime.png');
    _paint?.writeAsBytes(image);
    log("儲存至File");
    log("_paint = " + _paint.toString());

    Navigator.pop(context, _paint);
    final result = await ImageGallerySaver.saveImage(
      image,
      name: DateTime.now().toIso8601String() + ".png",
    );
    log("儲存至相簿");
  }
}

class DrawBar extends StatelessWidget {
  final PainterController _controller;

  DrawBar(this._controller);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Flexible(child: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
          return Container(
              height: 100.0,
              child: Slider(
                value: _controller.thickness,
                onChanged: (double value) => setState(() {
                  _controller.thickness = value;
                }),
                min: 1.0,
                max: 20.0,
                activeColor: Colors.white,
              ));
        })),
        StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
          return RotatedBox(
              quarterTurns: _controller.eraseMode ? 2 : 0,
              child: IconButton(
                  icon: const Icon(
                    Icons.create,
                    color: Colors.white,
                  ),
                  tooltip: (_controller.eraseMode ? '取消' : '開啟') + ' 橡皮擦模式',
                  onPressed: () {
                    setState(() {
                      _controller.eraseMode = !_controller.eraseMode;
                    });
                  }));
        }),
        ColorPickerButton(_controller, false),
        ColorPickerButton(_controller, true),
      ],
    );
  }
}

class ColorPickerButton extends StatefulWidget {
  final PainterController _controller;
  final bool _background;

  ColorPickerButton(this._controller, this._background);

  @override
  _ColorPickerButtonState createState() => _ColorPickerButtonState();
}

class _ColorPickerButtonState extends State<ColorPickerButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Icon(_iconData, color: _color),
        tooltip: widget._background ? '更換畫板顏色' : '更換畫筆顏色',
        onPressed: _pickColor);
  }

  void _pickColor() {
    Color pickerColor = _color;
    Navigator.of(context)
        .push(MaterialPageRoute(
            fullscreenDialog: true,
            builder: (BuildContext context) {
              return Scaffold(
                  appBar: AppBar(
                    title: const Text('選顏色'),
                  ),
                  body: Container(
                      alignment: Alignment.center,
                      child: ColorPicker(
                        pickerColor: pickerColor,
                        onColorChanged: (Color c) => pickerColor = c,
                      )));
            }))
        .then((_) {
      setState(() {
        _color = pickerColor;
      });
    });
  }

  Color get _color => widget._background
      ? widget._controller.backgroundColor
      : widget._controller.drawColor;

  IconData get _iconData =>
      widget._background ? Icons.format_color_fill : Icons.color_lens;

  set _color(Color color) {
    if (widget._background) {
      widget._controller.backgroundColor = color;
    } else {
      widget._controller.drawColor = color;
    }
  }
}
