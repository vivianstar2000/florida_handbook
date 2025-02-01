import 'package:flutter/material.dart';

class ScheduleListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Overview',
          style: TextStyle(
            fontFamily: 'Merriweather',
            fontSize: 34,
            fontWeight: FontWeight.bold,
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
            _buildFlightCardHNDPNS(),
            _buildPensacolaCard(),
            _buildSampleCardPNSMCO(),
            _buildOrlandoCard(),
            _buildSampleCardMCOHND(),
            _buildSampleCardinfo(),
          ],
        ),
      ),
    );
  }

  // 1つ目のカード: 飛行機アイコン + HND → PNS
Widget _buildFlightCardHNDPNS() {
  return Card(
    color: Colors.transparent,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    elevation: 0,
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: Row(
        children: [
          // 1列目: 画像 (中央配置)
          Expanded(
            flex: 3,
            child: Center(
              child: Image.asset(
                'assets/airplane.png',
                width: 80,
                height: 80,
              ),
            ),
          ),

          // 2列目: テキスト1 (左寄せ)
          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'HND → PNS',
                  style: TextStyle(
                    fontFamily: 'Merriweather',
                    fontSize: 30,
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


  // 2つ目のカード: 丸い写真 + Pensacola + 日付
  Widget _buildPensacolaCard() {
    return Card(
    color: Colors.transparent,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    elevation: 0,
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: Row(
        children: [
          // 1列目: 画像 (中央配置)
          Expanded(
            flex: 3,
            child: Center(
              child: Image.asset(
                'assets/pensacola.png',
                width: 130,
                height: 130,
              ),
            ),
          ),

          // 2列目: テキスト1 (左寄せ)
          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Pensacola',
                  style: TextStyle(
                    fontFamily: 'Merriweather',
                    fontSize: 30,
                    color: Color(0xFFa0928d),
                  ),
                ),
                SizedBox(height: 1), // 余白
                Container(
                  width: 200, // 線の長さ
                  height: 1, // 線の太さ
                  color: Color(0xFFa0928d), // 線の色
                ),
                SizedBox(height: 5), // 余白を追加
                Text(
                  'feb.8 ~ 12',
                  style: TextStyle(
                    fontFamily: 'Merriweather',
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFFa0928d),
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

  // 3つ目のカード: 飛行機アイコン + PNS → MCO
Widget _buildSampleCardPNSMCO() {
  return Card(
    color: Colors.transparent,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    elevation: 0,
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: Row(
        children: [
          // 1列目: 画像 (中央配置)
          Expanded(
            flex: 3,
            child: Center(
              child: Image.asset(
                'assets/airplane.png',
                width: 80,
                height: 80,
              ),
            ),
          ),

          // 2列目: テキスト1 (左寄せ)
          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'PNS → MCO',
                  style: TextStyle(
                    fontFamily: 'Merriweather',
                    fontSize: 30,
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

// 4つ目のカード: 丸い写真 + Orlando + 日付
  Widget _buildOrlandoCard() {
    return Card(
    color: Colors.transparent,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    elevation: 0,
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: Row(
        children: [
          // 1列目: 画像 (中央配置)
          Expanded(
            flex: 3,
            child: Center(
              child: Image.asset(
                'assets/mco.png',
                width: 150,
                height: 150,
              ),
            ),
          ),

          // 2列目: テキスト1 (左寄せ)
          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Orlando',
                  style: TextStyle(
                    fontFamily: 'Merriweather',
                    fontSize: 30,
                    color: Color(0xFFa0928d),
                  ),
                ),
                SizedBox(height: 1), // 余白
                Container(
                  width: 200, // 線の長さ
                  height: 1, // 線の太さ
                  color: Color(0xFFa0928d), // 線の色
                ),
                SizedBox(height: 5), // 余白を追加
                Text(
                  'feb.12 ~ 16',
                  style: TextStyle(
                    fontFamily: 'Merriweather',
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFFa0928d),
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

  // 5つ目のカード: 飛行機アイコン + MCO → HND
Widget _buildSampleCardMCOHND() {
  return Card(
    color: Colors.transparent,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    elevation: 0,
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: Row(
        children: [
          // 1列目: 画像 (中央配置)
          Expanded(
            flex: 3,
            child: Center(
              child: Image.asset(
                'assets/airplane.png',
                width: 80,
                height: 80,
              ),
            ),
          ),

          // 2列目: テキスト1 (左寄せ)
          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'MCO → HND',
                  style: TextStyle(
                    fontFamily: 'Merriweather',
                    fontSize: 30,
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

// 6つ目のカード: info
Widget _buildSampleCardinfo() {
  return Card(
    color: Colors.transparent,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    elevation: 0,
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: Row(
        children: [
          // 1列目: 画像 (中央配置)
          Expanded(
            flex: 3,
            child: Center(
              child: Image.asset(
                'assets/i.png',
                width: 80,
                height: 80,
              ),
            ),
          ),

          // 2列目: テキスト1 (左寄せ)
          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'info',
                  style: TextStyle(
                    fontFamily: 'Merriweather',
                    fontSize: 30,
                    color: Color(0xFFa0928d),
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
