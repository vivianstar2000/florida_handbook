import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'login_popup.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isTapped = false;

  @override
  void initState() {
    super.initState();
    _hideStatusBar();
  }

  void _hideStatusBar() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
    ));
  }

  void _handleSplashTap() {
  if (_isTapped) return;  // 連続タップを防止

  setState(() {
    _isTapped = true;
  });

  print("スプラッシュ画面タップ処理開始");

  Future.delayed(Duration(milliseconds: 300), () {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Color(0xFFF6F2F0),
      statusBarIconBrightness: Brightness.dark,
    ));

    print("ログインステータス確認");
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkLoginStatus();
    });
  });
}




  void _checkLoginStatus() async {
  print("Firebase認証を確認しています...");
  User? user = FirebaseAuth.instance.currentUser;
  if (user == null) {
    print("ユーザー未ログイン。ログインポップアップを表示します。");
    _showLoginPopup();
  } else {
    print("ユーザーはすでにログイン済みです。ホーム画面に移動します。");
    _navigateToHomeScreen();
  }
}



  void _showLoginPopup() {
  print("ログインポップアップ表示中...");
  showDialog(
    context: context,
    barrierDismissible: false,  // ユーザーがポップアップ外をタップして閉じないようにする
    builder: (context) => LoginPopup(
      onLoginSuccess: _navigateToHomeScreen,
    ),
  );
}




  void _navigateToHomeScreen() {
  Navigator.of(context).pushAndRemoveUntil(
    MaterialPageRoute(builder: (context) => HomeScreen()),
    (Route<dynamic> route) => false,  // すべての以前のルートを削除
  );
}

  @override
Widget build(BuildContext context) {
  return GestureDetector(
    onTap: () {
      if (!_isTapped) {
        _handleSplashTap();
      }
    },
    child: Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/handbook表紙.jpg',
              fit: BoxFit.cover,
            ),
          ),
          AnimatedOpacity(
            opacity: _isTapped ? 0.0 : 1.0,
            duration: Duration(seconds: 1),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.transparent,
            ),
          ),
        ],
      ),
    ),
  );
}

}