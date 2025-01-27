import 'package:flutter/material.dart';
import 'package:florida_handbook/firestore_service.dart';



class EnglishConversationPage extends StatefulWidget {
  @override
  _EnglishConversationPageState createState() => _EnglishConversationPageState();
}

class _EnglishConversationPageState extends State<EnglishConversationPage> {
  final FirestoreService _firestoreService = FirestoreService();
  List<Map<String, dynamic>> _conversationData = [];

  void _fetchData() async {
    var data = await _firestoreService.fetchPageData('usa_room', 'english_conversation');
    setState(() {
      _conversationData = data;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("データが更新されました！")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("English Conversation"),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: _fetchData, // 更新ボタン
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: _conversationData.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_conversationData[index]['phrase'] ?? 'No Data'),
          );
        },
      ),
    );
  }
}
