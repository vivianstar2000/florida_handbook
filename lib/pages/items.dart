import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:florida_handbook/models/todo_models.dart';
import 'dart:convert';
import 'package:flutter/cupertino.dart';


class ItemsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Items',
          style: TextStyle(
            fontFamily: 'Merriweather',
            fontSize: 34,
            fontWeight: FontWeight.bold,
            color: Color(0xFFCCA092),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildRoundedButton(context, 'Vivian', () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => VivianPage()),
              );
            }),
            SizedBox(height: 20),
            _buildRoundedButton(context, 'Ryudai', () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RyudaiPage()),
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildRoundedButton(BuildContext context, String name, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 150,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Center(
          child: Text(
            name,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ),
      ),
    );
  }
}

// VivianPageの実装
class VivianPage extends StatefulWidget {
  @override
  _VivianPageState createState() => _VivianPageState();
}

class _VivianPageState extends State<VivianPage> {
  List<ToDoFolder> folders = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? folderData = prefs.getString('vivian_folders');
    if (folderData != null) {
      setState(() {
        folders = (json.decode(folderData) as List)
            .map((data) => ToDoFolder.fromJson(data))
            .toList();
      });
    }
  }

  Future<void> _saveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String folderData = json.encode(folders.map((f) => f.toJson()).toList());
    await prefs.setString('vivian_folders', folderData);
  }

  void _editFolder(ToDoFolder folder) {
    TextEditingController folderController = TextEditingController(text: folder.name);
    showModalBottomSheet(
      context: context,
      builder: (context) => Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: folderController,
              decoration: InputDecoration(labelText: 'フォルダー名'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  folder.name = folderController.text;
                  _saveData();
                });
                Navigator.pop(context);
              },
              child: Text('保存'),
            ),
          ],
        ),
      ),
    );
  }

  void _deleteFolder(ToDoFolder folder) {
    setState(() {
      folders.remove(folder);
      _saveData();
    });
  }

  void _addFolder() {
    TextEditingController folderController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('新しいフォルダー'),
        content: TextField(
          controller: folderController,
          decoration: InputDecoration(hintText: 'フォルダー名'),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: Text('キャンセル')),
          TextButton(
            onPressed: () {
              setState(() {
                folders.add(ToDoFolder(folderController.text));
                _saveData();
              });
              Navigator.pop(context);
            },
            child: Text('追加'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Vivian')),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: folders.isEmpty
            ? [Center(child: Text("フォルダーがありません"))]
            : folders.map((folder) => _buildFolderTile(folder)).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addFolder,
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _buildFolderTile(ToDoFolder folder) {
    return Dismissible(
      key: Key(folder.name),
      direction: DismissDirection.endToStart,
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Icon(Icons.delete, color: Colors.white, size: 32),
      ),
      onDismissed: (direction) {
        _deleteFolder(folder);
      },
      child: GestureDetector(
        onLongPress: () => _editFolder(folder),
        child: Card(
          elevation: 4,
          child: ExpansionTile(
            title: Text(folder.name, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            children: [
              ...folder.tasks.map((task) => _buildTaskTile(folder, task)),
              TextButton(
                onPressed: () => _addTask(folder),
                child: Text('タスクを追加'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTaskTile(ToDoFolder folder, ToDoTask task) {
    return Dismissible(
      key: Key(task.title),
      direction: DismissDirection.endToStart,
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Icon(Icons.delete, color: Colors.white, size: 32),
      ),
      onDismissed: (direction) {
        setState(() {
          folder.tasks.remove(task);
          _saveData();
        });
      },
      child: ListTile(
        leading: GestureDetector(
          onTap: () {
            setState(() {
              task.isDone = !task.isDone;
              _saveData();
            });
          },
          child: CircleAvatar(
            backgroundColor: task.isDone ? Colors.green : Colors.grey,
            child: task.isDone ? Icon(Icons.check, color: Colors.white) : Icon(Icons.circle, color: Colors.white),
          ),
        ),
        title: Text(
          task.title,
          style: TextStyle(
            fontSize: 18,
            decoration: task.isDone ? TextDecoration.lineThrough : TextDecoration.none,
          ),
        ),
      ),
    );
  }

  void _addTask(ToDoFolder folder) {
    TextEditingController taskController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('新しいタスク'),
        content: TextField(
          controller: taskController,
          decoration: InputDecoration(hintText: 'タスク名'),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: Text('キャンセル')),
          TextButton(
            onPressed: () {
              setState(() {
                folder.tasks.add(ToDoTask(taskController.text));
                _saveData();
              });
              Navigator.pop(context);
            },
            child: Text('追加'),
          ),
        ],
      ),
    );
  }
}

// RyudaiPageもVivianPageと同じ構造
class RyudaiPage extends StatefulWidget {
  @override
  _RyudaiPageState createState() => _RyudaiPageState();
}

class _RyudaiPageState extends State<RyudaiPage> {
  List<ToDoFolder> folders = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? folderData = prefs.getString('ryudai_folders');
    if (folderData != null) {
      setState(() {
        folders = (json.decode(folderData) as List)
            .map((data) => ToDoFolder.fromJson(data))
            .toList();
      });
    }
  }

  Future<void> _saveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String folderData = json.encode(folders.map((f) => f.toJson()).toList());
    await prefs.setString('ryudai_folders', folderData);
  }

  void _editFolder(ToDoFolder folder) {
    TextEditingController folderController = TextEditingController(text: folder.name);
    showModalBottomSheet(
      context: context,
      builder: (context) => Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: folderController,
              decoration: InputDecoration(labelText: 'フォルダー名'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  folder.name = folderController.text;
                  _saveData();
                });
                Navigator.pop(context);
              },
              child: Text('保存'),
            ),
          ],
        ),
      ),
    );
  }

  void _deleteFolder(ToDoFolder folder) {
    setState(() {
      folders.remove(folder);
      _saveData();
    });
  }

  void _addFolder() {
    TextEditingController folderController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('新しいフォルダー'),
        content: TextField(
          controller: folderController,
          decoration: InputDecoration(hintText: 'フォルダー名'),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: Text('キャンセル')),
          TextButton(
            onPressed: () {
              setState(() {
                folders.add(ToDoFolder(folderController.text));
                _saveData();
              });
              Navigator.pop(context);
            },
            child: Text('追加'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Ryudai')),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: folders.isEmpty
            ? [Center(child: Text("フォルダーがありません"))]
            : folders.map((folder) => _buildFolderTile(folder)).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addFolder,
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _buildFolderTile(ToDoFolder folder) {
    return Dismissible(
      key: Key(folder.name),
      direction: DismissDirection.endToStart,
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Icon(Icons.delete, color: Colors.white, size: 32),
      ),
      onDismissed: (direction) {
        _deleteFolder(folder);
      },
      child: GestureDetector(
        onLongPress: () => _editFolder(folder),
        child: Card(
          elevation: 4,
          child: ExpansionTile(
            title: Text(folder.name, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            children: [
              ...folder.tasks.map((task) => _buildTaskTile(folder, task)),
              TextButton(
                onPressed: () => _addTask(folder),
                child: Text('タスクを追加'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTaskTile(ToDoFolder folder, ToDoTask task) {
    return Dismissible(
      key: Key(task.title),
      direction: DismissDirection.endToStart,
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Icon(Icons.delete, color: Colors.white, size: 32),
      ),
      onDismissed: (direction) {
        setState(() {
          folder.tasks.remove(task);
          _saveData();
        });
      },
      child: ListTile(
        leading: GestureDetector(
          onTap: () {
            setState(() {
              task.isDone = !task.isDone;
              _saveData();
            });
          },
          child: CircleAvatar(
            backgroundColor: task.isDone ? Colors.green : Colors.grey,
            child: task.isDone ? Icon(Icons.check, color: Colors.white) : Icon(Icons.circle, color: Colors.white),
          ),
        ),
        title: Text(
          task.title,
          style: TextStyle(
            fontSize: 18,
            decoration: task.isDone ? TextDecoration.lineThrough : TextDecoration.none,
          ),
        ),
      ),
    );
  }

  void _addTask(ToDoFolder folder) {
    TextEditingController taskController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('新しいタスク'),
        content: TextField(
          controller: taskController,
          decoration: InputDecoration(hintText: 'タスク名'),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: Text('キャンセル')),
          TextButton(
            onPressed: () {
              setState(() {
                folder.tasks.add(ToDoTask(taskController.text));
                _saveData();
              });
              Navigator.pop(context);
            },
            child: Text('追加'),
          ),
        ],
      ),
    );
  }
}


class ToDoFolder {
  String name;
  bool isExpanded;
  List<ToDoTask> tasks;

  ToDoFolder(this.name, {this.isExpanded = false, List<ToDoTask>? tasks})
      : tasks = tasks ?? [];

  Map<String, dynamic> toJson() => {
        'name': name,
        'isExpanded': isExpanded,
        'tasks': tasks.map((task) => task.toJson()).toList(),
      };

  factory ToDoFolder.fromJson(Map<String, dynamic> json) => ToDoFolder(
        json['name'],
        isExpanded: json['isExpanded'] ?? false,
        tasks: (json['tasks'] as List).map((t) => ToDoTask.fromJson(t)).toList(),
      );
}

class ToDoTask {
  String title;
  bool isDone;

  ToDoTask(this.title, {this.isDone = false});

  Map<String, dynamic> toJson() => {
        'title': title,
        'isDone': isDone,
      };

  factory ToDoTask.fromJson(Map<String, dynamic> json) => ToDoTask(
        json['title'],
        isDone: json['isDone'] ?? false,
      );
}