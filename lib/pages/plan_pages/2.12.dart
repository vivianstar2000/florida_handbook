import 'package:flutter/material.dart';


class PlanPage212 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '2.12 (Wed.)',
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
            _buildday1Card16(),
            _buildday1Card17(),
            _buildday1Card18(),
            _buildday1Card19(),
            _buildday1Card20(),
            _buildday1Card21(),
            _buildday1Card22(),
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
                '06:00 a.m.',
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
        text: 'みんなは大体05:30-06:30に起きるよ\n',
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

// 2つ目のカード: まったりタイム
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
                '06:00 a.m.\n        |\n07:30 a.m.',
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
        text: 'まったりタイム\n',
        style: TextStyle(
          fontFamily: 'NotoSansJP',
          fontSize: 16, // メインのフォントサイズ
          fontWeight: FontWeight.bold,
          color: Color(0xFFd3b2a7),
        ),
      ),
      TextSpan(
        text: 'theアメリカンなモーニングを満喫。\nコーヒー片手にみんなとお話し',
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
                'assets/iconbox/restaurant.png',
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
                '07:30 a.m.\n        |\n08:00 a.m.',
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
        text: 'Breakfast\n',
        style: TextStyle(
          fontFamily: 'NotoSansJP',
          fontSize: 16, // メインのフォントサイズ
          fontWeight: FontWeight.bold,
          color: Color(0xFFd3b2a7),
        ),
      ),
      TextSpan(
        text: '朝ごはんはキッチンで準備し始まったら10分くらいで始まるよ。\n',
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
                  'assets/iconbox/shower.png',
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
                '08:00 a.m.\n        |\n09:30 a.m.',
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
                        text: 'シャワーとメイク\n',
                        style: TextStyle(
                          fontFamily: 'NotoSansJP',
                          fontSize: 16, // メインのフォントサイズ
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFd3b2a7),
                        ),
                      ),
                      TextSpan(
                        text: 'シャワーは基本的には朝など、出かける前に行う習慣があります。\nおばあちゃんは1日中家にいるので夕方に洗ったりするよ\n09:30までに準備を終わらせてカウチにいることをお勧めする。',
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
                  'assets/iconbox/log-out.png',
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
                '09:30 a.m.',
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
                        text: 'お出かけに行くよ！\n',
                        style: TextStyle(
                          fontFamily: 'NotoSansJP',
                          fontSize: 16, // メインのフォントサイズ
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFd3b2a7),
                        ),
                      ),
                      TextSpan(
                        text: 'お出かけ先はその日に決まるので、会話に注意してね！\n　この日は移動もするので時間に注意！',
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

// 6つ目のカード: 空港に向かう
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
                  'assets/iconbox/car.png',
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
                '02:00 p.m.\n        |\n03:00 p.m.',
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
                        text: 'PNS空港に向かう\n',
                        style: TextStyle(
                          fontFamily: 'NotoSansJP',
                          fontSize: 16, // メインのフォントサイズ
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFd3b2a7),
                        ),
                      ),
                      TextSpan(
                        text: '03:00 p.m. 前につけると安心だな',
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
                '03:00 p.m.\n        |\n03:30 p.m.',
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
                        text: ' //セキュリティーチェック\n',
                        style: TextStyle(
                          fontFamily: 'NotoSansJP',
                          fontSize: 16, // メインのフォントサイズ
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFd3b2a7),
                        ),
                      ),
                      TextSpan(
                        text: '前の日にオンラインチェックインをしておくといい。',
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

// 8つ目のカード: 待機
Widget _buildday1Card8() {
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
                '03:30 p.m.',
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

// 9つ目のカード: 離陸
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
                '04:03 p.m.\n',
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
                        text: 'PNS → MIA\n',
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
  Pensacola International Airport,PNS
         [AA3762] 
          Embraer 175

          [seats]  vivian  ▶︎ 16F
                          ryudai ▶︎ 16F''',
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

// 10つ目のカード: 着陸
Widget _buildday1Card10() {
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
                '06:49 p.m.',
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
                        text: 'PNS → MIA\n',
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
  Miami International Airport,MIA
     どのターミナルにつくかわからないので、注意！''',
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

// 11つ目のカード: ゲート前で
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

// 13つ目のカード: 5hまち
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

// 14つ目のカード: チェックイン
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

// 16つ目のカード: 離陸
Widget _buildday1Card16() {
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
                '13:01 p.m.',
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
                        text: 'DFW → PNS\n',
                        style: TextStyle(
                          fontFamily: 'NotoSansJP',
                          fontSize: 24, // メインのフォントサイズ
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFd3b2a7),
                        ),
                      ),
                      TextSpan(
                        text: '''
 ≫詳細
　ダラス・フォートワース国際空港
                                                      ターミナルB,DFW
  　　 [AA3490]
  　　  Embraer 175

  　　 [seats] vivian ▶︎ 17F
  　　　 　 　ryudai ▶︎ 17D''',
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

// 17つ目のカード: 着陸
Widget _buildday1Card17() {
  return Card(
    color: Colors.transparent,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    elevation: 0,
    child: Padding(
      padding: const EdgeInsets.only(left: 20, right: 10, top: 0, bottom: 5),
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
                '14:46 p.m.',
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
                        text: 'DFW → PNS\n',
                        style: TextStyle(
                          fontFamily: 'NotoSansJP',
                          fontSize: 24, // メインのフォントサイズ
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFd3b2a7),
                        ),
                      ),
                      TextSpan(
                        text: '''
 ≫詳細
　ペンサコーラ国際空港,PNS''',
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

// 18つ目のカード: パパに会う
Widget _buildday1Card18() {
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
  SizedBox(height: 0,),
  Container(
    width: 50, // 正方形のサイズ指定
    height: 50,
    decoration: BoxDecoration(
      shape: BoxShape.circle, // 丸い形にする
      image: DecorationImage(
        image: AssetImage('assets/dennis.jpeg'),
        fit: BoxFit.cover, // 枠いっぱいに画像を表示
      ),
    ),
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
                '15:00 p.m.',
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
                        text: 'パパが迎えに来る\n',
                        style: TextStyle(
                          fontFamily: 'NotoSansJP',
                          fontSize: 16, // メインのフォントサイズ
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFd3b2a7),
                        ),
                      ),
                      TextSpan(
                        text: '''
　パパが迎えにきたら、baggage claimに行く''',
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

// 19つ目のカード: お家に行く
Widget _buildday1Card19() {
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
                  'assets/iconbox/car.png',
                  width: 40,
                  height: 40,
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
                        text: '車で家に向かう\n',
                        style: TextStyle(
                          fontFamily: 'NotoSansJP',
                          fontSize: 16, // メインのフォントサイズ
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFd3b2a7),
                        ),
                      ),
                      TextSpan(
                        text: '''多分ここで色々話すと思うから頑張って！''',
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

// 20つ目のカード: お土産
Widget _buildday1Card20() {
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
                  'assets/iconbox/shopping.png',
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
                        text: 'お土産を渡す\n',
                        style: TextStyle(
                          fontFamily: 'NotoSansJP',
                          fontSize: 16, // メインのフォントサイズ
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFd3b2a7),
                        ),
                      ),
                      TextSpan(
                        text: '''みんながいる時がいいな''',
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

// 21つ目のカード:夕飯
Widget _buildday1Card21() {
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
                  'assets/iconbox/restaurant.png',
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
                        text: '夕飯\n',
                        style: TextStyle(
                          fontFamily: 'NotoSansJP',
                          fontSize: 16, // メインのフォントサイズ
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFd3b2a7),
                        ),
                      ),
                      TextSpan(
                        text: '''絶対ジャンキーだw''',
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

// 22つ目のカード:夕飯
Widget _buildday1Card22() {
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
                  'assets/iconbox/night.png',
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
                '23:00 p.m.',
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
                        text: '寝るよー\n',
                        style: TextStyle(
                          fontFamily: 'NotoSansJP',
                          fontSize: 16, // メインのフォントサイズ
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFd3b2a7),
                        ),
                      ),
                      TextSpan(
                        text: '''　次の日は06:00 a.m.には起きよー！
    目覚ましの音は控えめにしてね！''',
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