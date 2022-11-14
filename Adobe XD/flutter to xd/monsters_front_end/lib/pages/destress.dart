import 'package:adobe_xd/page_link.dart';
import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:monsters_front_end/new_fast_test.dart';
import 'package:monsters_front_end/pages/interaction.dart';
import 'package:url_launcher/link.dart';

class Destress extends StatefulWidget {
  @override
  _DestressState createState() => _DestressState();
}

class _DestressState extends State<Destress> {
  Row buildButton(String name, var page) {
    return Row(
      verticalDirection: VerticalDirection.up,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 50),
        Container(
          alignment: Alignment.center,
          child: TextButton(
              child: Text(name, style: TextStyle(fontSize: 14)),
              style: ButtonStyle(
                  alignment: Alignment.center,
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Color(0xffa0522d)),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  padding:
                      MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(15)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Color(0xffa0522d))))),
              onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => page),
                  )),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xfffffed4),
        //標題
        appBar: AppBar(
          backgroundColor: const Color(0xfffffed4),
          toolbarHeight: 80,
          //箭頭
          leading: PageLink(
            links: [
              PageLinkInfo(
                transition: LinkTransition.Fade,
                ease: Curves.easeOut,
                duration: 0.3,
                pageBuilder: () => InteractionPage(),
              ),
            ],
            child: SvgPicture.string(
              _svg_ryq30,
              height: 50,
              width: 50,
              alignment: Alignment.center,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.scaleDown,
            ),
          ),
          //標題文字
          titleSpacing: 30,
          title: Text(
            '紓壓方法',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Segoe UI',
              fontSize: 40,
              color: Color(0xffa0522d),
            ),
          ),
        ),
        //按鈕布局
        body: Column(
          children: [
            Row(
              verticalDirection: VerticalDirection.up,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 100),
                Container(
                  alignment: Alignment.center,
                  child: TextButton(
                      child: Text("LINK 1", style: TextStyle(fontSize: 14)),
                      style: ButtonStyle(
                          alignment: Alignment.center,
                          foregroundColor: MaterialStateProperty.all<Color>(
                              Color(0xffa0522d)),
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          padding: MaterialStateProperty.all<EdgeInsets>(
                              EdgeInsets.all(15)),
                          shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                  side: BorderSide(color: Color(0xffa0522d))))),
                      onPressed: () => null),
                )
              ],
            ),
            Row(
              verticalDirection: VerticalDirection.up,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 50),
                Container(
                  alignment: Alignment.center,
                  child: TextButton(
                      child: Text("LINK 1", style: TextStyle(fontSize: 14)),
                      style: ButtonStyle(
                          alignment: Alignment.center,
                          foregroundColor: MaterialStateProperty.all<Color>(
                              Color(0xffa0522d)),
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          padding: MaterialStateProperty.all<EdgeInsets>(
                              EdgeInsets.all(15)),
                          shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                  side: BorderSide(color: Color(0xffa0522d))))),
                      onPressed: () => null),
                )
              ],
            ),
            buildButton("123", new_fastTest()),
          ],
        )

/*
      
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child:
                // Adobe XD layer: 'Icon ionic-md-arrow…' (shape)
                PageLink(
              links: [
                PageLinkInfo(
                  transition: LinkTransition.Fade,
                  ease: Curves.easeOut,
                  duration: 0.3,
                  pageBuilder: () => InteractionPage(),
                ),
              ],
              child: SvgPicture.string(
                _svg_ryq30,
                allowDrawingOutsideViewBox: true,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Text(
              '紓壓方法',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 47,
                color: Color(0xffa0522d),
              ),
              softWrap: false,
            ),
          ),
        ],
        

        /*
        children: <Widget>[
          //標題
          Pinned.fromPins(
            Pin(size: 200.0, middle: 0.5),
            Pin(size: 63.0, start: 20.0),
            child: const Text(
              '紓壓方法',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 47,
                color: Color(0xffa0522d),
              ),
              softWrap: false,
            ),
          ),
          //箭頭
          Pinned.fromPins(
            Pin(size: 45.6, start: 14.4),
            Pin(size: 41.1, start: 23.4),
            

          Container(
            child: FlatButton(
              onPressed: () {},
              child: Text("button1"),
            ),
          )
        ],
//
        */
      ),
    
    */

        );
  }
}

const String _svg_ryq30 =
    '<svg viewBox="13.7 21.9 45.6 41.1" ><path transform="translate(8.07, 15.61)" d="M 47.28736877441406 22.92952919006348 L 19.54702568054199 22.92952919006348 L 30.30613327026367 13.09178352355957 C 31.84870529174805 11.54302215576172 31.84870529174805 9.040220260620117 30.30613327026367 7.491456031799316 C 28.76356315612793 5.942692756652832 26.26174545288086 5.942692756652832 24.70621109008789 7.491456031799316 L 6.791648864746094 24.09420013427734 C 6.013882637023926 24.81282615661621 5.624999046325684 25.79164695739746 5.624999046325684 26.86958694458008 L 5.624999046325684 26.91914939880371 C 5.624999046325684 27.99708938598633 6.013882637023926 28.97590446472168 6.791648864746094 29.69453430175781 L 24.69325065612793 46.29727935791016 C 26.24878120422363 47.84604263305664 28.75060272216797 47.84604263305664 30.29317092895508 46.29727935791016 C 31.83573913574219 44.74851226806641 31.83573913574219 42.2457160949707 30.29317092895508 40.69694900512695 L 19.5340633392334 30.85920524597168 L 47.27440643310547 30.85920524597168 C 49.46512222290039 30.85920524597168 51.24102020263672 29.08742141723633 51.24102020263672 26.89437294006348 C 51.25398254394531 24.66414642333984 49.47808074951172 22.92952919006348 47.28736877441406 22.92952919006348 Z" fill="#ffbb00" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
