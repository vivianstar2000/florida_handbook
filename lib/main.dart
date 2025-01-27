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
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'firebase_options.dart';
import 'firestore_service.dart';





void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,  // Firebaseオプションを適用
  );

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
      initialRoute: '/',// 最初にスプラッシュ画面を表示
      routes: {
        '/': (context) => SplashScreen(),  // ここを修正
        '/home': (context) => HomeScreen(roomId: 'usa_room'),
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

class FirebaseAuthTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Firebase Test')),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            UserCredential user = await FirebaseAuth.instance.signInAnonymously();
            print("User signed in: ${user.user?.uid}");
          },
          child: Text('Sign in Anonymously'),
        ),
      ),
    );
  }
}

class FirestoreTestPage extends StatelessWidget {
  final FirestoreService _firestoreService = FirestoreService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Firestore Test')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                await _firestoreService.addRoomData('usa_room', 'New Firestore Data');
                print("usa_room にデータを追加しました");
              },
              child: Text('Add Data to Firestore'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                var data = await _firestoreService.fetchRoomData('usa_room');
                print('Fetched Data from usa_room: $data');
              },
              child: Text('Fetch Firestore Data'),
            ),
          ],
        ),
      ),
    );
  }
}