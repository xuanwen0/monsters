// ignore_for_file: use_key_in_widget_constructors, unnecessary_string_interpolations, prefer_const_constructors, file_names

import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class InstructionsPage extends StatefulWidget {
  @override
  _InstructionsPageState createState() => _InstructionsPageState();
}

class _InstructionsPageState extends State<InstructionsPage> {
  final _controller = PageController();
  bool isLastPage = false;
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Container(
          padding: const EdgeInsets.only(bottom: 80),
          child: PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() => isLastPage = index == 4);
            },
            children: [
              buildPage(
                  // color: Color.fromARGB(255, 251, 217, 46),
                  color: Color.fromRGBO(255, 254, 212, 1),
                  urlImage: 'assets/image/instructions/instructionPage_1.png',
                  title: "新增煩惱/日記",
                  subtitle: "點選下方導覽列的+號，\n點選左測按鈕開始抒發煩惱，\n或點選右側按鈕紀錄日記！"),
              buildPage(
                  // color: Color.fromARGB(255, 255, 228, 90),
                  color: Color.fromRGBO(255, 254, 212, 1),
                  urlImage: 'assets/image/instructions/instructionPage_2.png',
                  title: "歷史紀錄",
                  subtitle: "點選下方導覽列的歷史紀錄，\n查看過往的煩惱和日記，\n並可點選一項未解決的煩惱完成解決。"),
              buildPage(
                  // color: Color.fromRGBO(255, 237, 151, 1),
                  color: Color.fromRGBO(255, 254, 212, 1),
                  urlImage: 'assets/image/instructions/instructionPage_3.png',
                  title: "圖鑑",
                  subtitle: "點選下方導覽列的圖鑑，\n查看可愛怪獸圖鑑，\n點選已獲得的怪獸幫他裝飾配件吧！"),
              buildPage(
                  // color: Color.fromARGB(255, 254, 253, 178),
                  color: Color.fromRGBO(255, 254, 212, 1),
                  urlImage: 'assets/image/instructions/instructionPage_4.png',
                  title: "社群",
                  subtitle: "點選下方導覽列的社群，\n查看社群中分享的貼文，\n並按下愛心或留言！"),
              buildPage(
                  color: Color.fromRGBO(255, 254, 212, 1),
                  urlImage: 'assets/image/instructions/instructionPage_5.png',
                  title: "互動區",
                  subtitle: "點選下方導覽列的互動區，\n我們提供了五個方法讓您紓壓，\n快來試試看吧～"),
            ],
          ),
        ),
        bottomSheet: isLastPage
            ? TextButton(
                style: TextButton.styleFrom(
                    primary: Colors.white,
                    backgroundColor: Color.fromRGBO(160, 82, 45, 1),
                    minimumSize: const Size.fromHeight(80)),
                child:
                    const Text("Get Started", style: TextStyle(fontSize: 24)),
                onPressed: () async {
                  Navigator.pop(context);
                },
              )
            : Container(
                height: 80,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      child: Text(
                        "SKIP",
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                      onPressed: () => _controller.animateToPage(4,
                          duration: const Duration(milliseconds: 1000),
                          curve: Curves.easeIn),
                    ),
                    Center(
                        child: SmoothPageIndicator(
                      controller: _controller,
                      count: 5,
                      effect: WormEffect(
                          spacing: 16,
                          dotColor: Color.fromARGB(255, 211, 193, 184),
                          activeDotColor: Color.fromRGBO(160, 82, 45, 1)),
                      onDotClicked: (index) => _controller.animateToPage(index,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeIn),
                    )),
                    TextButton(
                        child: Text(
                          "NEXT",
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                        onPressed: () => _controller.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut))
                  ],
                ),
              ),
      );

  Widget buildPage(
          {required Color color,
          required String urlImage,
          required String title,
          required String subtitle}) =>
      Container(
          color: color,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        width: 2, color: Color.fromRGBO(160, 82, 45, 1)),
                  ),
                  child:
                      Image.asset(urlImage, fit: BoxFit.contain, height: 500),
                ),
              ),
              const SizedBox(height: 30),
              Center(
                child: Text(title,
                    style: TextStyle(
                      color: Color.fromRGBO(160, 82, 45, 1),
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              const SizedBox(height: 24),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Center(
                  child: Text(
                    subtitle,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.black, fontSize: 18),
                  ),
                ),
              )
            ],
          ));
}
