import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'pages/schedule_list.dart';
import 'pages/plan_details.dart';
import 'pages/items.dart';
import 'pages/precautions.dart';
import 'pages/english_conversation.dart';
import 'pages/family_list.dart';

class HomeScreen extends StatelessWidget {
  final List<Map<String, String>> menuItems = [
    {'title': '予定表一覧', 'route': '/schedule', 'image': 'assets/schedule.jpg'},
    {'title': 'プラン詳細', 'route': '/plan', 'image': 'assets/plan.jpg'},
    {'title': '持ち物', 'route': '/items', 'image': 'assets/items.jpg'},
    {'title': '注意事項', 'route': '/precautions', 'image': 'assets/notes.jpg'},
    {'title': '英会話集', 'route': '/english', 'image': 'assets/english.jpg'},
    {'title': '家族リスト', 'route': '/family', 'image': 'assets/family.jpg'},
  ];

  @override
  Widget build(BuildContext context) {
    // ホーム画面ではステータスバーの色を #f6f2f0 に設定
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Color(0xFFF6F2F0),
      statusBarIconBrightness: Brightness.dark,
    ));

    return Scaffold(
      appBar: AppBar(
        title: Text('ホーム画面'),
        backgroundColor: Color(0xFFF6F2F0),
      ),
      backgroundColor: Color(0xFFF6F2F0),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,  // 2列レイアウト
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 1.0,
          ),
          itemCount: menuItems.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, menuItems[index]['route']!);
              },
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Expanded(
  child: ClipRRect(
    borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
    child: Image.asset(
      menuItems[index]['image']!,
      fit: BoxFit.cover,
      width: double.infinity,
      errorBuilder: (context, error, stackTrace) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error, color: Colors.red, size: 50),
            Text('画像が見つかりません'),
          ],
        );
      },
    ),
  ),
),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        menuItems[index]['title']!,
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
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