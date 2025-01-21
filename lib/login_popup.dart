import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPopup extends StatefulWidget {
  final Function(String) onLoginSuccess;

  const LoginPopup({Key? key, required this.onLoginSuccess}) : super(key: key);

  @override
  _LoginPopupState createState() => _LoginPopupState();
}

class _LoginPopupState extends State<LoginPopup> {
  final TextEditingController _roomIdController = TextEditingController();

  Future<void> _loginAnonymously() async {
    try {
      await FirebaseAuth.instance.signInAnonymously();
      String roomId = _roomIdController.text.trim();
      if (roomId.isNotEmpty) {
        Navigator.pop(context);
        widget.onLoginSuccess(roomId);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("部屋IDを入力してください")),
        );
      }
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
          Text("部屋IDを入力してデータを共有できます。"),
          TextField(
            controller: _roomIdController,
            decoration: InputDecoration(labelText: "部屋ID"),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: _loginAnonymously,
            child: Text('ログイン'),
          ),
        ],
      ),
    );
  }
}
