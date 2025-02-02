import 'package:flutter/material.dart';

class PlanPage29 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '2.9 (Sun.)',
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

  // 1つ目のカード: 飛行機アイコン + HND → PNS
Widget _buildday1Card1() {
  return Card(
    color: Colors.transparent,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    elevation: 0,
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
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
                '03:00 a.m.\n-\n06:00 a.m.',
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