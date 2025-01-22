import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:florida_handbook/firestore_service.dart';
import 'package:florida_handbook/models/todo_models.dart';
import 'package:florida_handbook/pages/vivian_page.dart';
import 'package:florida_handbook/pages/ryudai_page.dart';


class ItemsPage extends StatefulWidget {
  @override
  _ItemsPageState createState() => _ItemsPageState();
}


class _ItemsPageState extends State<ItemsPage> {
  final String roomId = 'usa_room';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Items')),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildNavigationButton(
              context, 'Vivian', VivianPage(roomId: roomId, userId: 'Vivian')),
          SizedBox(height: 20),
          _buildNavigationButton(
              context, 'Ryudai', RyudaiPage(roomId: roomId, userId: 'Ryudai')),
        ],
      ),
    );
  }

Widget _buildNavigationButton(BuildContext context, String name, Widget page) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => page),
      );
    },
    child: Container(
      height: 150,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 8)],
      ),
      child: Center(
        child: Text(name, style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
      ),
    ),
  );
}


}
