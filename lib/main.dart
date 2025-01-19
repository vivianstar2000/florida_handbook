import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'home_screen.dart';
import 'pages/schedule_list.dart';
import 'pages/plan_details.dart';
import 'pages/items.dart';
import 'pages/precautions.dart';
import 'pages/english_conversation.dart';
import 'pages/family_list.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,  // ステータスバーを透明にする
    statusBarIconBrightness: Brightness.light,  // アイコンを白に
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
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
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
