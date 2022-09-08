import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter_svg/flutter_svg.dart';

class new_backgroundColor4 extends StatelessWidget {
  new_backgroundColor4({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffffed4),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: const Color(0xffffffff),
              border: Border.all(width: 8.0, color: const Color(0xffffed97)),
            ),
            margin: EdgeInsets.fromLTRB(22.0, 100.0, 21.0, 81.0),
          ),
          Pinned.fromPins(
            Pin(size: 45.6, start: 13.7),
            Pin(size: 41.1, start: 21.9),
            child:
                // Adobe XD layer: 'Icon ionic-md-arrow…' (shape)
                SvgPicture.string(
              _svg_ryq30,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 188.0, middle: 0.5),
            Pin(size: 63.0, start: 11.0),
            child: Text(
              '使用條款',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 47,
                color: const Color(0xffa0522d),
              ),
              softWrap: false,
            ),
          ),
          Pinned.fromPins(
            Pin(start: 34.0, end: 44.0),
            Pin(size: 545.0, end: 110.0),
            child: Text.rich(
              TextSpan(
                style: TextStyle(
                  fontFamily: 'Segoe UI',
                  fontSize: 11,
                  color: const Color(0xff000000),
                ),
                children: [
                  TextSpan(
                    text: '                             ',
                  ),
                  TextSpan(
                    text: '貘nsters App使用條款說明\n',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  TextSpan(
                    text:
                        '\n      誠摯感謝並且歡迎您使用「貘nsters」，為了讓您能夠安心的使用\n      貘nsters的各項服務與資訊，特別向您說明貘nsters的隱私權保護\n      政策以及相關使用條款，來保障您的權益，以下內容請您詳閱：\n\n      ',
                  ),
                  TextSpan(
                    text: '一、隱私權保護政策的適用範圍\n',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  TextSpan(
                    text:
                        '\n      隱私權保護政策內容，包含貘nsters如何處理在您使用App服務時\n      收集到的您的個人資料。隱私權保護政策不適用於貘nsters以外的\n      相關連結網站，也不適用於非貘nsters所委託或參與管理的人員。\n\n      ',
                  ),
                  TextSpan(
                    text: '二、個人資料的收集、處理及利用方式\n',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  TextSpan(
                    text:
                        '\n          •  當您使用貘nsters所提供之功能服務時，我們將視該服務功\n              能性質，請您提供必要的個人資料，並在該特定目的範圍內  \n              處理及利用您的個人資料；未經您書面同意，貘nsters不會\n              將您的個人資料作為其他用途\n          •  貘nsters在您使用社群進行互動性功能時，會保留並儲存您\n              所撰寫的文字內容、撰寫時間、留言內容、按讚動作等\n          •  當您使用貘nsters時，伺服器會自行記錄相關行徑，包括您\n             使用連線設備的 IP 位址、使用時間、瀏覽及點選資料記錄等\n             ，做為我們增進App服務的參考依據，此記錄為內部應用，\n             絕不對外公佈\n          •  為提供精確的服務，我們會將收集到的煩惱或心情分數進\n             行統計與分析，分析結果之數據或會以圖表方式呈現，分\n             析結果提供給您了解自身情緒起伏狀態作為參考，並不會\n             公開給除了您以外的人看到或者取得\n          •  您可以隨時向我們提出請求，或變更您的個人資料等隱私\n             資訊。操作方式請見最下方第八點「聯繫管道」\n\n      \n\n\n \n',
                  ),
                ],
              ),
              textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
              softWrap: false,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 76.0, end: 21.0),
            Pin(size: 32.0, end: 24.0),
            child: Stack(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Pinned.fromPins(
                      Pin(size: 33.0, middle: 0.4884),
                      Pin(start: 0.0, end: 0.0),
                      child: Container(
                        color: const Color(0xffffed97),
                      ),
                    ),
                    Pinned.fromPins(
                      Pin(size: 35.0, start: 0.0),
                      Pin(start: 0.0, end: 0.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xffffed97),
                          borderRadius: BorderRadius.all(
                              Radius.elliptical(9999.0, 9999.0)),
                        ),
                      ),
                    ),
                    Pinned.fromPins(
                      Pin(size: 35.0, end: 0.0),
                      Pin(start: 0.0, end: 0.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xffffed97),
                          borderRadius: BorderRadius.all(
                              Radius.elliptical(9999.0, 9999.0)),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(8.0, 3.0, 11.0, 3.0),
                  child: SizedBox.expand(
                      child: Text(
                    '下一頁',
                    style: TextStyle(
                      fontFamily: 'Segoe UI',
                      fontSize: 19,
                      color: const Color(0xffa0522d),
                    ),
                    softWrap: false,
                  )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

const String _svg_ryq30 =
    '<svg viewBox="13.7 21.9 45.6 41.1" ><path transform="translate(8.07, 15.61)" d="M 47.28736877441406 22.92952919006348 L 19.54702568054199 22.92952919006348 L 30.30613327026367 13.09178352355957 C 31.84870529174805 11.54302215576172 31.84870529174805 9.040220260620117 30.30613327026367 7.491456031799316 C 28.76356315612793 5.942692756652832 26.26174545288086 5.942692756652832 24.70621109008789 7.491456031799316 L 6.791648864746094 24.09420013427734 C 6.013882637023926 24.81282615661621 5.624999046325684 25.79164695739746 5.624999046325684 26.86958694458008 L 5.624999046325684 26.91914939880371 C 5.624999046325684 27.99708938598633 6.013882637023926 28.97590446472168 6.791648864746094 29.69453430175781 L 24.69325065612793 46.29727935791016 C 26.24878120422363 47.84604263305664 28.75060272216797 47.84604263305664 30.29317092895508 46.29727935791016 C 31.83573913574219 44.74851226806641 31.83573913574219 42.2457160949707 30.29317092895508 40.69694900512695 L 19.5340633392334 30.85920524597168 L 47.27440643310547 30.85920524597168 C 49.46512222290039 30.85920524597168 51.24102020263672 29.08742141723633 51.24102020263672 26.89437294006348 C 51.25398254394531 24.66414642333984 49.47808074951172 22.92952919006348 47.28736877441406 22.92952919006348 Z" fill="#ffbb00" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
