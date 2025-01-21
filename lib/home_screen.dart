import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'pages/schedule_list.dart';
import 'pages/plan_details.dart';
import 'pages/items.dart';
import 'pages/precautions.dart';
import 'pages/english_conversation.dart';
import 'pages/family_list.dart';
import '../firestore_service.dart';



class HomeScreen extends StatelessWidget {
  final List<Map<String, String>> menuItems = [
    {'title': 'Overview', 'route': '/schedule', 'image': 'assets/schedule.jpg'},
    {'title': 'Itinerary', 'route': '/plan', 'image': 'assets/plan.jpg'},
    {'title': 'Items', 'route': '/items', 'image': 'assets/items.jpg'},
    {'title': 'Important', 'route': '/precautions', 'image': 'assets/notes.jpg'},
    {'title': 'English phrasebook', 'route': '/english', 'image': 'assets/english.jpg'},
    {'title': 'Family list', 'route': '/family', 'image': 'assets/family.jpg'},
  ];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Color(0xFFF6F2F0),
      statusBarIconBrightness: Brightness.dark,
    ));

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'home',
          style: TextStyle(
            fontFamily: 'Merriweather',
            fontSize: 34,
            fontWeight: FontWeight.bold,
            color: Color(0xFFCCA092),
          ),
        ),
        backgroundColor: Color(0xFFF6F2F0),
      ),
      backgroundColor: Color(0xFFF6F2F0),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildGridItem(context, menuItems[0], isDoubleWidth: true),  // Overview (2列分)
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(child: _buildGridItem(context, menuItems[1], fixedAspectRatio: 1.5)),
                const SizedBox(width: 16),
                Expanded(child: _buildGridItem(context, menuItems[3], fixedAspectRatio: 1.5)),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(child: _buildGridItem(context, menuItems[2], fixedAspectRatio: 1.5)),
                const SizedBox(width: 16),
                Expanded(child: _buildGridItem(context, menuItems[4], fixedAspectRatio: 1.5)),
              ],
            ),
            const SizedBox(height: 16),
    _buildGridItem(context, menuItems[5], isDoubleWidth: true),
    const SizedBox(height: 32), // 余白追加
    ElevatedButton(
      onPressed: () async {
        final firestoreService = FirestoreService();
        await firestoreService.addUserData('user123', '新しいデータ');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Firestoreにデータを追加しました！")),
        );
      },
      child: Text('Firestoreにデータを追加'),
    ),
    const SizedBox(height: 16),
    ElevatedButton(
      onPressed: () async {
        final firestoreService = FirestoreService();
        var data = await firestoreService.fetchUserData('user123');
        print("取得データ: $data");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Firestoreのデータを取得しました！")),
        );
      },
      child: Text('Firestoreのデータを取得'),
    ),
  ],
)
      ),
    );
  }

  Widget _buildGridItem(BuildContext context, Map<String, String> menuItem, {bool isDoubleWidth = false, double fixedAspectRatio = 1.0}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Material(
          elevation: 6,
          borderRadius: BorderRadius.circular(12),
          child: InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => _getPage(menuItem['route']!)),
                );
            },
            borderRadius: BorderRadius.circular(12),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: AspectRatio(
                aspectRatio: isDoubleWidth ? 2.5 : fixedAspectRatio, // 比率を統一
                child: Image.asset(
                  menuItem['image']!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          menuItem['title']!,
          style: TextStyle(
            fontFamily: 'Merriweather',
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _getPage(String routeName) {
  switch (routeName) {
    case '/schedule': return ScheduleListPage();
    case '/plan': return PlanDetailsPage();
    case '/items': return ItemsPage();
    case '/precautions': return PrecautionsPage();
    case '/english': return EnglishConversationPage();
    case '/family': return FamilyListPage();
    default: return HomeScreen();
    }
    }


  Route _createRoute(String routeName) {
    Widget page;

    switch (routeName) {
      case '/schedule':
        page = ScheduleListPage();
        break;
      case '/plan':
        page = PlanDetailsPage();
        break;
      case '/items':
        page = ItemsPage();
        break;
      case '/precautions':
        page = PrecautionsPage();
        break;
      case '/english':
        page = EnglishConversationPage();
        break;
      case '/family':
        page = FamilyListPage();
        break;
      default:
        page = HomeScreen();
    }

    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0); // 右から左
        const end = Offset.zero;
        const curve = Curves.easeInOut;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);

        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    );
  }
}


