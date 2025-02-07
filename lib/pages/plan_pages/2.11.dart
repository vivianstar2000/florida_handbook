import 'package:flutter/material.dart';


class PlanPage211 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '2.11 (Tue.)',
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
                        text: 'お出かけ先はその日に決まるので、会話に注意してね！',
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
            child: Center(
              child: Text(
                '06:00 p.m.\n        |\n07:00 p.m.',
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
                        text: '夕飯\n',
                        style: TextStyle(
                          fontFamily: 'NotoSansJP',
                          fontSize: 16, // メインのフォントサイズ
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFd3b2a7),
                        ),
                      ),
                      TextSpan(
                        text: '夕飯は量は多いけど、時間帯が早いのでお腹が空きそうだったら何か食べるものを買っておくといいよ！',
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
                  'assets/iconbox/home.png',
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
                '07:00 p.m.\n        |\n11:00 p.m.',
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
                        text: '夜のまったりタイム\n',
                        style: TextStyle(
                          fontFamily: 'NotoSansJP',
                          fontSize: 16, // メインのフォントサイズ
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFd3b2a7),
                        ),
                      ),
                      TextSpan(
                        text: 'もし、シャワーを浴びたかったら言えば浴びさせてもらえるよ！',
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

// 8つ目のカード: 寝る
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
                '11:00 p.m.\n',
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
                        text: '明日も早いよ！\n　明日は移動の日なので寝る前にある程度は荷物を整えておこうね！',
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