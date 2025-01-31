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
    {"english": "Bump up to first class", "japanese": "ファーストクラスにアップグレードされる"},
    {"english": "Smooth landing", "japanese": "スムーズな着陸"},
    {"english": "Fasten your seatbelt", "japanese": "シートベルトを締める"},
    {"english": "Overbooked flight", "japanese": "予約超過の便"},
    {"english": "Last call for boarding", "japanese": "最終搭乗案内"},
    {"english": "Lost baggage", "japanese": "紛失した手荷物"},
    {"english": "Hit turbulence", "japanese": "乱気流に遭遇する"}
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
    {"english": "Flight attendant", "japanese": "客室乗務員"},
    {"english": "Duty-free shop", "japanese": "免税店"},
    {"english": "Layover", "japanese": "乗り継ぎ"},
    {"english": "Non-stop flight", "japanese": "直行便"},
    {"english": "Direct flight", "japanese": "乗り継ぎのない便"},
    {"english": "Boarding group", "japanese": "搭乗グループ"},
    {"english": "Emergency exit row", "japanese": "非常口座席"},
    {"english": "Runway", "japanese": "滑走路"},
    {"english": "Tarmac", "japanese": "飛行機の駐機場"},
    {"english": "Cockpit", "japanese": "操縦席"},
    {"english": "Overhead bin", "japanese": "頭上の収納棚"},
    {"english": "In-flight meal", "japanese": "機内食"},
    {"english": "Turbulence", "japanese": "乱気流"}
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
    {"english": "Is there free Wi-Fi at the airport?", "japanese": "空港に無料Wi-Fiはありますか？"},
    {"english": "What time is the last boarding call?", "japanese": "最終搭乗案内は何時ですか？"},
    {"english": "Can I get an aisle seat instead?", "japanese": "通路側の席に変更できますか？"},
    {"english": "How long is the layover?", "japanese": "乗り継ぎ時間はどれくらいですか？"},
    {"english": "Where is the baggage claim area?", "japanese": "手荷物受取所はどこですか？"},
    {"english": "Excuse me, but I think this is my seat.", "japanese": "すみませんが、これは私の席だと思います。"},
    {"english": "Can I have a blanket, please?", "japanese": "ブランケットをいただけますか？"},
    {"english": "May I have some water?", "japanese": "お水をいただけますか？"},
    {"english": "Is there an emergency exit nearby?", "japanese": "近くに非常口はありますか？"},
    {"english": "What’s the weather like at my destination?", "japanese": "目的地の天気はどうですか？"},
    {"english": "Do I need to take off my shoes at security?", "japanese": "保安検査で靴を脱ぐ必要がありますか？"},
    {"english": "How do I get to Terminal 3?", "japanese": "ターミナル3へはどう行けばいいですか？"},
    {"english": "Can I store my luggage somewhere at the airport?", "japanese": "空港で荷物を預けることはできますか？"},
    {"english": "Where is the nearest restroom?", "japanese": "最寄りのトイレはどこですか？"},
    {"english": "Can I upgrade my seat to business class?", "japanese": "座席をビジネスクラスにアップグレードできますか？"},
    {"english": "How much time do I have before boarding?", "japanese": "搭乗までどれくらい時間がありますか？"},
    {"english": "Do you have any recommendations for airport restaurants?", "japanese": "空港でおすすめのレストランはありますか？"},
    {"english": "Can I get a refund for my canceled flight?", "japanese": "欠航した便の払い戻しはできますか？"},
    {"english": "Is there a direct flight to Los Angeles?", "japanese": "ロサンゼルス行きの直行便はありますか？"},
    {"english": "Where can I charge my phone?", "japanese": "携帯の充電ができる場所はどこですか？"}
  ]
},

  {
  "title": "飛行機の中 (On the Plane)",
  "idioms": [
    {"english": "Fasten your seatbelt", "japanese": "シートベルトを締める"},
    {"english": "Hit turbulence", "japanese": "乱気流に遭遇する"},
    {"english": "Smooth landing", "japanese": "スムーズな着陸"},
    {"english": "Bumpy ride", "japanese": "揺れの激しい飛行"},
    {"english": "Stretch your legs", "japanese": "足を伸ばす"},
    {"english": "Cabin fever", "japanese": "閉塞感を感じる"},
    {"english": "Kill time", "japanese": "時間をつぶす"},
    {"english": "Catch some sleep", "japanese": "少し寝る"},
    {"english": "Legroom is tight", "japanese": "足元が狭い"},
    {"english": "Red-eye flight", "japanese": "深夜便"}
  ],
  "vocabulary": [
    {"english": "Tray table", "japanese": "折りたたみテーブル"},
    {"english": "Overhead bin", "japanese": "頭上の収納棚"},
    {"english": "In-flight entertainment", "japanese": "機内エンターテイメント"},
    {"english": "Cabin crew", "japanese": "客室乗務員"},
    {"english": "Aisle seat", "japanese": "通路側の席"},
    {"english": "Window seat", "japanese": "窓側の席"},
    {"english": "Emergency exit", "japanese": "非常口"},
    {"english": "Recline the seat", "japanese": "座席を倒す"},
    {"english": "Lavatory", "japanese": "機内トイレ"},
    {"english": "Cabin pressure", "japanese": "機内の気圧"},
    {"english": "Air sickness", "japanese": "飛行機酔い"},
    {"english": "Oxygen mask", "japanese": "酸素マスク"},
    {"english": "Blanket", "japanese": "ブランケット"},
    {"english": "Pillow", "japanese": "枕"},
    {"english": "Headphones", "japanese": "ヘッドフォン"},
    {"english": "Beverage cart", "japanese": "飲み物サービスカート"},
    {"english": "Inflight meal", "japanese": "機内食"},
    {"english": "Seatbelt sign", "japanese": "シートベルト着用サイン"},
    {"english": "Window shade", "japanese": "窓のシェード"},
    {"english": "Flight attendant", "japanese": "客室乗務員"}
  ],
  "grammar": [
    {"english": "Can I change my seat?", "japanese": "席を変更できますか？"},
    {"english": "Could I get a blanket, please?", "japanese": "ブランケットをいただけますか？"},
    {"english": "May I have some water?", "japanese": "お水をいただけますか？"},
    {"english": "Is there a vegetarian meal option?", "japanese": "ベジタリアン向けの食事はありますか？"},
    {"english": "Can I recline my seat?", "japanese": "座席を倒してもいいですか？"},
    {"english": "Where is the nearest lavatory?", "japanese": "一番近いトイレはどこですか？"},
    {"english": "Could you turn down the air conditioning?", "japanese": "空調を弱めてもらえますか？"},
    {"english": "Excuse me, but I think this is my seat.", "japanese": "すみませんが、これは私の席だと思います。"},
    {"english": "When will the meal be served?", "japanese": "食事はいつ提供されますか？"},
    {"english": "Can I have some earplugs?", "japanese": "耳栓をいただけますか？"},
    {"english": "Is there Wi-Fi on this flight?", "japanese": "この便にはWi-Fiがありますか？"},
    {"english": "Could you help me put my bag in the overhead bin?", "japanese": "頭上の収納棚に荷物を入れるのを手伝ってもらえますか？"},
    {"english": "I feel sick. Do you have any medicine?", "japanese": "気分が悪いです。薬はありますか？"},
    {"english": "Can I get a cup of coffee?", "japanese": "コーヒーをいただけますか？"},
    {"english": "How much longer until we land?", "japanese": "着陸まであとどれくらいですか？"},
    {"english": "Can I switch seats with my friend?", "japanese": "友達と席を交換できますか？"},
    {"english": "Can you wake me up for the meal?", "japanese": "食事の時間に起こしてもらえますか？"},
    {"english": "My screen isn't working. Can you fix it?", "japanese": "スクリーンが動きません。修理できますか？"},
    {"english": "Could I have some extra napkins?", "japanese": "ナプキンをもう少しいただけますか？"},
    {"english": "Is there a USB charger at my seat?", "japanese": "私の席にUSB充電ポートはありますか？"},
    {"english": "Can I use my laptop during the flight?", "japanese": "飛行中にノートパソコンを使ってもいいですか？"},
    {"english": "Do I need to turn off my phone for landing?", "japanese": "着陸時に携帯をオフにする必要がありますか？"},
    {"english": "Where is the emergency exit?", "japanese": "非常口はどこですか？"},
    {"english": "Can I have a duty-free shopping catalog?", "japanese": "免税品のカタログをもらえますか？"},
    {"english": "Could you tell me the local time at our destination?", "japanese": "目的地の現地時間を教えてもらえますか？"},
    {"english": "Excuse me, could I get another drink?", "japanese": "すみません、もう一杯飲み物をもらえますか？"},
    {"english": "Can I have a window seat next time?", "japanese": "次回は窓側の席を指定できますか？"},
    {"english": "I think I left my wallet in my seat. Can you check?", "japanese": "席に財布を置き忘れたかもしれません。確認してもらえますか？"},
    {"english": "Can I disembark first? I have a tight connection.", "japanese": "次の便の乗り継ぎ時間が短いので、先に降りてもいいですか？"}
  ]
},

{
  "title": "アメリカの家族の家に滞在中 \n(At American Family’s Home)",
  "idioms": [
    {"english": "Make yourself at home", "japanese": "くつろいでください"},
    {"english": "Under the same roof", "japanese": "同じ屋根の下で"},
    {"english": "A home away from home", "japanese": "第二の我が家"},
    {"english": "Help yourself", "japanese": "ご自由にどうぞ"},
    {"english": "Break the ice", "japanese": "緊張をほぐす"},
    {"english": "Pass the salt", "japanese": "塩を取って"},
    {"english": "Lend a hand", "japanese": "手伝う"},
    {"english": "Put your feet up", "japanese": "リラックスする"},
    {"english": "Crash on the couch", "japanese": "ソファで寝る"},
    {"english": "Early bird gets the worm", "japanese": "早起きは三文の徳"}
  ],
  "vocabulary": [
    {"english": "Guest room", "japanese": "客室"},
    {"english": "Host family", "japanese": "ホストファミリー"},
    {"english": "Living room", "japanese": "リビングルーム"},
    {"english": "Kitchen counter", "japanese": "キッチンカウンター"},
    {"english": "Laundry room", "japanese": "洗濯室"},
    {"english": "Shower curtain", "japanese": "シャワーカーテン"},
    {"english": "Closet", "japanese": "クローゼット"},
    {"english": "Pantry", "japanese": "食品庫"},
    {"english": "Dishwasher", "japanese": "食洗機"},
    {"english": "Microwave", "japanese": "電子レンジ"},
    {"english": "Couch", "japanese": "ソファ"},
    {"english": "Dining table", "japanese": "ダイニングテーブル"},
    {"english": "Backyard", "japanese": "裏庭"},
    {"english": "Basement", "japanese": "地下室"},
    {"english": "Front porch", "japanese": "玄関ポーチ"},
    {"english": "Fireplace", "japanese": "暖炉"},
    {"english": "Doormat", "japanese": "玄関マット"},
    {"english": "Ceiling fan", "japanese": "天井ファン"},
    {"english": "Light switch", "japanese": "電気のスイッチ"},
    {"english": "Garage", "japanese": "ガレージ"},
    {"english": "Spare key", "japanese": "予備の鍵"}
  ],
  "grammar": [
    {"english": "Thank you for having me.", "japanese": "お招きいただきありがとうございます。"},
    {"english": "May I take off my shoes?", "japanese": "靴を脱いでもいいですか？"},
    {"english": "Where can I put my luggage?", "japanese": "荷物はどこに置けばいいですか？"},
    {"english": "Is there anything I can do to help?", "japanese": "何かお手伝いできますか？"},
    {"english": "Could you show me how to use the shower?", "japanese": "シャワーの使い方を教えてもらえますか？"},
    {"english": "What time do you usually wake up?", "japanese": "普段は何時に起きますか？"},
    {"english": "Do you have a laundry schedule?", "japanese": "洗濯のスケジュールはありますか？"},
    {"english": "Can I use the washing machine?", "japanese": "洗濯機を使ってもいいですか？"},
    {"english": "Where should I put the dirty dishes?", "japanese": "使った食器はどこに置けばいいですか？"},
    {"english": "Could I use the microwave?", "japanese": "電子レンジを使ってもいいですか？"},
    {"english": "Do you have a Wi-Fi password?", "japanese": "Wi-Fiのパスワードはありますか？"},
    {"english": "May I use the kitchen to make some tea?", "japanese": "お茶を入れるのにキッチンを使ってもいいですか？"},
    {"english": "Where is the nearest grocery store?", "japanese": "一番近いスーパーはどこですか？"},
    {"english": "Would you like me to set the table?", "japanese": "テーブルを準備しましょうか？"},
    {"english": "Can I help with dinner?", "japanese": "夕食の準備を手伝ってもいいですか？"},
    {"english": "Should I take out the trash?", "japanese": "ゴミを出しましょうか？"},
    {"english": "Where do you keep the extra towels?", "japanese": "予備のタオルはどこにありますか？"},
    {"english": "Is there a curfew?", "japanese": "門限はありますか？"},
    {"english": "What time do you usually have dinner?", "japanese": "夕食は普段何時ですか？"},
    {"english": "May I borrow an umbrella?", "japanese": "傘を借りてもいいですか？"},
    {"english": "Can I leave my laundry here to dry?", "japanese": "ここに洗濯物を干してもいいですか？"},
    {"english": "How do I use the thermostat?", "japanese": "温度調節の使い方を教えてもらえますか？"},
    {"english": "Is it okay if I take a nap?", "japanese": "少し昼寝をしてもいいですか？"},
    {"english": "Where should I put my shoes?", "japanese": "靴はどこに置けばいいですか？"},
    {"english": "Could I borrow a hairdryer?", "japanese": "ドライヤーを借りてもいいですか？"},
    {"english": "Do you have any recommendations for places to visit nearby?", "japanese": "近くでおすすめの観光地はありますか？"},
    {"english": "Would you like me to wash the dishes?", "japanese": "食器を洗いましょうか？"},
    {"english": "Do you mind if I go for a walk?", "japanese": "散歩に出かけてもいいですか？"},
    {"english": "I had a great time staying with you.", "japanese": "とても楽しく滞在できました。"},
    {"english": "Thank you for your hospitality.", "japanese": "おもてなしに感謝します。"}
  ]
},

{
  "title": "家族と外出 (Going out with family)",
  "idioms": [
    {"english": "Hit the road", "japanese": "出発する"},
    {"english": "Call it a day", "japanese": "今日はこの辺で切り上げる"},
    {"english": "Make a pit stop", "japanese": "休憩をとる"},
    {"english": "Grab a bite to eat", "japanese": "軽く食事をする"},
    {"english": "Catch some fresh air", "japanese": "外の空気を吸う"},
    {"english": "Make memories", "japanese": "思い出を作る"},
    {"english": "Go with the flow", "japanese": "流れに任せる"},
    {"english": "Rain check", "japanese": "（予定を）別の日に変更する"},
    {"english": "Call shotgun", "japanese": "助手席を取る"},
    {"english": "Be on the same page", "japanese": "意見が一致している"}
  ],
  "vocabulary": [
    {"english": "Family outing", "japanese": "家族のお出かけ"},
    {"english": "Road trip", "japanese": "ドライブ旅行"},
    {"english": "Picnic", "japanese": "ピクニック"},
    {"english": "Park", "japanese": "公園"},
    {"english": "Zoo", "japanese": "動物園"},
    {"english": "Amusement park", "japanese": "遊園地"},
    {"english": "Restaurant", "japanese": "レストラン"},
    {"english": "Shopping mall", "japanese": "ショッピングモール"},
    {"english": "Movie theater", "japanese": "映画館"},
    {"english": "Museum", "japanese": "博物館"},
    {"english": "Aquarium", "japanese": "水族館"},
    {"english": "Festival", "japanese": "お祭り"},
    {"english": "Souvenir shop", "japanese": "お土産屋"},
    {"english": "Public transportation", "japanese": "公共交通機関"},
    {"english": "Parking lot", "japanese": "駐車場"},
    {"english": "Entrance fee", "japanese": "入場料"},
    {"english": "Group ticket", "japanese": "団体チケット"},
    {"english": "Reservation", "japanese": "予約"},
    {"english": "Waiting line", "japanese": "待ち行列"},
    {"english": "Tour guide", "japanese": "ツアーガイド"}
  ],
  "grammar": [
    {"english": "Where are we going today?", "japanese": "今日はどこへ行きますか？"},
    {"english": "What time should we leave?", "japanese": "何時に出発しましょうか？"},
    {"english": "How long does it take to get there?", "japanese": "そこまでどれくらいかかりますか？"},
    {"english": "Should we take the car or use public transportation?", "japanese": "車で行きますか？それとも公共交通機関を使いますか？"},
    {"english": "Do we need to make a reservation?", "japanese": "予約は必要ですか？"},
    {"english": "How much is the entrance fee?", "japanese": "入場料はいくらですか？"},
    {"english": "Where should we park?", "japanese": "どこに駐車すればいいですか？"},
    {"english": "Can we take pictures here?", "japanese": "ここで写真を撮ってもいいですか？"},
    {"english": "Where is the nearest restroom?", "japanese": "最寄りのトイレはどこですか？"},
    {"english": "Let’s grab a bite to eat.", "japanese": "軽く何か食べましょう。"},
    {"english": "Do you want to try this place?", "japanese": "このお店に行ってみませんか？"},
    {"english": "What’s on the menu?", "japanese": "メニューには何がありますか？"},
    {"english": "Can we split the bill?", "japanese": "割り勘にできますか？"},
    {"english": "I’m full. That was delicious.", "japanese": "お腹いっぱいです。とても美味しかったです。"},
    {"english": "What’s the plan after this?", "japanese": "この後の予定はどうしますか？"},
    {"english": "Do we have time to stop by the souvenir shop?", "japanese": "お土産屋に寄る時間はありますか？"},
    {"english": "Should we take a break?", "japanese": "休憩しましょうか？"},
    {"english": "I need to charge my phone.", "japanese": "携帯を充電したいです。"},
    {"english": "Let’s take a family picture!", "japanese": "家族写真を撮りましょう！"},
    {"english": "That was a great day!", "japanese": "楽しい一日でした！"}
  ]
},

{
  "title": "ウォールマートでの買い物 \n(Shopping at Walmart)",
  "idioms": [
    {"english": "Shop till you drop", "japanese": "疲れるまで買い物する"},
    {"english": "Break the bank", "japanese": "大金を使う"},
    {"english": "Get a good deal", "japanese": "お買い得品を手に入れる"},
    {"english": "Price tag shock", "japanese": "値段を見てびっくりする"},
    {"english": "Run errands", "japanese": "用事を済ませる"},
    {"english": "Impulse buy", "japanese": "衝動買い"},
    {"english": "Out of stock", "japanese": "在庫切れ"},
    {"english": "In stock", "japanese": "在庫あり"},
    {"english": "Buy one, get one free", "japanese": "1つ買うともう1つ無料"},
    {"english": "Spending spree", "japanese": "爆買い"},
    {"english": "Sticker shock", "japanese": "値段に驚く"},
    {"english": "Bargain hunter", "japanese": "お得探しが得意な人"},
    {"english": "Clearance sale", "japanese": "在庫処分セール"},
    {"english": "Cash or card?", "japanese": "現金それともカード？"},
    {"english": "Just browsing", "japanese": "ただ見ているだけ"}
  ],
  "vocabulary": [
    {"english": "Shopping cart", "japanese": "ショッピングカート"},
    {"english": "Basket", "japanese": "買い物かご"},
    {"english": "Aisle", "japanese": "通路"},
    {"english": "Checkout", "japanese": "レジ"},
    {"english": "Cash register", "japanese": "レジ"},
    {"english": "Self-checkout", "japanese": "セルフレジ"},
    {"english": "Price scanner", "japanese": "価格スキャナー"},
    {"english": "Cashier", "japanese": "レジ係"},
    {"english": "Receipt", "japanese": "レシート"},
    {"english": "Coupon", "japanese": "クーポン"},
    {"english": "Discount", "japanese": "割引"},
    {"english": "Sale", "japanese": "セール"},
    {"english": "Rollback price", "japanese": "特別割引価格"},
    {"english": "Everyday low price", "japanese": "常に低価格"},
    {"english": "Refund", "japanese": "返金"},
    {"english": "Exchange", "japanese": "交換"},
    {"english": "Return policy", "japanese": "返品ポリシー"},
    {"english": "Customer service desk", "japanese": "カスタマーサービスカウンター"},
    {"english": "Loyalty program", "japanese": "ポイントプログラム"},
    {"english": "Gift card", "japanese": "ギフトカード"},
    {"english": "Shopping list", "japanese": "買い物リスト"},
    {"english": "Grocery section", "japanese": "食料品コーナー"},
    {"english": "Produce section", "japanese": "生鮮食品コーナー"},
    {"english": "Frozen food section", "japanese": "冷凍食品コーナー"},
    {"english": "Dairy section", "japanese": "乳製品コーナー"},
    {"english": "Household items", "japanese": "家庭用品"},
    {"english": "Clothing section", "japanese": "衣料品コーナー"},
    {"english": "Electronics section", "japanese": "電化製品コーナー"},
    {"english": "Toy aisle", "japanese": "おもちゃ売り場"},
    {"english": "Baby products", "japanese": "ベビー用品"},
    {"english": "Pet supplies", "japanese": "ペット用品"},
    {"english": "Clearance rack", "japanese": "値下げ品コーナー"},
    {"english": "Expiration date", "japanese": "賞味期限"},
    {"english": "Organic products", "japanese": "オーガニック商品"},
    {"english": "Plastic bag", "japanese": "レジ袋"},
    {"english": "Reusable bag", "japanese": "エコバッグ"},
    {"english": "Store brand", "japanese": "プライベートブランド"}
  ],
  "grammar": [
    {"english": "Where can I find the milk?", "japanese": "牛乳はどこにありますか？"},
    {"english": "Do you have this in a smaller size?", "japanese": "これの小さいサイズはありますか？"},
    {"english": "Can I get a price check on this?", "japanese": "これの値段を確認してもらえますか？"},
    {"english": "Is this on sale?", "japanese": "これはセール中ですか？"},
    {"english": "Do you accept Apple Pay?", "japanese": "Apple Payは使えますか？"},
    {"english": "Where is the checkout?", "japanese": "レジはどこですか？"},
    {"english": "Do you have self-checkout?", "japanese": "セルフレジはありますか？"},
    {"english": "Can I get a receipt?", "japanese": "レシートをもらえますか？"},
    {"english": "Excuse me, do you work here?", "japanese": "すみません、ここで働いていますか？"},
    {"english": "Where can I find the restroom?", "japanese": "トイレはどこですか？"},
    {"english": "Do you have a shopping cart?", "japanese": "ショッピングカートはありますか？"},
    {"english": "What’s the return policy?", "japanese": "返品ポリシーはどうなっていますか？"},
    {"english": "Can I return this without a receipt?", "japanese": "レシートなしで返品できますか？"},
    {"english": "Do you have any coupons available?", "japanese": "クーポンはありますか？"},
    {"english": "Can I get a rain check on this item?", "japanese": "これの在庫が入ったら取り置きできますか？"},
    {"english": "How much is this after tax?", "japanese": "税込みでいくらですか？"},
    {"english": "Where is the customer service desk?", "japanese": "カスタマーサービスカウンターはどこですか？"},
    {"english": "Can I get cash back?", "japanese": "キャッシュバックはできますか？"},
    {"english": "I need a bag, please.", "japanese": "袋をください。"},
    {"english": "I’ll pay with my card.", "japanese": "カードで支払います。"},
    {"english": "Can you help me carry this to my car?", "japanese": "車まで運ぶのを手伝ってもらえますか？"},
    {"english": "Is this the final price?", "japanese": "これは最終価格ですか？"},
    {"english": "What time do you close?", "japanese": "何時に閉店しますか？"},
    {"english": "I need a rain check.", "japanese": "次回使える引換券をください。"},
    {"english": "Do you have a rewards program?", "japanese": "ポイントプログラムはありますか？"},
    {"english": "Can I get a gift receipt?", "japanese": "ギフト用のレシートをもらえますか？"},
    {"english": "Where is the nearest Walmart?", "japanese": "一番近いウォールマートはどこですか？"},
    {"english": "That’s a great deal!", "japanese": "これはお買い得ですね！"},
    {"english": "Can I speak to a manager?", "japanese": "マネージャーと話せますか？"}
  ]
},

{
  "title": "ホテル (At Hotel)",
  "idioms": [
    {"english": "Check in", "japanese": "チェックインする"},
    {"english": "Check out", "japanese": "チェックアウトする"},
    {"english": "Live out of a suitcase", "japanese": "旅行続きで落ち着かない"},
    {"english": "Room with a view", "japanese": "眺めの良い部屋"},
    {"english": "Early bird special", "japanese": "早めの割引サービス"},
    {"english": "All booked up", "japanese": "満室"},
    {"english": "Upgrade to a suite", "japanese": "スイートにアップグレード"},
    {"english": "Call the front desk", "japanese": "フロントに電話する"},
    {"english": "Housekeeping service", "japanese": "清掃サービス"},
    {"english": "Sleep like a baby", "japanese": "ぐっすり眠る"},
    {"english": "Wake-up call", "japanese": "モーニングコール"},
    {"english": "No vacancy", "japanese": "空室なし"},
    {"english": "Turn down service", "japanese": "就寝前のベッドメイキング"},
    {"english": "Complimentary breakfast", "japanese": "無料の朝食"},
    {"english": "Late check-out", "japanese": "レイトチェックアウト"}
  ],
  "vocabulary": [
    {"english": "Reservation", "japanese": "予約"},
    {"english": "Front desk", "japanese": "フロント"},
    {"english": "Key card", "japanese": "ルームキー（カードキー）"},
    {"english": "Lobby", "japanese": "ロビー"},
    {"english": "Concierge", "japanese": "コンシェルジュ"},
    {"english": "Bellhop", "japanese": "ベルボーイ"},
    {"english": "Elevator", "japanese": "エレベーター"},
    {"english": "Room service", "japanese": "ルームサービス"},
    {"english": "Mini bar", "japanese": "ミニバー"},
    {"english": "Wi-Fi access", "japanese": "Wi-Fi利用"},
    {"english": "Luggage storage", "japanese": "荷物預かり"},
    {"english": "Gym", "japanese": "ジム"},
    {"english": "Swimming pool", "japanese": "プール"},
    {"english": "Sauna", "japanese": "サウナ"},
    {"english": "Laundry service", "japanese": "ランドリーサービス"},
    {"english": "Air conditioning", "japanese": "エアコン"},
    {"english": "Extra towels", "japanese": "追加のタオル"},
    {"english": "Do not disturb sign", "japanese": "ドアにかける「起こさないで」サイン"},
    {"english": "Hotel amenities", "japanese": "ホテルのアメニティ"},
    {"english": "Bathtub", "japanese": "バスタブ"},
    {"english": "Hairdryer", "japanese": "ヘアドライヤー"},
    {"english": "Safe deposit box", "japanese": "セーフティボックス"},
    {"english": "Parking lot", "japanese": "駐車場"},
    {"english": "Breakfast buffet", "japanese": "朝食ビュッフェ"},
    {"english": "Housekeeping", "japanese": "清掃サービス"},
    {"english": "Business center", "japanese": "ビジネスセンター"},
    {"english": "Late arrival", "japanese": "遅めの到着"},
    {"english": "Check-in time", "japanese": "チェックイン時間"},
    {"english": "Check-out time", "japanese": "チェックアウト時間"},
    {"english": "Deposit", "japanese": "保証金"},
    {"english": "Room upgrade", "japanese": "部屋のアップグレード"},
    {"english": "Wake-up call", "japanese": "モーニングコール"},
    {"english": "Shuttle bus", "japanese": "シャトルバス"},
    {"english": "Smoking/non-smoking room", "japanese": "喫煙・禁煙ルーム"}
  ],
  "grammar": [
    {"english": "I have a reservation under my name.", "japanese": "予約してあります。"},
    {"english": "Can I check in early?", "japanese": "早めにチェックインできますか？"},
    {"english": "What time is check-out?", "japanese": "チェックアウトは何時ですか？"},
    {"english": "Can I get a room with a view?", "japanese": "眺めのいい部屋にできますか？"},
    {"english": "Do you have free Wi-Fi?", "japanese": "無料Wi-Fiはありますか？"},
    {"english": "Where is the breakfast served?", "japanese": "朝食はどこで食べられますか？"},
    {"english": "Can I get extra pillows?", "japanese": "枕を追加できますか？"},
    {"english": "Is room service available 24/7?", "japanese": "ルームサービスは24時間利用できますか？"},
    {"english": "Could you send someone to clean my room?", "japanese": "部屋の掃除をお願いできますか？"},
    {"english": "Where is the fitness center?", "japanese": "フィットネスセンターはどこですか？"},
    {"english": "Can I get a wake-up call at 7 AM?", "japanese": "朝7時にモーニングコールをお願いできますか？"},
    {"english": "Is there a shuttle service to the airport?", "japanese": "空港行きのシャトルバスはありますか？"},
    {"english": "Can I extend my stay for one more night?", "japanese": "もう一泊延長できますか？"},
    {"english": "Do you offer late check-out?", "japanese": "レイトチェックアウトはできますか？"},
    {"english": "Can you call me a taxi?", "japanese": "タクシーを呼んでもらえますか？"},
    {"english": "Do you have luggage storage?", "japanese": "荷物を預けることはできますか？"},
    {"english": "How much is the deposit?", "japanese": "デポジットはいくらですか？"},
    {"english": "Is there a nearby convenience store?", "japanese": "近くにコンビニはありますか？"},
    {"english": "Can I change to a non-smoking room?", "japanese": "禁煙ルームに変更できますか？"},
    {"english": "Do you have a map of the area?", "japanese": "この辺りの地図はありますか？"},
    {"english": "Can I get a copy of my bill?", "japanese": "請求書のコピーをもらえますか？"},
    {"english": "I think there's a problem with the air conditioning.", "japanese": "エアコンの調子が悪いようです。"},
    {"english": "My key card isn’t working.", "japanese": "ルームキーが使えません。"},
    {"english": "Can I have some extra towels?", "japanese": "タオルを追加でいただけますか？"},
    {"english": "Can you recommend a good restaurant nearby?", "japanese": "近くのおすすめのレストランを教えてもらえますか？"},
    {"english": "Where is the nearest ATM?", "japanese": "一番近いATMはどこですか？"},
    {"english": "I need to check out early. Is that possible?", "japanese": "早めのチェックアウトは可能ですか？"},
    {"english": "This hotel is amazing! I’ll leave a good review.", "japanese": "このホテル最高です！良いレビューを残します。"},
    {"english": "Thank you for the great hospitality.", "japanese": "素晴らしいおもてなしをありがとうございました。"}
  ]
},

{
  "title": "DisneyとUSOで \n(At WDW & Universal Studios)",
  "idioms": [
    {"english": "Rope drop", "japanese": "開園直後に入園する"},
    {"english": "Park hopper", "japanese": "複数のパークを1日で回る"},
    {"english": "Fast pass it", "japanese": "優先入場を使う"},
    {"english": "Ride the hype train", "japanese": "話題のアトラクションに乗る"},
    {"english": "Beat the crowds", "japanese": "混雑を避ける"},
    {"english": "Hold onto your hat", "japanese": "スリル満点！"},
    {"english": "Photo op", "japanese": "写真撮影のチャンス"},
    {"english": "Get soaked", "japanese": "びしょ濡れになる"},
    {"english": "Line up early", "japanese": "早めに並ぶ"},
    {"english": "Parked out", "japanese": "1日遊んでヘトヘト"},
    {"english": "Snack break", "japanese": "軽食タイム"},
    {"english": "Go all out", "japanese": "全力で楽しむ"},
    {"english": "Get the magic started", "japanese": "夢の国を満喫する"},
    {"english": "Stay till closing", "japanese": "閉園まで遊ぶ"},
    {"english": "VIP treatment", "japanese": "特別待遇を受ける"}
  ],
  "vocabulary": [
    {"english": "Theme park", "japanese": "テーマパーク"},
    {"english": "Park entrance", "japanese": "パークの入口"},
    {"english": "Park map", "japanese": "パークの地図"},
    {"english": "MagicBand", "japanese": "マジックバンド"},
    {"english": "Park ticket", "japanese": "パークチケット"},
    {"english": "Annual pass", "japanese": "年間パスポート"},
    {"english": "Park reservation", "japanese": "パーク予約"},
    {"english": "FastPass / Lightning Lane", "japanese": "ファストパス / ライトニングレーン"},
    {"english": "Virtual queue", "japanese": "バーチャルキュー"},
    {"english": "Standby line", "japanese": "通常の待機列"},
    {"english": "Single rider", "japanese": "シングルライダー"},
    {"english": "Character meet-and-greet", "japanese": "キャラクターグリーティング"},
    {"english": "Parade", "japanese": "パレード"},
    {"english": "Fireworks show", "japanese": "花火ショー"},
    {"english": "Ride wait time", "japanese": "アトラクションの待ち時間"},
    {"english": "Height requirement", "japanese": "身長制限"},
    {"english": "Park hopper pass", "japanese": "パークホッパーパス"},
    {"english": "Ride photo", "japanese": "アトラクションの写真"},
    {"english": "Locker rental", "japanese": "ロッカーのレンタル"},
    {"english": "Merchandise store", "japanese": "グッズショップ"},
    {"english": "Souvenir", "japanese": "お土産"},
    {"english": "Popcorn bucket", "japanese": "ポップコーンバケット"},
    {"english": "Dining reservation", "japanese": "レストランの予約"},
    {"english": "Mobile order", "japanese": "モバイルオーダー"},
    {"english": "Snack credit", "japanese": "スナッククレジット"},
    {"english": "All-you-can-eat buffet", "japanese": "食べ放題ビュッフェ"},
    {"english": "Character dining", "japanese": "キャラクターダイニング"},
    {"english": "Express Pass (USO)", "japanese": "エクスプレスパス（USO）"},
    {"english": "Hogwarts Express", "japanese": "ホグワーツ・エクスプレス"},
    {"english": "Butterbeer", "japanese": "バタービール"},
    {"english": "Wizarding World", "japanese": "ウィザーディング・ワールド"},
    {"english": "Jurassic Park ride", "japanese": "ジュラシック・パークのライド"},
    {"english": "Marvel Super Hero Island", "japanese": "マーベル・スーパーヒーロー・アイランド"}
  ],
  "grammar": [
    {"english": "What time does the park open?", "japanese": "パークは何時に開きますか？"},
    {"english": "Where can I buy tickets?", "japanese": "チケットはどこで買えますか？"},
    {"english": "Do I need a park reservation?", "japanese": "パークの予約は必要ですか？"},
    {"english": "How long is the wait for this ride?", "japanese": "このアトラクションの待ち時間はどれくらいですか？"},
    {"english": "Can I use the Lightning Lane for this ride?", "japanese": "このアトラクションでライトニングレーンは使えますか？"},
    {"english": "Where is the nearest restroom?", "japanese": "一番近いトイレはどこですか？"},
    {"english": "Do you have a map of the park?", "japanese": "パークの地図はありますか？"},
    {"english": "Where is the best place to watch the parade?", "japanese": "パレードを見るのに最適な場所はどこですか？"},
    {"english": "Is this ride scary?", "japanese": "このアトラクションは怖いですか？"},
    {"english": "Can I bring my own food?", "japanese": "食べ物を持ち込んでもいいですか？"},
    {"english": "Where can I meet Mickey Mouse?", "japanese": "ミッキーマウスに会えるのはどこですか？"},
    {"english": "Do I need a locker for this ride?", "japanese": "このアトラクションに乗るにはロッカーが必要ですか？"},
    {"english": "How much is an Express Pass?", "japanese": "エクスプレスパスはいくらですか？"},
    {"english": "Can I use my MagicBand to pay?", "japanese": "マジックバンドで支払いできますか？"},
    {"english": "Where can I get a Butterbeer?", "japanese": "バタービールはどこで買えますか？"},
    {"english": "Is there a refillable drink option?", "japanese": "飲み物のおかわり自由のオプションはありますか？"},
    {"english": "Where can I buy a souvenir cup?", "japanese": "お土産用のカップはどこで買えますか？"},
    {"english": "What’s the best way to get to Hogwarts?", "japanese": "ホグワーツに行くにはどうすればいいですか？"},
    {"english": "Can I get a front row seat for this ride?", "japanese": "このアトラクションの最前列に座れますか？"},
    {"english": "Is there a good spot to rest?", "japanese": "休憩するのに良い場所はありますか？"},
    {"english": "How late does the park stay open?", "japanese": "パークは何時まで開いていますか？"},
    {"english": "Do I need a separate ticket for this attraction?", "japanese": "このアトラクションには別のチケットが必要ですか？"},
    {"english": "Where can I charge my phone?", "japanese": "携帯を充電できる場所はどこですか？"},
    {"english": "That was the best ride ever!", "japanese": "今までで一番楽しいアトラクションだった！"},
    {"english": "I’m exhausted but that was worth it!", "japanese": "めちゃくちゃ疲れたけど、それだけの価値があった！"}
  ]
},

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('English',style: TextStyle(
            fontFamily: 'Merriweather',
            fontSize: 34,
            fontWeight: FontWeight.bold,
            color: Color(0xFFCCA092),
          ),)),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: phrasesByScene.length,
          itemBuilder: (context, index) {
            var category = phrasesByScene[index];
            return Card(
  elevation: 4,
  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 4),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(12)),
    child: Theme( // 🔽 Theme を適用して `dividerColor` を透明にする
    data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
  child: ExpansionTile(
    title: Text(
  category["title"],
  style: TextStyle(
    fontSize: 18,
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
    child: Row(
      children: [
        Icon(Icons.language, color: Colors.black54), // アイコン変更
        SizedBox(width: 8),
        Text(
          "イディオム (Idioms)",
          style: TextStyle(fontSize: 16,fontFamily: 'NotoSansJP',color: Color.fromARGB(255, 80, 68, 68), fontWeight: FontWeight.bold), 
        ),
      ],
    ),
  ),
  Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: LayoutBuilder(
      builder: (context, constraints) {
        double columnWidth = (constraints.maxWidth - 16) / 2; // 2列分割の幅を計算
        List<Widget> shortIdioms = []; // 短いイディオム（2列表示）
        List<Widget> longIdioms = []; // 長いイディオム（1列表示）

        for (var idiom in category["idioms"]) {
          bool isLongText = idiom["english"].length > 20 || idiom["japanese"].length > 20; // 長さ判定

          Widget idiomWidget = Container(
            width: isLongText ? double.infinity : columnWidth, // 長い場合は1列
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  idiom["english"],
                  style: TextStyle(
                    fontSize: 16,
                    color: Color.fromARGB(255, 125, 95, 95),
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  idiom["japanese"],
                  style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          );

          if (isLongText) {
            longIdioms.add(idiomWidget);
          } else {
            shortIdioms.add(idiomWidget);
          }
        }

        // 2列用のリストを作成
        List<Widget> shortIdiomRows = [];
        for (int i = 0; i < shortIdioms.length; i += 2) {
          if (i + 1 < shortIdioms.length) {
            shortIdiomRows.add(Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [shortIdioms[i], shortIdioms[i + 1]],
            ));
          } else {
            shortIdiomRows.add(Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [shortIdioms[i]],
            ));
          }
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ...shortIdiomRows, // まず短いイディオム（2列）
            if (longIdioms.isNotEmpty) SizedBox(height: 16), // 2列と1列の間にスペース
            ...longIdioms, // その後に長いイディオム（1列）
          ],
        );
      },
    ),
  ),


// 🔽 追加した部分 (イディオムと単語の間に線を表示)
  Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: Divider(
      color: Color.fromARGB(255, 198, 180, 180), // 薄いグレー
      thickness: 1, // 線の太さを1pxに設定
    ),
  ),
  SizedBox(height: 12), // 余白を追加
],

if (category["vocabulary"] != null) ...[
  Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
    child: Row(
      children: [
        Icon(Icons.book, color: Colors.black54), // アイコン変更
        SizedBox(width: 8),
        Text(
          "単語 (Vocabulary)",
          style: TextStyle(fontSize: 16, fontFamily: 'NotoSansJP', color: Color.fromARGB(255, 80, 68, 68), fontWeight: FontWeight.bold), 
        ),
      ],
    ),
  ),
  Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: LayoutBuilder(
      builder: (context, constraints) {
        double columnWidth = (constraints.maxWidth - 16) / 2; // 2列の幅を計算
        List<Widget> shortWords = []; // 短い単語（2列表示）
        List<Widget> longWords = []; // 長い単語（1列表示）

        for (var word in category["vocabulary"]) {
          bool isLongText = word["english"].length > 20 || word["japanese"].length > 20; // 長さ判定

          Widget wordWidget = Container(
            width: isLongText ? double.infinity : columnWidth, // 長い場合は1列
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  word["english"],
                  style: TextStyle(
                    fontSize: 16,
                    color: Color.fromARGB(255, 125, 95, 95),
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  word["japanese"],
                  style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          );

          if (isLongText) {
            longWords.add(wordWidget);
          } else {
            shortWords.add(wordWidget);
          }
        }

        // 2列用のリストを作成
        List<Widget> shortWordRows = [];
        for (int i = 0; i < shortWords.length; i += 2) {
          if (i + 1 < shortWords.length) {
            shortWordRows.add(Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [shortWords[i], shortWords[i + 1]],
            ));
          } else {
            shortWordRows.add(Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [shortWords[i]],
            ));
          }
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ...shortWordRows, // まず短い単語（2列）
            if (longWords.isNotEmpty) SizedBox(height: 16), // 2列と1列の間にスペース
            ...longWords, // その後に長い単語（1列）
          ],
        );
      },
    ),
  ),
// 🔽 追加した部分 (イディオムと単語の間に線を表示)
  Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: Divider(
      color: Color.fromARGB(255, 198, 180, 180), // 薄いグレー
      thickness: 1, // 線の太さを1pxに設定
    ),
  ),
  SizedBox(height: 12), // 余白を追加
],

      // 文法セクション
      if (category["grammar"] != null) ...[
  Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
    child: Row(
      children: [
        Icon(Icons.menu_book, color: Colors.black54), // アイコン変更
        SizedBox(width: 8),
        Text(
          "文法 (Grammar)",
          style: TextStyle(fontSize: 16, fontFamily: 'NotoSansJP', color: Color.fromARGB(255, 80, 68, 68), fontWeight: FontWeight.bold), 
        ),
      ],
    ),
  ),
  Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: LayoutBuilder(
      builder: (context, constraints) {
        double columnWidth = (constraints.maxWidth - 16) / 2; // 2列の幅を計算
        List<Widget> shortRules = []; // 短い文法ルール（2列表示）
        List<Widget> longRules = []; // 長い文法ルール（1列表示）

        for (var rule in category["grammar"]) {
          bool isLongText = rule["english"].length > 20 || rule["japanese"].length > 20; // 長さ判定

          Widget ruleWidget = Container(
            width: isLongText ? double.infinity : columnWidth, // 長い場合は1列
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  rule["english"],
                  style: TextStyle(
                    fontSize: 16,
                    color: Color.fromARGB(255, 125, 95, 95),
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  rule["japanese"],
                  style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          );

          if (isLongText) {
            longRules.add(ruleWidget);
          } else {
            shortRules.add(ruleWidget);
          }
        }

        // 2列用のリストを作成
        List<Widget> shortRuleRows = [];
        for (int i = 0; i < shortRules.length; i += 2) {
          if (i + 1 < shortRules.length) {
            shortRuleRows.add(Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [shortRules[i], shortRules[i + 1]],
            ));
          } else {
            shortRuleRows.add(Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [shortRules[i]],
            ));
          }
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ...shortRuleRows, // まず短い文法ルール（2列）
            if (longRules.isNotEmpty) SizedBox(height: 16), // 2列と1列の間にスペース
            ...longRules, // その後に長い文法ルール（1列）
          ],
        );
      },
    ),
  ),
],

      // if (category["grammar"] != null) ...[
      //   Padding(
      //     padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      //     child: Text("📚 文法 (Grammar)", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      //   ),
      //   ...category["grammar"].map<Widget>((rule) {
      //     return ListTile(
      //       title: Text(rule["english"], style: TextStyle(fontSize: 16, color: const Color.fromARGB(255, 57, 56, 56), fontWeight: FontWeight.bold)),
      //       subtitle: Text(rule["japanese"], style: TextStyle(fontSize: 14, color: Colors.grey[700])),
      //     );
      //   }).toList(),
      // ],
    ],
  ),
    ),
);

          },
        ),
      ),
    );
  }
}

