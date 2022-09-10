import 'destressWay_intro.dart';

class DestressWay {
  final int id;
  final String name;
  final String imagePath;
  final List<DestressWayIntro> steps;

  DestressWay(this.id, this.name, this.imagePath, this.steps);

  static List<DestressWay> fetchAll() {
    return [
      DestressWay(1, 'Arashiyama Bamboo Grove',
          'assets/image/destress_item/goTrip2.png', [
        DestressWayIntro('Summary',
            'While we could go on about the ethereal glow and seemingly endless heights of this bamboo grove on the outskirts of Kyoto, the sight\'s pleasures extend beyond the visual realm.'),
        DestressWayIntro('How to Get There',
            'Kyoto airport, with several terminals, is located 16 kterminals, is located 16 kterminals, is located 16 kterminals, is located 16 kterminals, is located 16 kterminals, is located 16 kterminals, is located 16 kilometr kilometres south of the city and is also known as Kyoto. Kyoto can also be reached by transport links from other regional airports.'),
      ]),
      DestressWay(2, 'Ar', 'assets/image/destress_item/goTrip2.png', [
        DestressWayIntro('Su', 'Wh'),
        DestressWayIntro('Ho', 'Ky'),
      ]),
      DestressWay(3, 'Ar3', 'assets/image/destress_item/goTrip2.png', [
        DestressWayIntro('Su3', 'Wh'),
        DestressWayIntro('Ho3', 'Ky3'),
      ]),
    ];
  }

  static DestressWay? fetchByID(int destressID) {
    //fetch all ways, iterate them and when we find the way
    //with the ID we want, return it immediately
    List<DestressWay> destressways = DestressWay.fetchAll();
    for (var i = 0; i < destressways.length; i++) {
      if (destressways[i].id == destressID) {
        return destressways[i];
      }
    }
    return null;
  }
}
