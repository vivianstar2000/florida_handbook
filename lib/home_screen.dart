import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HOME'),
        centerTitle: true,
        backgroundColor: Color(0xFFF6F2F0),  // アプリバーの背景色を変更
        elevation: 0,  // 影をなくしてフラットなデザインに
        iconTheme: IconThemeData(color: Colors.black),  // アイコンの色を黒に
      ),
      backgroundColor: Color(0xFFF6F2F0),  // 背景色を変更
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'ようこそ！',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('ボタンが押されました')),
                );
              },
              child: Text('クリックしてね'),
            ),
          ],
        ),
      ),
    );
  }
}
