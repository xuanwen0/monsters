import 'dart:math';
import 'dart:developer' as dv;

const List monsterNamesList = [
  "Baku", //0
  "Cloud", //1
  // "Coling", //2
  "Donut", //3
  // "Fuwa", //4
  "Ghost", //5
  // "Ika", //6
  // "Kila", //7
  "Kungfu", //8
  // "Lizi", //9
  "Lory", //10
  "Magic", //11
  // "Ni" //12
  "Pen", //13
  // "Pina", //14
  "Pudding", //15
  // "Roy", //16
  "Spider", //17
  "Sticky", //18
  "Three", //19
];

const List monsterNamesList_CH = [
  "巴古", //0
  "棉花糖", //1
  // "可琳", //2
  "杜那", //3
  // "乎瓦", //4
  "疤比", //5
  // "伊咔", //6
  // "基拉", //7
  "赫赫", //8
  // "栗茲", //9
  "酪里", //10
  "馬奇", //11
  // "阿尼", //12
  "潘恩", //13
  // "批奈", //14
  "噗叮", //15
  // "蘿依", //16
  "派特", //17
  "底迪", //18
  "三兄弟", //19
];

String choosenAvatar = "";
String getRandomMonsterName() {
  String random =
      monsterNamesList.elementAt(Random().nextInt(monsterNamesList.length));
  dv.log(random.toString());
  return random.toString();
}

String getRandomMonsterName_CH() {
  String random =
      monsterNamesList_CH.elementAt(Random().nextInt(monsterNamesList.length));
  dv.log(random.toString());
  return random.toString();
}

String getMonsterAvatarPath(String monsterName) {
  return 'assets/image/monsters/avatar/Avatar_${monsterName}_PNG.png';
}

String getMonsterImage(String monsterName) {
  return 'assets/image/monsters/monster_$monsterName.png';
}

// getMonsterAvatarPath("Baku","JPG")
String getMonsterAnimationPath(String monsterName, String direction) {
  String dir = direction.toLowerCase();
  return "assets/image/animatedImage/${monsterName}_$dir.gif";
}
