import 'dart:math';

const List monsterNamesList = [
  "Baku",
  "Cloud",
  "Coling",
  "Donut",
  "Fuwa",
  "Ghost",
  // "Ika",
  "Kila",
  "Kungfu",
  "Lizi",
  "Lory",
  "Magic",
  "Pen",
  "Pina",
  "Roy",
  "Spider",
  "Sticky",
  "Three",
];
String choosenAvatar = "";
String getRandomMonsterName() {
  return monsterNamesList.elementAt(Random().nextInt(monsterNamesList.length));
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
