import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'splash_screen.dart';  // ここを確認
import 'home_screen.dart';   // ここを確認
import 'pages/items.dart';
import 'pages/precautions.dart';
import 'pages/english_conversation.dart';
import 'pages/family_list.dart';
import 'pages/plan_details.dart';
import 'pages/schedule_list.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Web App',
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFFF6F2F0),  // 全画面共通の背景色
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFFF6F2F0),  // AppBarの背景色
          elevation: 0,  // シャドウなし
          iconTheme: IconThemeData(color: Colors.black),  // アイコンの色
        ),
        colorScheme: ColorScheme.fromSwatch(
    primarySwatch: Colors.brown,  // 近い色をベースに
    accentColor: Color(0xFFD3B2A7),  // アクセントカラーを設定
  ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),  // ここを修正
        '/home': (context) => HomeScreen(),
        '/schedule': (context) => ScheduleListPage(),
        '/plan': (context) => PlanDetailsPage(),
        '/items': (context) => ItemsPage(),
        '/precautions': (context) => PrecautionsPage(),
        '/english': (context) => EnglishConversationPage(),
        '/family': (context) => FamilyListPage(),
      },
    );
  }
}
