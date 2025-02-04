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
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
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
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
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
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
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
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
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


  // つ目のカード: 飛行機アイコン + HND → PNS
Widget _buildday1Card() {
  return Card(
    color: Colors.transparent,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    elevation: 0,
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
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
                '03:00 a.m.\n        |\n06:00 a.m.',
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
                Text(
                  'HND → PNS',
                  style: TextStyle(
                    fontFamily: 'NotoSansJP',
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFd3b2a7),
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