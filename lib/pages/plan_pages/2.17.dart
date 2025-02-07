import 'package:flutter/material.dart';


class PlanPage217 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '2.17 (Mon.)',
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
                'assets/airplane.png',
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
                '----.',
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
        text: '移動中\n',
        style: TextStyle(
          fontFamily: 'NotoSansJP',
          fontSize: 16, // メインのフォントサイズ
          fontWeight: FontWeight.bold,
          color: Color(0xFFd3b2a7),
        ),
      ),
      TextSpan(
        text: '帰りは時間を追いかけるので、17日はまるまるなくなります！\n',
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