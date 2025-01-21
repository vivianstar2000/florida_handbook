import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPopup extends StatelessWidget {
  final VoidCallback onLoginSuccess;

  const LoginPopup({Key? key, required this.onLoginSuccess}) : super(key: key);

  Future<void> _loginAnonymously(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signInAnonymously();
      Navigator.pop(context);  // ポップアップを閉じる
      onLoginSuccess();  // ホーム画面へ移動
    } catch (e) {
      print("ログインエラー: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("ログインに失敗しました。")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('ログイン'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("ログインしてデータを同期します。"),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () => _loginAnonymously(context),
            child: Text('匿名ログイン'),
          ),
        ],
      ),
    );
  }
}
