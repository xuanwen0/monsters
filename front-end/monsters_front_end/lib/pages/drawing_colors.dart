import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Drawing_colors extends StatefulWidget {
  Drawing_colors({
    Key? key,
  }) : super(key: key);

  @override
  _Drawing_colorsState createState() => _Drawing_colorsState();
}

class _Drawing_colorsState extends State<Drawing_colors> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 254, 212, 1),
      body: Stack(
        children: <Widget>[
          Pinned.fromPins(
            Pin(size: 141.0, middle: 0.5314),
            Pin(size: 63.0, start: 11.0),
            child: const Text(
              '畫心情',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 47,
                color: Color.fromRGBO(160, 82, 45, 1),
              ),
              softWrap: false,
            ),
          ),
          //圖框
          Pinned.fromPins(
            Pin(start: 41.0, end: 40.0),
            Pin(size: 403.0, middle: 0.3227),
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromRGBO(255, 255, 255, 1),
                borderRadius: BorderRadius.circular(22.0),
                border: Border.all(
                    width: 1.0, color: Color.fromRGBO(160, 82, 45, 1)),
              ),
            ),
          ),
          //箭頭
          Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                icon: Icon(Icons.arrow_back_rounded),
                color: Color.fromRGBO(255, 187, 0, 1),
                iconSize: 57.0,
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )),
          //工具列
          Pinned.fromPins(
            Pin(start: 21.0, end: 21.0),
            Pin(size: 55.0, middle: 0.7663),
            child: Stack(
              children: <Widget>[
                //皮擦
                Pinned.fromPins(
                  Pin(size: 58.0, middle: 0.25),
                  Pin(start: 0.0, end: 0.0),
                  child: Stack(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(255, 255, 255, 1),
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                              width: 1.0,
                              color: Color.fromRGBO(160, 82, 45, 1)),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 11.0, vertical: 12.0),
                        child: SizedBox.expand(
                            child:
                                // Adobe XD layer: 'Icon awesome-eraser' (shape)
                                SvgPicture.string(
                          _svg_xbfprn,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        )),
                      ),
                    ],
                  ),
                ),
                //完成
                Pinned.fromPins(
                  Pin(size: 58.0, end: 0.0),
                  Pin(start: 0.0, end: 0.0),
                  child: Stack(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(255, 255, 255, 1),
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                              width: 1.0,
                              color: Color.fromRGBO(160, 82, 45, 1)),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: IconButton(
                          icon: Icon(Icons.check_circle_rounded),
                          color: Color.fromRGBO(160, 82, 45, 1),
                          iconSize: 40.0,
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                //色盤
                Pinned.fromPins(
                  Pin(size: 58.0, middle: 0.5),
                  Pin(start: 0.0, end: 0.0),
                  child: Stack(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(255, 255, 255, 1),
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                              width: 1.0,
                              color: Color.fromRGBO(160, 82, 45, 1)),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(10.0, 9.0, 10.4, 9.7),
                        child: SizedBox.expand(
                            child:
                                // Adobe XD layer: 'Icon ionic-md-color…' (shape)
                                SvgPicture.string(
                          _svg_nv97e,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        )),
                      ),
                    ],
                  ),
                ),
                //色筆
                Pinned.fromPins(
                  Pin(size: 58.0, middle: 0.75),
                  Pin(start: 0.0, end: 0.0),
                  child: Stack(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(255, 255, 255, 1),
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                              width: 1.0,
                              color: Color.fromRGBO(160, 82, 45, 1)),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(11.0, 10.0, 11.0, 9.0),
                        child: SizedBox.expand(
                            child:
                                // Adobe XD layer: 'Icon awesome-paint-…' (shape)
                                SvgPicture.string(
                          _svg_a48wow,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        )),
                      ),
                    ],
                  ),
                ),
                //返回
                Pinned.fromPins(
                  Pin(size: 58.0, start: 0.0),
                  Pin(start: 0.0, end: 0.0),
                  child: Stack(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(255, 255, 255, 1),
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                              width: 1.0,
                              color: Color.fromRGBO(160, 82, 45, 1)),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 29.0, middle: 0.5172),
                        Pin(start: 13.0, end: 13.0),
                        child:
                            // Adobe XD layer: 'redo-alt-free-icon-…' (shape)
                            Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: const AssetImage(
                                  'assets/image/drawing_arrow.png'),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          //顏色
          Pinned.fromPins(
            Pin(start: 0.0, end: 0.0),
            Pin(size: 140.0, end: 0.0),
            child: Container(
              color: Color.fromRGBO(255, 255, 255, 1),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 44.0, start: 28.0),
            Pin(size: 45.0, end: 81.0),
            child: SvgPicture.string(
              _svg_ytqwu8,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 44.0, middle: 0.25),
            Pin(size: 45.0, end: 81.0),
            child: SvgPicture.string(
              _svg_b33q3t,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 44.0, middle: 0.4239),
            Pin(size: 45.0, end: 81.0),
            child: SvgPicture.string(
              _svg_a4wf6c,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 44.0, middle: 0.5978),
            Pin(size: 45.0, end: 81.0),
            child: SvgPicture.string(
              _svg_w0kagc,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 44.0, middle: 0.7717),
            Pin(size: 45.0, end: 81.0),
            child: SvgPicture.string(
              _svg_i9i38,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 44.0, end: 20.0),
            Pin(size: 45.0, end: 81.0),
            child: SvgPicture.string(
              _svg_okdu4f,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 44.0, start: 28.0),
            Pin(size: 45.0, end: 16.0),
            child: SvgPicture.string(
              _svg_gxyvb5,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 44.0, middle: 0.25),
            Pin(size: 45.0, end: 16.0),
            child: SvgPicture.string(
              _svg_ddysa,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 44.0, middle: 0.4239),
            Pin(size: 45.0, end: 16.0),
            child: SvgPicture.string(
              _svg_wj8ouw,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 44.0, middle: 0.5978),
            Pin(size: 45.0, end: 16.0),
            child: SvgPicture.string(
              _svg_esfckm,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 44.0, middle: 0.7717),
            Pin(size: 45.0, end: 16.0),
            child: SvgPicture.string(
              _svg_ewbs,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 44.0, end: 20.0),
            Pin(size: 45.0, end: 16.0),
            child: SvgPicture.string(
              _svg_mogb6o,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
    );
  }
}

const String _svg_xbfprn =
    '<svg viewBox="112.0 579.0 36.0 31.5" ><path transform="translate(112.0, 576.75)" d="M 35.01147842407227 19.26147651672363 C 36.32948684692383 17.94346809387207 36.32948684692383 15.80653095245361 35.01147842407227 14.48852348327637 L 23.76147842407227 3.238523483276367 C 22.4434700012207 1.920515656471252 20.30660247802734 1.920445322990417 18.98845481872559 3.238523483276367 L 0.9884548187255859 21.23852348327637 C -0.3295530080795288 22.55653190612793 -0.3295530080795288 24.69346809387207 0.9884548187255859 26.01147651672363 L 7.738454818725586 32.761474609375 C 8.371419906616211 33.39440155029297 9.229878425598145 33.74998474121094 10.125 33.75 L 35.15625 33.75 C 35.62221145629883 33.75 36 33.37221145629883 36 32.90625 L 36 30.09375 C 36 29.62778854370117 35.62221145629883 29.25 35.15625 29.25 L 25.02302360534668 29.25 L 35.011474609375 19.26147651672363 Z M 13.73301696777344 14.8580150604248 L 23.39205551147461 24.51705551147461 L 18.65903854370117 29.25 L 10.59103107452393 29.25 L 4.966031074523926 23.625 L 13.7330150604248 14.85801601409912 Z" fill="#a0522d" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_nv97e =
    '<svg viewBox="189.0 576.0 37.6 36.3" ><path transform="translate(184.5, 571.5)" d="M 23.32318115234375 4.5 C 12.97052955627441 4.5 4.499999523162842 12.67342758178711 4.499999523162842 22.6629638671875 C 4.499999523162842 32.65297317504883 12.97052955627441 40.82592391967773 23.32318115234375 40.82592391967773 C 25.10119247436523 40.82592391967773 26.46038055419922 39.51440811157227 26.46038055419922 37.79876327514648 C 26.46038055419922 36.99174118041992 26.1468563079834 36.28518295288086 25.6240234375 35.78068923950195 C 25.10118865966797 35.27609634399414 24.78766441345215 34.56954193115234 24.78766441345215 33.76251602172852 C 24.78766441345215 32.04697036743164 26.14685440063477 30.73535919189453 27.92486190795898 30.73535919189453 L 31.68910980224609 30.73535919189453 C 37.4406623840332 30.73535919189453 42.14646148681641 26.19461822509766 42.14646148681641 20.64488792419434 C 42.1463623046875 11.7653751373291 33.67632675170898 4.5 23.32318115234375 4.5 Z M 11.82015991210938 22.6629638671875 C 10.04215240478516 22.6629638671875 8.682961463928223 21.35144996643066 8.682961463928223 19.63580322265625 C 8.682961463928223 17.9201602935791 10.04215240478516 16.608642578125 11.82015991210938 16.608642578125 C 13.59806728363037 16.608642578125 14.95735645294189 17.9201602935791 14.95735645294189 19.63580322265625 C 14.95735645294189 21.35144996643066 13.59806728363037 22.6629638671875 11.82015991210938 22.6629638671875 Z M 18.09455490112305 14.59056854248047 C 16.31654739379883 14.59056854248047 14.95735645294189 13.27895545959473 14.95735645294189 11.56340599060059 C 14.95735645294189 9.847763061523438 16.31654739379883 8.536245346069336 18.09455490112305 8.536245346069336 C 19.87246322631836 8.536245346069336 21.23175048828125 9.847763061523438 21.23175048828125 11.56340599060059 C 21.23175048828125 13.27895545959473 19.87246322631836 14.59056854248047 18.09455490112305 14.59056854248047 Z M 28.55181312561035 14.59056854248047 C 26.77390289306641 14.59056854248047 25.41461753845215 13.27895545959473 25.41461753845215 11.56340599060059 C 25.41461753845215 9.847763061523438 26.77390289306641 8.536245346069336 28.55181312561035 8.536245346069336 C 30.32982063293457 8.536245346069336 31.68901062011719 9.847763061523438 31.68901062011719 11.56340599060059 C 31.68901062011719 13.27895545959473 30.32981872558594 14.59056854248047 28.55181312561035 14.59056854248047 Z M 34.82620620727539 22.6629638671875 C 33.04829788208008 22.6629638671875 31.68901062011719 21.35144996643066 31.68901062011719 19.63580322265625 C 31.68901062011719 17.9201602935791 33.04829788208008 16.608642578125 34.82620620727539 16.608642578125 C 36.60421371459961 16.608642578125 37.96340179443359 17.9201602935791 37.96340179443359 19.63580322265625 C 37.96340179443359 21.35144996643066 36.60420989990234 22.6629638671875 34.82620620727539 22.6629638671875 Z" fill="#a0522d" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_a48wow =
    '<svg viewBox="268.0 577.0 36.0 36.0" ><path transform="translate(268.0, 577.0)" d="M 11.7435941696167 21.75046920776367 C 8.922657012939453 21.93187522888184 6.362578392028809 23.00625038146973 4.909922122955322 26.83406257629395 C 4.744687557220459 27.27070236206055 4.347422122955322 27.53578186035156 3.884062767028809 27.53578186035156 C 3.102890968322754 27.53578186035156 0.6876564025878906 25.59023475646973 -0.0007028579711914062 25.12054824829102 C 0 30.91078186035156 2.666953086853027 36 9 36 C 14.33390617370605 36 18 32.92242050170898 18 27.54914093017578 C 18 27.33046913146973 17.95429611206055 27.12164115905762 17.93179702758789 26.90718841552734 L 11.74359321594238 21.75046920776367 Z M 32.19538879394531 0 C 31.12945175170898 0 30.13031005859375 0.4717968702316284 29.36812210083008 1.156640648841858 C 14.9955472946167 13.99570274353027 13.5 14.29734420776367 13.5 18.07664108276367 C 13.5 19.0399227142334 13.728515625 19.95820426940918 14.1138277053833 20.7977352142334 L 18.60117149353027 24.53695297241211 C 19.10812377929688 24.66351509094238 19.63054656982422 24.75 20.17546844482422 24.75 C 24.54257774353027 24.75 27.07382774353027 21.55289077758789 35.02265548706055 6.717657089233398 C 35.54156112670898 5.708672523498535 36 4.618828773498535 36 3.483985185623169 C 36 1.451249957084656 34.171875 0 32.19538879394531 0 Z" fill="#a0522d" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_ytqwu8 =
    '<svg viewBox="28.0 652.0 44.0 45.0" ><path transform="translate(28.0, 652.0)" d="M 22 0 C 34.15026473999023 0 44 10.07359409332275 44 22.5 C 44 34.92640686035156 34.15026473999023 45 22 45 C 9.849736213684082 45 0 34.92640686035156 0 22.5 C 0 10.07359409332275 9.849736213684082 0 22 0 Z" fill="#ff3333" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_b33q3t =
    '<svg viewBox="92.0 652.0 44.0 45.0" ><path transform="translate(92.0, 652.0)" d="M 22 0 C 34.15026473999023 0 44 10.07359409332275 44 22.5 C 44 34.92640686035156 34.15026473999023 45 22 45 C 9.849736213684082 45 0 34.92640686035156 0 22.5 C 0 10.07359409332275 9.849736213684082 0 22 0 Z" fill="#cd853f" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_a4wf6c =
    '<svg viewBox="156.0 652.0 44.0 45.0" ><path transform="translate(156.0, 652.0)" d="M 22 0 C 34.15026473999023 0 44 10.07359409332275 44 22.5 C 44 34.92640686035156 34.15026473999023 45 22 45 C 9.849736213684082 45 0 34.92640686035156 0 22.5 C 0 10.07359409332275 9.849736213684082 0 22 0 Z" fill="#ff8800" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_w0kagc =
    '<svg viewBox="220.0 652.0 44.0 45.0" ><path transform="translate(220.0, 652.0)" d="M 22 0 C 34.15026473999023 0 44 10.07359409332275 44 22.5 C 44 34.92640686035156 34.15026473999023 45 22 45 C 9.849736213684082 45 0 34.92640686035156 0 22.5 C 0 10.07359409332275 9.849736213684082 0 22 0 Z" fill="#ffdd55" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_i9i38 =
    '<svg viewBox="284.0 652.0 44.0 45.0" ><path transform="translate(284.0, 652.0)" d="M 22 0 C 34.15026473999023 0 44 10.07359409332275 44 22.5 C 44 34.92640686035156 34.15026473999023 45 22 45 C 9.849736213684082 45 0 34.92640686035156 0 22.5 C 0 10.07359409332275 9.849736213684082 0 22 0 Z" fill="#ff8888" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_okdu4f =
    '<svg viewBox="348.0 652.0 44.0 45.0" ><path transform="translate(348.0, 652.0)" d="M 22 0 C 34.15026473999023 0 44 10.07359409332275 44 22.5 C 44 34.92640686035156 34.15026473999023 45 22 45 C 9.849736213684082 45 0 34.92640686035156 0 22.5 C 0 10.07359409332275 9.849736213684082 0 22 0 Z" fill="#ffa488" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_gxyvb5 =
    '<svg viewBox="28.0 717.0 44.0 45.0" ><path transform="translate(28.0, 717.0)" d="M 22 0 C 34.15026473999023 0 44 10.07359409332275 44 22.5 C 44 34.92640686035156 34.15026473999023 45 22 45 C 9.849736213684082 45 0 34.92640686035156 0 22.5 C 0 10.07359409332275 9.849736213684082 0 22 0 Z" fill="#66cdaa" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_ddysa =
    '<svg viewBox="92.0 717.0 44.0 45.0" ><path transform="translate(92.0, 717.0)" d="M 22 0 C 34.15026473999023 0 44 10.07359409332275 44 22.5 C 44 34.92640686035156 34.15026473999023 45 22 45 C 9.849736213684082 45 0 34.92640686035156 0 22.5 C 0 10.07359409332275 9.849736213684082 0 22 0 Z" fill="#99ff99" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_wj8ouw =
    '<svg viewBox="156.0 717.0 44.0 45.0" ><path transform="translate(156.0, 717.0)" d="M 22 0 C 34.15026473999023 0 44 10.07359409332275 44 22.5 C 44 34.92640686035156 34.15026473999023 45 22 45 C 9.849736213684082 45 0 34.92640686035156 0 22.5 C 0 10.07359409332275 9.849736213684082 0 22 0 Z" fill="#99bbff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_esfckm =
    '<svg viewBox="220.0 717.0 44.0 45.0" ><path transform="translate(220.0, 717.0)" d="M 22 0 C 34.15026473999023 0 44 10.07359409332275 44 22.5 C 44 34.92640686035156 34.15026473999023 45 22 45 C 9.849736213684082 45 0 34.92640686035156 0 22.5 C 0 10.07359409332275 9.849736213684082 0 22 0 Z" fill="#b088ff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_ewbs =
    '<svg viewBox="284.0 717.0 44.0 45.0" ><path transform="translate(284.0, 717.0)" d="M 22 0 C 34.15026473999023 0 44 10.07359409332275 44 22.5 C 44 34.92640686035156 34.15026473999023 45 22 45 C 9.849736213684082 45 0 34.92640686035156 0 22.5 C 0 10.07359409332275 9.849736213684082 0 22 0 Z" fill="#7744ff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_mogb6o =
    '<svg viewBox="348.0 717.0 44.0 45.0" ><path transform="translate(348.0, 717.0)" d="M 22 0 C 34.15026473999023 0 44 10.07359409332275 44 22.5 C 44 34.92640686035156 34.15026473999023 45 22 45 C 9.849736213684082 45 0 34.92640686035156 0 22.5 C 0 10.07359409332275 9.849736213684082 0 22 0 Z" fill="#a9a9a9" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
