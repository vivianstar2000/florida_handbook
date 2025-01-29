import 'package:flutter/material.dart';
import 'package:florida_handbook/firestore_service.dart';

class EnglishConversationPage extends StatelessWidget {
  final List<Map<String, dynamic>> phrasesByScene = [
  {
  "title": "空港 (Airport)",
  "idioms": [
    {"english": "Catch a flight", "japanese": "飛行機に乗る"},
    {"english": "Red-eye flight", "japanese": "深夜便"},
    {"english": "Miss the flight", "japanese": "飛行機に乗り遅れる"},
    {"english": "Boarding time", "japanese": "搭乗時間"},
    {"english": "Jet lag", "japanese": "時差ボケ"},
    {"english": "Flight delay", "japanese": "飛行機の遅延"},
  ],
  "vocabulary": [
    {"english": "Baggage claim", "japanese": "手荷物受取所"},
    {"english": "Boarding pass", "japanese": "搭乗券"},
    {"english": "Check-in counter", "japanese": "チェックインカウンター"},
    {"english": "Security checkpoint", "japanese": "保安検査場"},
    {"english": "Customs declaration", "japanese": "税関申告"},
    {"english": "Departure gate", "japanese": "出発ゲート"},
    {"english": "Carry-on luggage", "japanese": "機内持ち込み荷物"},
    {"english": "Baggage allowance", "japanese": "手荷物制限"},
    {"english": "Immigration control", "japanese": "入国審査"},
  ],
  "grammar": [
    {"english": "Where is the check-in counter?", "japanese": "チェックインカウンターはどこですか？"},
    {"english": "I'd like to check in for my flight.", "japanese": "飛行機のチェックインをお願いします。"},
    {"english": "How much is the baggage fee?", "japanese": "手荷物料金はいくらですか？"},
    {"english": "Do I need to fill out any customs forms?", "japanese": "税関申告書を記入する必要がありますか？"},
    {"english": "Where is the immigration counter?", "japanese": "入国審査カウンターはどこですか？"},
    {"english": "How long is the security check waiting time?", "japanese": "保安検査の待ち時間はどれくらいですか？"},
    {"english": "Can I bring this in my carry-on luggage?", "japanese": "これを機内持ち込み荷物に入れてもいいですか？"},
    {"english": "My flight has been delayed. What should I do?", "japanese": "飛行機が遅延しました。どうすればいいですか？"},
    {"english": "Can I get a window seat?", "japanese": "窓側の席をお願いできますか？"},
    {"english": "Where can I find the nearest currency exchange?", "japanese": "最寄りの両替所はどこですか？"},
  ],
  },

  {
  "title": "飛行機の中 (On the Plane)",
  "idioms": [
    {"english": "Fasten your seatbelt", "japanese": "シートベルトを締める"},
    {"english": "Stretch your legs", "japanese": "足を伸ばす"},
    {"english": "Kill time", "japanese": "時間をつぶす"},
    {"english": "Layover blues", "japanese": "乗り継ぎの憂鬱"},
    {"english": "Flying blind", "japanese": "状況が不明なまま進める"},
  ],
  "vocabulary": [
    {"english": "Overhead compartment", "japanese": "頭上の荷物入れ"},
    {"english": "In-flight meal", "japanese": "機内食"},
    {"english": "Cabin crew", "japanese": "客室乗務員"},
    {"english": "Turbulence", "japanese": "乱気流"},
    {"english": "Aisle seat", "japanese": "通路側の席"},
    {"english": "Window seat", "japanese": "窓側の席"},
    {"english": "Reclining seat", "japanese": "リクライニングシート"},
    {"english": "Seatbelt sign", "japanese": "シートベルト着用サイン"},
    {"english": "Emergency exit", "japanese": "非常口"},
    {"english": "Lavatory", "japanese": "機内トイレ"},
    {"english": "Flight attendant", "japanese": "客室乗務員"},
    {"english": "Entertainment system", "japanese": "機内エンターテインメントシステム"},
    {"english": "Jet lag", "japanese": "時差ボケ"},
    {"english": "Headphones", "japanese": "ヘッドフォン"},
    {"english": "Tray table", "japanese": "折りたたみテーブル"},
  ],
  "grammar": [
    {"english": "Excuse me, may I change my seat?", "japanese": "すみません、席を変えてもいいですか？"},
    {"english": "Can I get a blanket, please?", "japanese": "毛布をもらえますか？"},
    {"english": "What drinks do you have?", "japanese": "どんな飲み物がありますか？"},
    {"english": "Do you have vegetarian meals?", "japanese": "ベジタリアン向けの食事はありますか？"},
    {"english": "Could you help me with this seatbelt?", "japanese": "このシートベルトを手伝ってもらえますか？"},
    {"english": "How long is the flight?", "japanese": "飛行時間はどれくらいですか？"},
    {"english": "Could I have some water, please?", "japanese": "お水をいただけますか？"},
    {"english": "Can I get another pillow?", "japanese": "もう一つ枕をもらえますか？"},
    {"english": "Where is the nearest lavatory?", "japanese": "最寄りのトイレはどこですか？"},
    {"english": "Could you turn off the reading light, please?", "japanese": "読書灯を消してもらえますか？"},
    {"english": "Can I put my bag in the overhead compartment?", "japanese": "荷物を頭上の収納に入れてもいいですか？"},
    {"english": "Do you have an English newspaper?", "japanese": "英字新聞はありますか？"},
    {"english": "My headphones aren’t working. Can I get another one?", "japanese": "ヘッドフォンが壊れています。別のものをもらえますか？"},
    {"english": "I feel a bit sick. Do you have any medicine?", "japanese": "少し気分が悪いです。薬はありますか？"},
    {"english": "Can I order something else?", "japanese": "別のものを注文できますか？"},
    {"english": "Excuse me, can I pass?", "japanese": "すみません、通ってもいいですか？"},
    {"english": "Can I fully recline my seat?", "japanese": "席を完全に倒してもいいですか？"},
    {"english": "Is there Wi-Fi on this flight?", "japanese": "この飛行機にはWi-Fiがありますか？"},
    {"english": "Can I charge my phone here?", "japanese": "ここでスマホを充電できますか？"},
  ],
},

{
  "title": "彼女のアメリカの家族の家に滞在中 \n (Staying at Her American Family’s Home)",
  "idioms": [
    {"english": "Make yourself at home", "japanese": "くつろいでください"},
    {"english": "Break the ice", "japanese": "緊張をほぐす"},
    {"english": "A home away from home", "japanese": "第2の我が家"},
    {"english": "When in Rome, do as the Romans do", "japanese": "郷に入れば郷に従え"},
    {"english": "Get along with", "japanese": "仲良くする"},
    {"english": "Extend a warm welcome", "japanese": "温かく迎える"},
    {"english": "Hit it off", "japanese": "意気投合する"},
    {"english": "Go with the flow", "japanese": "流れに身を任せる"},
    {"english": "Be on the same page", "japanese": "同じ考えを持っている"},
    {"english": "Speak your mind", "japanese": "思ったことを率直に言う"},
    {"english": "Pass the salt", "japanese": "塩を取ってもらえますか？（食事中の依頼表現）"},
    {"english": "Lend a hand", "japanese": "手伝う"},
    {"english": "Share a laugh", "japanese": "笑いを共有する"},
    {"english": "Feel at ease", "japanese": "気楽に過ごす"},
    {"english": "Give someone space", "japanese": "相手に配慮して距離をとる"},
  ],
  "vocabulary": [
    {"english": "Guest room", "japanese": "客室"},
    {"english": "Host family", "japanese": "ホストファミリー"},
    {"english": "Hospitality", "japanese": "おもてなし"},
    {"english": "Table manners", "japanese": "食事のマナー"},
    {"english": "Home-cooked meal", "japanese": "手料理"},
    {"english": "Chores", "japanese": "家事"},
    {"english": "Family gathering", "japanese": "家族の集まり"},
    {"english": "Cultural differences", "japanese": "文化の違い"},
    {"english": "Small talk", "japanese": "世間話"},
    {"english": "Household rules", "japanese": "家庭のルール"},
    {"english": "Bathroom schedule", "japanese": "バスルームの使用スケジュール"},
    {"english": "Dinner table conversation", "japanese": "食卓での会話"},
    {"english": "Privacy", "japanese": "プライバシー"},
    {"english": "Laundry", "japanese": "洗濯"},
    {"english": "Curfew", "japanese": "門限"},
    {"english": "Household chores", "japanese": "家事の手伝い"},
    {"english": "Dishwashing", "japanese": "皿洗い"},
    {"english": "Grocery shopping", "japanese": "食料品の買い出し"},
    {"english": "Living room", "japanese": "リビングルーム"},
    {"english": "Meal prep", "japanese": "食事の準備"},
    {"english": "Weekend plans", "japanese": "週末の予定"},
    {"english": "Family bonding", "japanese": "家族との絆を深めること"},
  ],
  "grammar": [
    {"english": "Thank you for having me!", "japanese": "お招きいただきありがとうございます！"},
    {"english": "The food is delicious!", "japanese": "料理がとても美味しいです！"},
    {"english": "Can I help with anything?", "japanese": "何かお手伝いしましょうか？"},
    {"english": "What time do you usually wake up?", "japanese": "普段何時に起きますか？"},
    {"english": "Where should I put my luggage?", "japanese": "荷物はどこに置けばいいですか？"},
    {"english": "I really appreciate your hospitality.", "japanese": "おもてなしに本当に感謝します。"},
    {"english": "Do you need help with the dishes?", "japanese": "お皿洗いを手伝いましょうか？"},
    {"english": "May I use the shower now?", "japanese": "今シャワーを使ってもいいですか？"},
    {"english": "Is there anything I should be aware of?", "japanese": "気をつけるべきことはありますか？"},
    {"english": "I’d love to learn more about your culture.", "japanese": "もっと文化について学びたいです。"},
    {"english": "What do you usually do on weekends?", "japanese": "週末は普段何をしますか？"},
    {"english": "Could you recommend any good local restaurants?", "japanese": "地元の美味しいレストランを教えていただけますか？"},
    {"english": "Is there a specific time for breakfast?", "japanese": "朝食の時間は決まっていますか？"},
    {"english": "Do you have any house rules I should follow?", "japanese": "守るべき家のルールはありますか？"},
    {"english": "May I have some more, please?", "japanese": "もう少しいただいてもいいですか？"},
    {"english": "I had a great time today, thank you!", "japanese": "今日は楽しい時間を過ごせました、ありがとうございました！"},
    {"english": "Would you like me to do the laundry?", "japanese": "洗濯を手伝いましょうか？"},
    {"english": "This is my first time staying with a host family.", "japanese": "ホストファミリーの家に泊まるのは初めてです。"},
    {"english": "Can I borrow a charger?", "japanese": "充電器を借りてもいいですか？"},
    {"english": "Could I have a towel, please?", "japanese": "タオルをいただけますか？"},
    {"english": "Would you like some help in the kitchen?", "japanese": "キッチンでお手伝いしましょうか？"},
    {"english": "Could I join you for your family outing?", "japanese": "家族のお出かけに一緒に行ってもいいですか？"},
    {"english": "Can I take a quick nap before dinner?", "japanese": "夕食の前に少し昼寝をしてもいいですか？"},
    {"english": "I’d love to hear more about your family traditions.", "japanese": "家族の伝統についてもっと聞きたいです。"},
  ],
},



  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('旅行英会話')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: phrasesByScene.length,
          itemBuilder: (context, index) {
            var category = phrasesByScene[index];
            return Card(
  elevation: 4,
  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 4),
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  child: ExpansionTile(
    title: Text(
  category["title"],
  style: TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    fontFamily: 'NotoSansJP', // フォントをNotoSansJPに設定
    color: Color(0xFF544740), // 色を0xFF544740に変更
  ),
),
    children: [
      // イディオムセクション
      if (category["idioms"] != null) ...[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          child: Text("🗣 イディオム (Idioms)", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ),
        ...category["idioms"].map<Widget>((idiom) {
          return ListTile(
            title: Text(idiom["english"], style: TextStyle(fontSize: 16, color: const Color.fromARGB(255, 57, 56, 56), fontWeight: FontWeight.bold)),
            subtitle: Text(idiom["japanese"], style: TextStyle(fontSize: 14, color: Colors.grey[700])),
          );
        }).toList(),
      ],
      
      // 単語セクション
      if (category["vocabulary"] != null) ...[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          child: Text("📖 単語 (Vocabulary)", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ),
        ...category["vocabulary"].map<Widget>((word) {
          return ListTile(
            title: Text(word["english"], style: TextStyle(fontSize: 16, color: const Color.fromARGB(255, 57, 56, 56),  fontWeight: FontWeight.bold)),
            subtitle: Text(word["japanese"], style: TextStyle(fontSize: 14, color: Colors.grey[700])),
          );
        }).toList(),
      ],

      // 文法セクション
      if (category["grammar"] != null) ...[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          child: Text("📚 文法 (Grammar)", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ),
        ...category["grammar"].map<Widget>((rule) {
          return ListTile(
            title: Text(rule["english"], style: TextStyle(fontSize: 16, color: const Color.fromARGB(255, 57, 56, 56), fontWeight: FontWeight.bold)),
            subtitle: Text(rule["japanese"], style: TextStyle(fontSize: 14, color: Colors.grey[700])),
          );
        }).toList(),
      ],
    ],
  ),
);

          },
        ),
      ),
    );
  }
}

