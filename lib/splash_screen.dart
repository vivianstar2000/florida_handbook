import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    _hideStatusBar();
  }

  void _hideStatusBar() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
    ));
  }

  void _navigateToHomeScreen() {
    setState(() {
      _isTapped = true;
    });

    Future.delayed(Duration(milliseconds: 300), () {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Color(0xFFF6F2F0),
        statusBarIconBrightness: Brightness.dark,
      ));

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