import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F2F0),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'ログインしてください',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () async {
                try {
                  UserCredential userCredential = await FirebaseAuth.instance.signInAnonymously();
                  print("匿名ログイン成功: ${userCredential.user?.uid}");
                  Navigator.pushReplacementNamed(context, '/home');
                } catch (e) {
                  print("ログインエラー: $e");
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("ログインに失敗しました")));
                }
              },
              child: Text('匿名ログイン'),
            ),
          ],
        ),
      ),
    );
  }
}
