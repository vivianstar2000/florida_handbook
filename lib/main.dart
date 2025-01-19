import 'package:flutter/foundation.dart' show kIsWeb;  // Web判定用
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'home_screen.dart';  // 追加

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // WebではSystemChromeを適用せず、モバイルのみ適用
  if (!kIsWeb) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // ステータスバーを透明に
      statusBarIconBrightness: Brightness.dark, // アイコンの色（明るい背景ならdark）
    ));
  }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Web App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),  // スプラッシュ画面から遷移
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isTapped = false;

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
    return GestureDetector(
      onTap: _navigateToHomeScreen,
      child: Scaffold(
        body: Center(
          child: AnimatedOpacity(
            opacity: _isTapped ? 0.0 : 1.0,
            duration: Duration(seconds: 1),
            child: Image.asset('assets/handbook表紙.jpg', fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }
}
