// ignore_for_file: file_names

class DestressWay {
  final int id;
  final String name;
  final String intro;
  final String imagePath;
  final List<DestressWayIntro> steps;

  DestressWay(this.id, this.name, this.intro, this.imagePath, this.steps);

  static List<DestressWay> fetchAll() {
    return [
      //1深呼吸 done
      DestressWay(1, '深呼吸', '臨床運動心理學家表示，這能幫助平靜壓力時刻混亂的心靈。將注意力放在呼吸...',
          'assets/image/destress_item/way1.png', [
        DestressWayIntro(
            '臨床運動心理學家表示，這能幫助平靜壓力時刻混亂的心靈。將注意力放在呼吸上休息5分鐘！心理學專家Judith Tutin博士說，深呼吸能將氧氣提供至大腦，刺激副交感神經系統，透過降低心率與血壓的方式以抵銷壓力。.content'),
        DestressWayIntro('Power 10 呼吸法.title'),
        DestressWayIntro(
            '吸氣4秒，專注在焦慮和壓力的感受上；呼氣6秒，專注在放鬆的感覺，並將它釋放。以這樣的方式呼吸10次。.content'),
        DestressWayIntro('538 深呼吸法.title'),
        DestressWayIntro(
            '1．首先，請先聳起雙肩，之後再一次放鬆力道，使雙手自然垂落。\n\n2．接著將雙手放在膝蓋處，手掌朝上。.content'),
        DestressWayIntro('way1_1.png'),
        DestressWayIntro(
            '3．閉起雙眼，用5秒的時間從鼻腔大大吸進一口空氣。在這個步驟中，請想像將一大口新鮮空氣吸入體內的畫面來進行深呼吸。.content'),
        DestressWayIntro('way1.png'),
        DestressWayIntro('4．接下來，閉氣3秒鐘的時間，為了使身體明確意識到吸入與吐出，這2個動作之間的差異性。.content'),
        DestressWayIntro('way1_2.png'),
        DestressWayIntro(
            '5．再來，花8秒的時間，從口腔慢慢吐氣。進行這步驟時，請同時將心中的負面情緒和沉積在體內的怨氣一掃而空吧。.content'),
        DestressWayIntro('way1_3.png'),
      ]),

      //2聽音樂 done
      DestressWay(2, '聽音樂', '研究發現，人在緊張狀況下，聆聽音樂能使神經系統修復，還能降低血壓...',
          'assets/image/destress_item/way2.png', [
        DestressWayIntro('way2_1.jpg'),
        DestressWayIntro('音樂的奇效.title'),
        DestressWayIntro(
            '研究發現，人在緊張狀況下，聆聽音樂能使神經系統修復，還能降低血壓、心率與焦慮，無論是古典樂或是流行歌曲，只要找到能讓自己陶醉的音樂，想像歌手唱出自己的心聲，就能達到宣洩情緒的效果。.content'),
        DestressWayIntro('每天第一件事.title'),
        DestressWayIntro(
            '物理治療師表示，音樂能以促進平靜的方式，改變細胞的化學作用。\n\n在晨起準備出門或通勤時打開收音機，聽古典音樂或節奏較緩慢的曲調，能放鬆身心、減輕壓力。\n\n事實上，聽你最愛的音樂，是每天早上建議做的五件事之一，能讓你開啟不可思議的一天。.content'),
      ]),

      //3運動 done
      DestressWay(3, '運動', '運動是極好的紓壓方式，根據哈佛醫學院的研究，放鬆心靈前必須先放鬆身體...',
          'assets/image/destress_item/way3.png', [
        DestressWayIntro(
            '運動是極好的紓壓方式，根據哈佛醫學院的研究，放鬆心靈前必須先放鬆身體，藉由放鬆肢體以減少緊張的情緒。且到戶外呼吸新鮮空氣，有助放鬆、減輕壓力。\n\n激烈的運動，例如跑步、游泳、爬山、球類運動，會讓血液循環加快、胸喘、心跳加速、汗流\n\n浹背、身體痠痛等，增加心肺功能，且腦部會分泌腦內嗎啡，從而紓解壓力。緩慢的運動，如瑜伽、太極拳、八段錦，一般是由強度小、節奏較慢動作組合而成，這種可將身體和精神集中於一體的伸展運動，有利於促進血液循環，針對關節、肌肉、內臟、思維都有鍛鍊作用。達到身體和心靈的放鬆，讓人學會呼吸，學會思考。\n\n無論進行哪種運動，前提是要有興趣，否則也不會讓你開心。\n\n以下推薦【紓壓瑜珈】體位法.content'),
        DestressWayIntro("嬰兒式(Child's Pose).title"),
        DestressWayIntro("way3_1.jpg"),
        DestressWayIntro(
            " 1．膝蓋跪在墊子上，臀部緊靠著腿。雙手掌心向下向前延伸，上身慢慢彎下直到額頭貼地，讓身體從臀部至指尖完整延展。\n\n2．伸展的同時，平穩呼吸，呼氣時不妨嘗試從尾骨慢慢拉長身體，感受從脊椎、肩膀到脖子都完全伸展開來。\n\n3．手臂可放在腿旁邊，想加深伸展可以嘗試將手臂向前方伸出。.content"),
        DestressWayIntro("貓牛式(Cat Cow Pose).title"),
        DestressWayIntro("way3_2.png"),
        DestressWayIntro(
            "1．貓式：四足跪姿，確保膝蓋在臀部下方，手腕在肩膀下方。背部放平，深吸一口氣。呼氣時，將脊椎往上拱起到天花板，下巴朝向胸部，讓脖子鬆開。\n\n2．牛式：吸氣時將頭和尾骨向天空抬起，注意不要在脖子上施加任何壓力。\n\n3．繼續從“貓式”到“牛式”來回流動，並將呼吸與每次運動連接起來-吸入“牛式”，然後呼出“貓式”，重複10次。.content"),
        DestressWayIntro("樹式 (Tree Pose).title"),
        DestressWayIntro("way3_3.jpg"),
        DestressWayIntro(
            "1．雙腳踩穩在瑜伽墊上，接著吸氣將右腳抬離地面，將右腳腳板放在左大腿的內側。\n\n2．雙手合十擺在胸口位置，或將手臂舉到空中，向前凝視，停留3-5個呼吸後換邊。.content"),
        DestressWayIntro("仰臥脊骨扭轉 (Lying Spinal Twist).title"),
        DestressWayIntro("way3_4.jpg"),
        DestressWayIntro(
            "1．平躺在瑜珈墊上，將膝蓋往上彎曲到胸部，接著將兩手手臂向外伸出到T字型。\n\n2．將雙腿放回地面，接著將兩腿膝蓋一齊往右側倒，此時，兩側的肩胛骨都應該碰到地面，然後將頭向左轉，看向左邊。\n\n3．在這裡停五個呼吸，然後換另一側進行同樣的動作。.content"),
        DestressWayIntro("靠牆抬腿式 (Legs Up the Wall).title"),
        DestressWayIntro("way3_5.jpg"),
        DestressWayIntro(
            "1．盡可能靠近牆壁坐下，上半身平躺在地板上，將腳平放在牆上。\n\n2．伸直腳，使腳後跟擱在牆上，如果要伸展肩膀可以讓手臂平行打開。\n\n3．閉上眼睛，讓整個身體放鬆，維持五個呼吸五次或更多次。.content"),
      ]),

      //4手部按摩 done
      DestressWay(4, '手部按摩', '2008年發表的研究報告指出，只要五分鐘的手部按摩就能顯著降低壓力。雖然...',
          'assets/image/destress_item/way4.png', [
        DestressWayIntro(
            '2008年發表的研究報告指出，只要五分鐘的手部按摩就能顯著降低壓力。雖然這項研究是專注在癌症患者的壓力釋放，但每個人都可以透過觸摸來減壓。邁阿密醫學院的觸摸研究發現，按摩治療能影響身體的生物化學作用，緩解抑鬱和焦慮。\n\n身體按摩。透過按摩治療能影響身體的生物化學作用，緩解抑鬱和焦慮。.content'),
        DestressWayIntro("way4_1.png"),
        DestressWayIntro("way4_2.png"),
      ]),

      //5與動物相處
      DestressWay(5, '與動物相處', '和動物相處絕對是減輕壓力很棒的方法。不僅能增加你的笑容，而且研究發...',
          'assets/image/destress_item/way5.png', [
        DestressWayIntro("way5_1.jpg"),
        DestressWayIntro(
            '和動物相處絕對是減輕壓力很棒的方法。不僅能增加你的笑容，而且研究發現，會觸發身體分泌讓人感覺舒服的「催產素」，能夠降血壓、舒緩緊張情緒。\n\n沒有寵物怎麼辦？看看網路上的動物趣味短片，也能有類似效果。.content'),
      ]),

      //6喝花草茶
      DestressWay(6, '喝花草茶', '植物醫學教授說，花草茶是很棒的減壓劑，不妨試試貓薄荷、檸檬香蜂草、西...',
          'assets/image/destress_item/way6.png', [
        DestressWayIntro(
            '植物醫學教授說，花草茶是很棒的減壓劑，不妨試試貓薄荷、檸檬香蜂草、西番蓮花、啤酒花、洋甘菊。\n\n花草茶種類繁多，對人體的裨益更有不同，不是所有人都適合飲用，建議選購前先向醫師諮詢確認，且購買時應以包裝完整、標示清楚、無化學藥劑異味為原則，飲用時則應先把用熱水沖泡的第一泡倒掉，從第二泡開始飲用。.content'),
        DestressWayIntro("· 玫瑰花茶.title"),
        DestressWayIntro("way6_1.jpg"),
        DestressWayIntro(
            "除可消除疲勞之外，還可降火氣、調理血氣、促進血液循環、保護肝臟和腸胃，同時還有養顏美容的功能。.content"),
        DestressWayIntro(
            "＊若與茉莉花相互搭配，更可緩和緊張的情緒、消減體內脂肪；與洋甘菊搭配泡製，可防止肌膚老化、增強肌膚抵抗力和修復能力。若搭配薄荷使用，可提神醒腦、強化中樞神經、促進血液循環，適合腦力勞動者飲用。.content"),
        DestressWayIntro("· 薰衣草茶.title"),
        DestressWayIntro("way6_2.jpg"),
        DestressWayIntro(
            "可以鎮定心神，解除緊張焦慮，抒解壓力，鬆弛神經，幫助入眠，安定消化系統，改善初期感冒、咳嗽和偏頭痛。不過，服用時應避免過量，尤其是孕婦，以免過度刺激平滑肌收縮，導致初期流產或晚期早產。.content"),
        DestressWayIntro("· 茉莉花.title"),
        DestressWayIntro("way6_3.jpg"),
        DestressWayIntro(
            "可安定情緒、舒解鬱悶，改善昏睡和焦慮，提振精神卻不使人過於興奮。此外對胃弱、慢性病支氣管炎、便秘、腹痛和頭痛患者也有幫助。.content"),
        DestressWayIntro("＊若將茉莉花與柑橙花苞混搭泡飲，於晚間飲用，有助於放鬆心情，幫助睡眠。.content"),
        DestressWayIntro("· 馬鞭草.title"),
        DestressWayIntro("way6_4.jpg"),
        DestressWayIntro(
            "可強化神經系統，幫助提神，消除噁心感且促進腸道淨化。此外，馬鞭草還具有活血通經、改善經痛的作用，不過孕婦不宜使用。.content"),
      ]),

      //7冥想
      DestressWay(7, '冥想', '每天練習幾分鐘的冥想有助緩解焦慮情緒，有研究表明，冥想時能使大腦的...',
          'assets/image/destress_item/way7.png', [
        DestressWayIntro(
            "每天練習幾分鐘的冥想有助緩解焦慮情緒，有研究表明，冥想時能使大腦的神經通路達到最平靜的狀態，調節呼吸屏除雜念，使得身心放鬆，情緒也能獲得紓解。\n\n透過冥想，我們能進入到一個專注及定心的狀態並緩解焦慮。此外，冥想除了能平衡腦中交感和副交感神經，進而保持心念上的寧靜，同時也能提供一個仔細聆聽內在聲音的機會，幫助了解自我，將自己從焦慮中帶回當下及學會與自己獨處。.content"),
        DestressWayIntro("way7.png"),
        DestressWayIntro("盤腿，雙手平放於膝蓋、闔上雙眼，去感受你每次的呼吸。（每次冥想時間約5分鐘）.content"),
      ]),

      //8與自己獨處
      DestressWay(8, '與自己獨處', '智慧型手機或許帶來很多生活上的便利，但同時也制約人們的生活，每天滑...',
          'assets/image/destress_item/way8.png', [
        DestressWayIntro(
            '智慧型手機或許帶來很多生活上的便利，但同時也制約人們的生活，每天滑手機讓神經緊繃，壓力也逐漸上升。\n\n根據《Quartz》報導，研究發現現代人應放下手機，享受與自我獨處，有助於更認識真我，強化同理心與刺激思考，當你花時間將焦點放在自己的感覺上，你將感到不那麼緊張，對生活也有很大的幫助。.content'),
        DestressWayIntro("way8_1.png"),
      ]),

      //9洗熱水澡
      DestressWay(9, '洗熱水澡', '當你感到壓力大到爆時，洗洗個熱水澡有助於釋放緊繃壓力。根據美國國家健康...',
          'assets/image/destress_item/way9.png', [
        DestressWayIntro(
            '當你感到壓力大到爆時，洗個熱水澡有助於釋放緊繃壓力。根據美國國家健康研究院報告指出，熱水有助血管擴張，能增加血氧量，減少肌肉緊繃，還能放鬆身心。\n\n泡澡、泡溫泉。促進全身血液循環，釋放壓力。.content'),
        DestressWayIntro("way9.png"),
      ]),

      //10旅行
      DestressWay(10, '旅行', '旅行是最能放鬆身心、為自己充電方法，遠離塵囂與網路。曾有研究調查發現...',
          'assets/image/destress_item/way10.png', [
        DestressWayIntro(
            '旅行是最能放鬆身心、為自己充電方法，遠離塵囂與網路。曾有研究調查發現，沒休假、放假與休長假的人相比，感到非常放鬆情緒的人。但也有研究指出，旅行前的幸福感往往大於旅行後，顛覆了一般人認為「旅行後更快樂」的想法。\n\n專家建議以下幾點：.content'),
        DestressWayIntro("· 目的地愈遠愈好，或乾脆「宅度假」.title"),
        DestressWayIntro(
            "Twitter也曾調查指出，目的地離家愈遠，愈能帶來愉快的體驗。\n\n然而，並非所有人都適合這種方式，如果你容易因為旅行而精疲力盡，「宅度假」可能才是最佳選擇。\n\n因為當陷入壓力泥淖時，你需要的其實是親密感，不如與親友在熟悉地方一起度過，來得紓壓。.content"),
        DestressWayIntro("· 不要想「畢其功於一役」.title"),
        DestressWayIntro("研究指出，比起一次完成所有需求的大旅行，透過一次次小旅行達成的效果更好。.content"),
        DestressWayIntro("· 「規劃旅行」最讓人幸福.title"),
        DestressWayIntro("旅行最感到幸福的時候，事實上並非旅行中或旅行後，而是旅行前的規劃階段。.content"),
        DestressWayIntro("· 切記旅行不工作.title"),
        DestressWayIntro(
            "旅行時千萬不要掛心工作、處理公事，如此才能真正紓解壓力。而且，關於旅行的一切記憶更會烙印在腦中。.content"),
        DestressWayIntro("· 工作先排程，避免收假時的心理衝擊.title"),
        DestressWayIntro(
            "如果能事先將收假後的工作進度安排得鬆一些，可以避免心理落差太大，白白浪費了旅行帶來的療癒效果。.content"),
        DestressWayIntro("way10_1.png"),
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

class DestressWayIntro {
  final String content;

  DestressWayIntro(this.content);
}
