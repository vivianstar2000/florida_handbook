import 'package:flutter/material.dart';
import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isTapped = false;

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,  // ステータスバーを透明に
      statusBarIconBrightness: Brightness.light,
    ));
  }

  void _navigateToHomeScreen() {
    setState(() {
      _isTapped = true;
    });
    Future.delayed(Duration(milliseconds: 300), () {
      Navigator.of(context).pushReplacement(
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => HomeScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
          transitionDuration: Duration(seconds: 1),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;

    return GestureDetector(
      onTap: _navigateToHomeScreen,
      child: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                'assets/handbook表紙.jpg',
                fit: BoxFit.cover,  // 画面全体にフィット
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              height: statusBarHeight,  // ステータスバーの部分
              child: Image.asset(
                'assets/handbook表紙.jpg',
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,  // 画像の上部をステータスバーに適用
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
