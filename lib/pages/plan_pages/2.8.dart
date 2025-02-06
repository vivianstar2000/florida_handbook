import 'package:flutter/material.dart';


class PlanPage28 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '2.8 (Sat.)',
          style: TextStyle(
            fontFamily: 'Nunito',
            fontSize: 34,
            fontWeight: FontWeight.w800,
            color: Color(0xFFCCA092),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.zero,
        child: ListView(
          children: [
            _buildday1Card1(),
            _buildday1Card2(),
            _buildday1Card3(),
            _buildday1Card4(),
            _buildday1Card5(),
            _buildday1Card6(),
            _buildday1Card7(),
            _buildday1Card8(),
            _buildday1Card9(),
            _buildday1Card10(),
            _buildday1Card11(),
            _buildday1Card12(),
            _buildday1Card13(),
            _buildday1Card14(),
            _buildday1Card15(),
          ],
        ),
      ),
    );
  }

  //----------------------------------------------------------//

  // 1つ目のカード: 起床
Widget _buildday1Card1() {
  return Card(
    color: Colors.transparent,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    elevation: 0,
    child: Padding(
      padding: const EdgeInsets.only(left: 20, right: 10, top: 5, bottom: 5),
      child: Row(
        children: [
          // 1列目: アイコン
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [ Image.asset(
                'assets/iconbox/sun.png',
                width: 30,
                height: 30,
              ),],
            ),
          ),
          // 2列目: 時間
          Expanded(
            flex: 3,
            child: Center(
              child:Text(
                '03:00 a.m.',
              style: TextStyle(
                    fontFamily: 'Nunito',
                    fontSize: 14,
                    fontWeight: FontWeight.w900,
                    color: Color(0xFFa5a4a4),
                  ),),
            ),
          ),
          // 2列目: テキスト1 (左寄せ)
          Expanded(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
  text: TextSpan(
    children: [
      TextSpan(
        text: '起きる\n',
        style: TextStyle(
          fontFamily: 'NotoSansJP',
          fontSize: 16, // メインのフォントサイズ
          fontWeight: FontWeight.bold,
          color: Color(0xFFd3b2a7),
        ),
      ),
      TextSpan(
        text: '(時差調整のために早く起きる)',
        style: TextStyle(
          fontFamily: 'NotoSansJP',
          fontSize: 12, // 小さくしたいフォントサイズ
          fontWeight: FontWeight.normal,
          color: Color(0xFF737373),
        ),
      ),
    ],
  ),
),

              ],
            ),
          ),
        ],
      ),
    ),
  );
}

// 2つ目のカード: 準備
Widget _buildday1Card2() {
  return Card(
    color: Colors.transparent,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    elevation: 0,
    child: Padding(
      padding: const EdgeInsets.only(left: 20, right: 10, top: 5, bottom: 5),
      child: Row(
        children: [
          // 1列目: アイコン
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [ Image.asset(
                'assets/iconbox/home.png',
                width: 30,
                height: 30,
              ),],
            ),
          ),
          // 2列目: 時間
          Expanded(
            flex: 3,
            child: Center(
              child:Text(
                '03:00 a.m.\n        |\n06:55 a.m.',
              style: TextStyle(
                    fontFamily: 'Nunito',
                    fontSize: 14,
                    fontWeight: FontWeight.w900,
                    color: Color(0xFFa5a4a4),
                  ),),
            ),
          ),
          // 2列目: テキスト1 (左寄せ)
          Expanded(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
  text: TextSpan(
    children: [
      TextSpan(
        text: '準備と最終確認\n',
        style: TextStyle(
          fontFamily: 'NotoSansJP',
          fontSize: 16, // メインのフォントサイズ
          fontWeight: FontWeight.bold,
          color: Color(0xFFd3b2a7),
        ),
      ),
      TextSpan(
        text: '自分のメイクとryudaiの準備の最終確認。\nあと、飛行機で観たいコンテンツをDLする',
        style: TextStyle(
          fontFamily: 'NotoSansJP',
          fontSize: 12, // 小さくしたいフォントサイズ
          fontWeight: FontWeight.normal,
          color: Color(0xFF737373),
        ),
      ),
    ],
  ),
),

              ],
            ),
          ),
        ],
      ),
    ),
  );
}

// 3つ目のカード: 電車で羽田空港へ
Widget _buildday1Card3() {
  return Card(
    color: Colors.transparent,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    elevation: 0,
    child: Padding(
      padding: const EdgeInsets.only(left: 20, right: 10, top: 5, bottom: 5),
      child: Row(
        children: [
          // 1列目: アイコン
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [ Image.asset(
                'assets/iconbox/train.png',
                width: 30,
                height: 30,
              ),],
            ),
          ),
          // 2列目: 時間
          Expanded(
            flex: 3,
            child: Center(
              child:Text(
                '07:00 a.m.',
              style: TextStyle(
                    fontFamily: 'Nunito',
                    fontSize: 14,
                    fontWeight: FontWeight.w900,
                    color: Color(0xFFa5a4a4),
                  ),),
            ),
          ),
          // 2列目: テキスト1 (左寄せ)
          Expanded(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
  text: TextSpan(
    children: [
      TextSpan(
        text: '旗の台→羽田空港第3ターミナル\n',
        style: TextStyle(
          fontFamily: 'NotoSansJP',
          fontSize: 16, // メインのフォントサイズ
          fontWeight: FontWeight.bold,
          color: Color(0xFFd3b2a7),
        ),
      ),
      TextSpan(
        text: '↓ルート\n7:01  旗の台駅\n|          [大井町線 各停大井町行]\n|\n7:09  大井町駅\n7:13  大井町駅\n|          [京浜東北線 各停大宮行:1 番ホーム]\n|\n7:23  浜松町駅\n7:30  モノレール浜松町駅\n|           [東京モノレール\n|            空港快速羽田空港第２ターミナル行\n|            1 番ホーム]\n|\n7:43  羽田空港第3ターミナル駅\n　※8:00までにはHNDに到着したい',
        style: TextStyle(
          fontFamily: 'NotoSansJP',
          fontSize: 12, // 小さくしたいフォントサイズ
          fontWeight: FontWeight.normal,
          color: Color(0xFF737373),
        ),
      ),
    ],
  ),
),

              ],
            ),
          ),
        ],
      ),
    ),
  );
}

// 4つ目のカード: 羽田空港で
Widget _buildday1Card4() {
  return Card(
    color: Colors.transparent,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    elevation: 0,
    child: Padding(
      padding: const EdgeInsets.only(left: 20, right: 10, top: 5, bottom: 5),
      child: Row(
        children: [
          // 1列目: アイコン
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/iconbox/airport.png',
                  width: 30,
                  height: 30,
                ),
              ],
            ),
          ),
          // 2列目: 時間
          Expanded(
            flex: 3,
            child: Center(
              child: Text(
                '08:00 a.m.',
                style: TextStyle(
                  fontFamily: 'Nunito',
                  fontSize: 14,
                  fontWeight: FontWeight.w900,
                  color: Color(0xFFa5a4a4),
                ),
              ),
            ),
          ),
          // 3列目: テキスト1 (左寄せ)
          Expanded(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '羽田空港第3ターミナル\n  /空港さんぽ\n',
                        style: TextStyle(
                          fontFamily: 'NotoSansJP',
                          fontSize: 16, // メインのフォントサイズ
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFd3b2a7),
                        ),
                      ),
                      TextSpan(
                        text: '飛行機の中で食べたい物などを買ってもいい。ゲート内にもあるからそこは見極めて',
                        style: TextStyle(
                          fontFamily: 'NotoSansJP',
                          fontSize: 12, // 小さくしたいフォントサイズ
                          fontWeight: FontWeight.normal,
                          color: Color(0xFF737373),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

// 5つ目のカード: チェックイン
Widget _buildday1Card5() {
  return Card(
    color: Colors.transparent,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    elevation: 0,
    child: Padding(
      padding: const EdgeInsets.only(left: 20, right: 10, top: 5, bottom: 5),
      child: Row(
        children: [
          // 1列目: アイコン
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/iconbox/check.png',
                  width: 30,
                  height: 30,
                ),
              ],
            ),
          ),
          // 2列目: 時間
          Expanded(
            flex: 3,
            child: Center(
              child: Text(
                '08:30 a.m.',
                style: TextStyle(
                  fontFamily: 'Nunito',
                  fontSize: 14,
                  fontWeight: FontWeight.w900,
                  color: Color(0xFFa5a4a4),
                ),
              ),
            ),
          ),
          // 3列目: テキスト1 (左寄せ)
          Expanded(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '  /チェックイン・出国手続き\n',
                        style: TextStyle(
                          fontFamily: 'NotoSansJP',
                          fontSize: 16, // メインのフォントサイズ
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFd3b2a7),
                        ),
                      ),
                      TextSpan(
                        text: 'faceidの設定ができたらしたい。水は持って入れないよ。\n※預け入れ荷物のバーコードをスクショする!',
                        style: TextStyle(
                          fontFamily: 'NotoSansJP',
                          fontSize: 12, // 小さくしたいフォントサイズ
                          fontWeight: FontWeight.normal,
                          color: Color(0xFF737373),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

// 6つ目のカード: 待ち
Widget _buildday1Card6() {
  return Card(
    color: Colors.transparent,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    elevation: 0,
    child: Padding(
      padding: const EdgeInsets.only(left: 20, right: 10, top: 5, bottom: 5),
      child: Row(
        children: [
          // 1列目: アイコン
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/iconbox/aviation.png',
                  width: 30,
                  height: 30,
                ),
              ],
            ),
          ),
          // 2列目: 時間
          Expanded(
            flex: 3,
            child: Center(
              child: Text(
                '09:30 a.m.\n        |\n10:00 a.m.',
                style: TextStyle(
                  fontFamily: 'Nunito',
                  fontSize: 14,
                  fontWeight: FontWeight.w900,
                  color: Color(0xFFa5a4a4),
                ),
              ),
            ),
          ),
          // 3列目: テキスト1 (左寄せ)
          Expanded(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '  /お買い物&ラウンジ\n',
                        style: TextStyle(
                          fontFamily: 'NotoSansJP',
                          fontSize: 16, // メインのフォントサイズ
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFd3b2a7),
                        ),
                      ),
                      TextSpan(
                        text: 'ここで買ったお水は飛行機に持っていけるはず。',
                        style: TextStyle(
                          fontFamily: 'NotoSansJP',
                          fontSize: 12, // 小さくしたいフォントサイズ
                          fontWeight: FontWeight.normal,
                          color: Color(0xFF737373),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

// 7つ目のカード: ゲート前で
Widget _buildday1Card7() {
  return Card(
    color: Colors.transparent,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    elevation: 0,
    child: Padding(
      padding: const EdgeInsets.only(left: 20, right: 10, top: 5, bottom: 5),
      child: Row(
        children: [
          // 1列目: アイコン
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/iconbox/passport2.png',
                  width: 30,
                  height: 30,
                ),
              ],
            ),
          ),
          // 2列目: 時間
          Expanded(
            flex: 3,
            child: Center(
              child: Text(
                '10:00 a.m.\n        |\n10:55 a.m.',
                style: TextStyle(
                  fontFamily: 'Nunito',
                  fontSize: 14,
                  fontWeight: FontWeight.w900,
                  color: Color(0xFFa5a4a4),
                ),
              ),
            ),
          ),
          // 3列目: テキスト1 (左寄せ)
          Expanded(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '  /搭乗ゲートの前で待機\n',
                        style: TextStyle(
                          fontFamily: 'NotoSansJP',
                          fontSize: 16, // メインのフォントサイズ
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFd3b2a7),
                        ),
                      ),
                      TextSpan(
                        text: '自分の番が来るまで待つ\n多分最後の回',
                        style: TextStyle(
                          fontFamily: 'NotoSansJP',
                          fontSize: 12, // 小さくしたいフォントサイズ
                          fontWeight: FontWeight.normal,
                          color: Color(0xFF737373),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

// 8つ目のカード: 離陸
Widget _buildday1Card8() {
  return Card(
    color: Colors.transparent,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    elevation: 0,
    child: Padding(
      padding: const EdgeInsets.only(left: 20, right: 10, top: 5, bottom: 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start, // ← ここを追加
        children: [
          // 1列目: アイコン
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start, // 追加
              children: [
                SizedBox(height: 5,),
                Image.asset(
                  'assets/iconbox/ririku.png',
                  width: 30,
                  height: 30,
                ),
              ],
            ),
          ),
          // 2列目: 時間
          Expanded(
            flex: 3,
            child: Column( // Center ではなく Column に変更
            mainAxisAlignment: MainAxisAlignment.start, // 追加Text(
            children: [
              SizedBox(height: 10,),
              Text(
                '10:55 a.m.\n\n\n\n    -15h',
                style: TextStyle(
                  fontFamily: 'Nunito',
                  fontSize: 16,
                  fontWeight: FontWeight.w900,
                  color: Color(0xFFd78282),
                ),
              ),
            ],
            ),
          ),
          // 3列目: テキスト1 (左寄せ)
          Expanded(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'HND → DFW\n',
                        style: TextStyle(
                          fontFamily: 'NotoSansJP',
                          fontSize: 24, // メインのフォントサイズ
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFd3b2a7),
                        ),
                      ),
                      TextSpan(
                        text: 
'''≫詳細
  羽田空港第3ターミナル,HND
         [AA8478,JL0012,MH9138] 
          ※コードシェア便 JALが運行
          Airbus A350

          [seats]  vivian  ▶︎ 58A
                          ryudai ▶︎ 58B''',
                        style: TextStyle(
                          fontFamily: 'NotoSansJP',
                          fontSize: 12, // 小さくしたいフォントサイズ
                          fontWeight: FontWeight.normal,
                          color: Color(0xFF737373),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

// 9つ目のカード: 着陸
Widget _buildday1Card9() {
  return Card(
    color: Colors.transparent,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    elevation: 0,
    child: Padding(
      padding: const EdgeInsets.only(left: 20, right: 10, top: 5, bottom: 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start, // ← ここを追加
        children: [
          // 1列目: アイコン
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start, // 追加
              children: [
                SizedBox(height: 5,),
                Image.asset(
                  'assets/iconbox/tyakuriku.png',
                  width: 30,
                  height: 30,
                ),
              ],
            ),
          ),
          // 2列目: 時間
          Expanded(
            flex: 3,
            child: Column( // Center ではなく Column に変更
            mainAxisAlignment: MainAxisAlignment.start, // 追加Text(
            children: [
              SizedBox(height: 10,),
              Text(
                '07:35 a.m.',
                style: TextStyle(
                  fontFamily: 'Nunito',
                  fontSize: 16,
                  fontWeight: FontWeight.w900,
                  color: Color(0xFFd78282),
                ),
              ),
            ],
            ),
          ),
          // 3列目: テキスト1 (左寄せ)
          Expanded(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'HND → DFW\n',
                        style: TextStyle(
                          fontFamily: 'NotoSansJP',
                          fontSize: 24, // メインのフォントサイズ
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFd3b2a7),
                        ),
                      ),
                      TextSpan(
                        text: 
'''≫詳細
  ダラス・フォートワース国際空港,DFW
     [ターミナルDに到着]''',
                        style: TextStyle(
                          fontFamily: 'NotoSansJP',
                          fontSize: 12, // 小さくしたいフォントサイズ
                          fontWeight: FontWeight.normal,
                          color: Color(0xFF737373),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

// 10つ目のカード: ゲート前で
Widget _buildday1Card10() {
  return Card(
    color: Colors.transparent,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    elevation: 0,
    child: Padding(
      padding: const EdgeInsets.only(left: 20, right: 10, top: 5, bottom: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start, // ← ここを追加
        children: [
          // 1列目: アイコン
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start, // 追加
              children: [
                SizedBox(height: 5,),
                Image.asset(
                  'assets/iconbox/check.png',
                  width: 30,
                  height: 30,
                ),
              ],
            ),
          ),
          // 2列目: 時間
          Expanded(
            flex: 3,
            child: Column( // Center ではなく Column に変更
            mainAxisAlignment: MainAxisAlignment.start, // 追加Text(
            children: [
              SizedBox(height: 10,),
              Text(
                '07:35 a.m.',
                style: TextStyle(
                  fontFamily: 'Nunito',
                  fontSize: 14,
                  fontWeight: FontWeight.w900,
                  color: Color(0xFFa5a4a4),
                ),
              ),
            ],
            ),
          ),
          // 3列目: テキスト1 (左寄せ)
          Expanded(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'ダラス・フォートワース国際空港\n  /アメリカ入国審査\n',
                        style: TextStyle(
                          fontFamily: 'NotoSansJP',
                          fontSize: 16, // メインのフォントサイズ
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFd3b2a7),
                        ),
                      ),
                      TextSpan(
                        text: '''    viviはアメリカ人の列に並ぶ。
    ryudaiは外国から来た人の列に並ぶ。
    
      <覚えておくこと>
      ・アメリカに来た目的/行くよての街
      ・滞在期間&場所 
      ・帰りのチケットはあるか？
      ・日本での仕事
      ・予算は現金でいくら持っているか？''',
                        style: TextStyle(
                          fontFamily: 'NotoSansJP',
                          fontSize: 12, // 小さくしたいフォントサイズ
                          fontWeight: FontWeight.normal,
                          color: Color(0xFF737373),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

// 11つ目のカード: 5hまち
Widget _buildday1Card11() {
  return Card(
    color: Colors.transparent,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    elevation: 0,
    child: Padding(
      padding: const EdgeInsets.only(left: 20, right: 10, top: 5, bottom: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start, // ← ここを追加
        children: [
          // 1列目: アイコン
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start, // 追加
              children: [
                SizedBox(height: 5,),
                Image.asset(
                  'assets/iconbox/baggage-carousel.png',
                  width: 30,
                  height: 30,
                ),
              ],
            ),
          ),
          // 2列目: 時間
          Expanded(
            flex: 3,
            child: Column( // Center ではなく Column に変更
            mainAxisAlignment: MainAxisAlignment.start, // 追加Text(
            children: [
              SizedBox(height: 5,),
              Text(
                'next',
                style: TextStyle(
                  fontFamily: 'Nunito',
                  fontSize: 14,
                  fontWeight: FontWeight.w900,
                  color: Color(0xFFa5a4a4),
                ),
              ),
            ],
            ),
          ),
          // 3列目: テキスト1 (左寄せ)
          Expanded(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: ' /Baggage claim\n',
                        style: TextStyle(
                          fontFamily: 'NotoSansJP',
                          fontSize: 16, // メインのフォントサイズ
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFd3b2a7),
                        ),
                      ),
                      TextSpan(
                        text: '''ターンテーブルから一旦受け取って税関（Customs）を通過する。
（Baggage Recheck）で渡せばOK
タグはペンサコーラ行きになっているか確認''',
                        style: TextStyle(
                          fontFamily: 'NotoSansJP',
                          fontSize: 12, // 小さくしたいフォントサイズ
                          fontWeight: FontWeight.normal,
                          color: Color(0xFF737373),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

// 12つ目のカード: 5hまち
Widget _buildday1Card12() {
  return Card(
    color: Colors.transparent,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    elevation: 0,
    child: Padding(
      padding: const EdgeInsets.only(left: 20, right: 10, top: 5, bottom: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start, // ← ここを追加
        children: [
          // 1列目: アイコン
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start, // 追加
              children: [
                SizedBox(height: 5,),
                Image.asset(
                  'assets/iconbox/airport.png',
                  width: 30,
                  height: 30,
                ),
              ],
            ),
          ),
          // 2列目: 時間
          Expanded(
            flex: 3,
            child: Column( // Center ではなく Column に変更
            mainAxisAlignment: MainAxisAlignment.start, // 追加Text(
            children: [
              SizedBox(height: 5,),
              Text(
                'next',
                style: TextStyle(
                  fontFamily: 'Nunito',
                  fontSize: 14,
                  fontWeight: FontWeight.w900,
                  color: Color(0xFFa5a4a4),
                ),
              ),
            ],
            ),
          ),
          // 3列目: テキスト1 (左寄せ)
          Expanded(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: ' /5h待ちのため空港さんぽ\n',
                        style: TextStyle(
                          fontFamily: 'NotoSansJP',
                          fontSize: 16, // メインのフォントサイズ
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFd3b2a7),
                        ),
                      ),
                      TextSpan(
                        text: '''だら空港は広いので何か食べてもいいかも。''',
                        style: TextStyle(
                          fontFamily: 'NotoSansJP',
                          fontSize: 12, // 小さくしたいフォントサイズ
                          fontWeight: FontWeight.normal,
                          color: Color(0xFF737373),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

// 13つ目のカード: チェックイン
Widget _buildday1Card13() {
  return Card(
    color: Colors.transparent,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    elevation: 0,
    child: Padding(
      padding: const EdgeInsets.only(left: 20, right: 10, top: 5, bottom: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start, // ← ここを追加
        children: [
          // 1列目: アイコン
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start, // 追加
              children: [
                SizedBox(height: 5,),
                Image.asset(
                  'assets/iconbox/check.png',
                  width: 30,
                  height: 30,
                ),
              ],
            ),
          ),
          // 2列目: 時間
          Expanded(
            flex: 3,
            child: Column( // Center ではなく Column に変更
            mainAxisAlignment: MainAxisAlignment.start, // 追加Text(
            children: [
              SizedBox(height: 5,),
              Text(
                '11:00 a.m.',
                style: TextStyle(
                  fontFamily: 'Nunito',
                  fontSize: 14,
                  fontWeight: FontWeight.w900,
                  color: Color(0xFFa5a4a4),
                ),
              ),
            ],
            ),
          ),
          // 3列目: テキスト1 (左寄せ)
          Expanded(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: ' /セキュリテイーチェック開始\n',
                        style: TextStyle(
                          fontFamily: 'NotoSansJP',
                          fontSize: 16, // メインのフォントサイズ
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFd3b2a7),
                        ),
                      ),
                      TextSpan(
                        text: '''次の飛行機がターミナルBなので、Skylinkに乗って移動する。
  余裕を持って移動する''',
                        style: TextStyle(
                          fontFamily: 'NotoSansJP',
                          fontSize: 12, // 小さくしたいフォントサイズ
                          fontWeight: FontWeight.normal,
                          color: Color(0xFF737373),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

// 14つ目のカード: 待機
Widget _buildday1Card14() {
  return Card(
    color: Colors.transparent,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    elevation: 0,
    child: Padding(
      padding: const EdgeInsets.only(left: 20, right: 10, top: 5, bottom: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start, // ← ここを追加
        children: [
          // 1列目: アイコン
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start, // 追加
              children: [
                SizedBox(height: 5,),
                Image.asset(
                  'assets/iconbox/aviation.png',
                  width: 30,
                  height: 30,
                ),
              ],
            ),
          ),
          // 2列目: 時間
          Expanded(
            flex: 3,
            child: Column( // Center ではなく Column に変更
            mainAxisAlignment: MainAxisAlignment.start, // 追加Text(
            children: [
              SizedBox(height: 5,),
              Text(
                '11:30 a.m.',
                style: TextStyle(
                  fontFamily: 'Nunito',
                  fontSize: 14,
                  fontWeight: FontWeight.w900,
                  color: Color(0xFFa5a4a4),
                ),
              ),
            ],
            ),
          ),
          // 3列目: テキスト1 (左寄せ)
          Expanded(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: ' /ゲート内でお買い物\n',
                        style: TextStyle(
                          fontFamily: 'NotoSansJP',
                          fontSize: 16, // メインのフォントサイズ
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFd3b2a7),
                        ),
                      ),
                      TextSpan(
                        text: '''ここで購入したものは飛行機に持って入れる''',
                        style: TextStyle(
                          fontFamily: 'NotoSansJP',
                          fontSize: 12, // 小さくしたいフォントサイズ
                          fontWeight: FontWeight.normal,
                          color: Color(0xFF737373),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

// 15つ目のカード: 待機
Widget _buildday1Card15() {
  return Card(
    color: Colors.transparent,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    elevation: 0,
    child: Padding(
      padding: const EdgeInsets.only(left: 20, right: 10, top: 5, bottom: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start, // ← ここを追加
        children: [
          // 1列目: アイコン
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start, // 追加
              children: [
                SizedBox(height: 5,),
                Image.asset(
                  'assets/iconbox/passport2.png',
                  width: 30,
                  height: 30,
                ),
              ],
            ),
          ),
          // 2列目: 時間
          Expanded(
            flex: 3,
            child: Column( // Center ではなく Column に変更
            mainAxisAlignment: MainAxisAlignment.start, // 追加Text(
            children: [
              SizedBox(height: 5,),
              Text(
                '12:00 p.m.',
                style: TextStyle(
                  fontFamily: 'Nunito',
                  fontSize: 14,
                  fontWeight: FontWeight.w900,
                  color: Color(0xFFa5a4a4),
                ),
              ),
            ],
            ),
          ),
          // 3列目: テキスト1 (左寄せ)
          Expanded(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: ' /搭乗ゲートの前で待機\n',
                        style: TextStyle(
                          fontFamily: 'NotoSansJP',
                          fontSize: 16, // メインのフォントサイズ
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFd3b2a7),
                        ),
                      ),
                      TextSpan(
                        text: '''自分の番が来るまで待つ
  今回は多分最後ではないはず...''',
                        style: TextStyle(
                          fontFamily: 'NotoSansJP',
                          fontSize: 12, // 小さくしたいフォントサイズ
                          fontWeight: FontWeight.normal,
                          color: Color(0xFF737373),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

}