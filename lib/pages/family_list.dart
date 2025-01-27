import 'package:flutter/material.dart';

class FamilyListPage extends StatelessWidget {
  final List<Map<String, dynamic>> familyMembers = [
    {
      'englishName': 'Shelia',
      'katakanaName': 'シエラ',
      'relation': '祖母',
      'nickname': 'グランマ / シエラ',
      'photo': 'assets/grandma.jpeg',
      'birthday': '1953/08/07',
      'age': '71',
      'other': 'タバコが好き',
      'personality': '優しい、料理が美味しい',
    },
    {
      'englishName': 'Dennis',
      'katakanaName': 'デニス',
      'relation': 'パパ',
      'nickname': 'dad / dennis',
      'photo': 'assets/dennis.jpeg',
      'birthday': '1975/01/29',
      'age': '50?',
      'other': '退役軍人、自営業',
      'personality': '優しい、割とテキトー',
    },
    {
      'englishName': 'Rick',
      'katakanaName': 'リック',
      'relation': '祖父',
      'nickname': 'グランパ / リック',
      'photo': 'assets/grandpa.jpeg',
      'birthday': '1949',
      'age': '75',
      'other': '自分でいろいろやるのが好き',
      'personality': '明るい、社交的、ジョーク大好き',
    },
    {
      'englishName': 'Melinda',
      'katakanaName': 'メリンダ',
      'relation': '義理のママ',
      'nickname': 'メリンダ',
      'photo': 'assets/melinda.jpeg',
      'birthday': '8/24',
      'age': '?',
      'other': '店員、辛い食べ物が好き',
      'personality': '活発、フレンドリー、賑やか',
    },
    {
      'englishName': 'Marissa',
      'katakanaName': 'マリッサ',
      'relation': '義理の妹',
      'nickname': 'マリッサ',
      'photo': 'assets/marissa.jpeg',
      'birthday': '2011/8/7',
      'age': '13',
      'other': '中学生',
      'personality': 'シャイ、ちょっとわがまま',
    },
    {
      'englishName': 'Anthony',
      'katakanaName': 'アンソニー',
      'relation': '義理の弟',
      'nickname': 'アンソニー / ババ',
      'photo': 'assets/anthony.jpeg',
      'birthday': '2013?',
      'age': '11?',
      'other': '自閉症',
      'personality': '活発、一人が好き、言葉は話さない',
    },
    {
      'englishName': 'MaKayla',
      'katakanaName': 'マケイラ',
      'relation': '義理の姉',
      'nickname': 'マケイラ',
      'photo': 'assets/makayla.jpeg',
      'birthday': '1999/8/10',
      'age': '25',
      'other': '店員、４児のママ',
      'personality': 'いろいろ気が利く、優しいよ',
    },
    {
      'englishName': 'Ava',
      'katakanaName': 'エイヴァ',
      'relation': '姪',
      'nickname': 'エイヴァ',
      'photo': 'assets/ava.jpeg',
      'birthday': '2018',
      'age': '6',
      'other': 'ダウン症、マケイラの娘(長女)',
      'personality': '言葉は話さない、根はいい子',
    },
    {
      'englishName': 'Alena',
      'katakanaName': 'アレーナ',
      'relation': '姪',
      'nickname': 'アレーナ',
      'photo': 'assets/alena.jpeg',
      'birthday': '2020',
      'age': '4',
      'other': 'マケイラの娘(次女)',
      'personality': '活発、フレンドリー、めっちゃ喋る、追いかけてくる',
    },
    {
      'englishName': 'Ayden',
      'katakanaName': 'エイデン',
      'relation': '甥',
      'nickname': 'エイデン',
      'photo': 'assets/ayden.jpeg',
      'birthday': '2023',
      'age': '1歳11ヶ月',
      'other': 'マケイラの息子(長男)',
      'personality': '？',
    },
    {
      'englishName': 'Alex',
      'katakanaName': 'アレックス',
      'relation': '甥',
      'nickname': 'アレックス',
      'photo': 'assets/alex.jpeg',
      'birthday': '2024',
      'age': '9ヶ月',
      'other': 'マケイラの息子(次男)',
      'personality': '？',
    },
    {
      'englishName': 'Captain',
      'katakanaName': 'キャプテン',
      'relation': '犬',
      'nickname': 'キャプテン',
      'photo': 'assets/captain.jpg',
      'birthday': '？',
      'age': '？',
      'other': '愛犬、元消防のレスキュー犬、頭がいい',
      'personality': '人懐こい、舐める、走る',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Family',style: TextStyle(
            fontFamily: 'Merriweather',
            fontSize: 34,
            fontWeight: FontWeight.bold,
            color: Color(0xFFCCA092),
          ),)),
      body: ListView.separated(
        itemCount: familyMembers.length,
        separatorBuilder: (context, index) => Divider(
          color: Colors.white,  // 線の色
          thickness: 2,        // 線の太さ
          indent: 20,          // 左側の余白
          endIndent: 20,       // 右側の余白
        ),
        itemBuilder: (context, index) {
          final member = familyMembers[index];
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage(member['photo']),
                ),
                SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
  text: TextSpan(
    children: [
      TextSpan(
        text: '${member['englishName']}',
        style: TextStyle(
          fontFamily: 'Merriweather',  // 英語名用のフォント
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: Color(0xFF8c7b72),
        ),
      ),
      TextSpan(
        text: ' / ${member['katakanaName']}',
        style: TextStyle(
          fontFamily: 'NotoSansJP',  // カタカナ用のフォント
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: Color(0xFF8c7b72),
        ),
      ),
    ],
  ),
),

// 隙間を作る部分
  SizedBox(height: 5),  // ここでスペースを調整

                    Text(
                      '${member['relation']} > ${member['nickname']}',
                      style: TextStyle(
                        fontFamily: 'NotoSansJP',
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF6d615b),
                      ),
                    ),
                    Text(
                      '${member['birthday']} (${member['age']}歳)',
                      style: TextStyle(
                        fontFamily: 'NotoSansJP',
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF6d615b),
                      ),
                    ),
                    Text(
                      '${member['other']}',
                      style: TextStyle(
                        fontFamily: 'NotoSansJP',
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF6d615b),
                      ),
                    ),
                    Text(
                      '${member['personality']}',
                      style: TextStyle(
                        fontFamily: 'NotoSansJP',
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF6d615b),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
