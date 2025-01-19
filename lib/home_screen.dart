import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Color(0xFFF6F2F0),  // ホーム画面のステータスバー色
      statusBarIconBrightness: Brightness.dark,  // アイコンを黒に
    ));

    return Scaffold(
      backgroundColor: Color(0xFFF6F2F0),
      appBar: AppBar(
        backgroundColor: Color(0xFFF6F2F0),
        elevation: 0,
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
