import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ステータスバーの色を#f6f2f0に設定
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Color(0xFFF6F2F0),  // ステータスバーの色
      statusBarIconBrightness: Brightness.dark,  // アイコンの色（ダーク）
    ));

    return Scaffold(
      backgroundColor: Color(0xFFF6F2F0),  // 背景色をステータスバーと統一
      appBar: AppBar(
        backgroundColor: Color(0xFFF6F2F0),
        elevation: 0,  // 影を消してフラットにする
      ),
      body: Center(
        child: Text(
          'ホーム画面',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

