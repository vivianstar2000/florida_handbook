import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:florida_handbook/models/todo_models.dart';

class TaskListPage extends StatefulWidget {
  final String roomId;
  final String userId;
  final String folderId;

  const TaskListPage({
    Key? key,
    required this.roomId,
    required this.userId,
    required this.folderId,
  }) : super(key: key);

  @override
  _TaskListPageState createState() => _TaskListPageState();
}

class _TaskListPageState extends State<TaskListPage> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<ToDoTask> tasks = [];

  @override
  void initState() {
    super.initState();
    _loadTasks();
  }

  // Firestoreからタスクを取得
  Future<void> _loadTasks() async {
  try {
    var snapshot = await _firestore
        .collection('rooms')
        .doc(widget.roomId)
        .collection('ItemsPage')
        .doc(widget.userId)
        .collection('folders')
        .doc(widget.folderId)
        .collection('tasks')
        .get();

    setState(() {
      tasks = snapshot.docs.map((doc) {
        var data = doc.data();
        return ToDoTask.fromJson(data, doc.id);
      }).toList();
    });
  } catch (e) {
    print("タスクの取得エラー: $e");
  }
}




  // Firestoreに新しいタスクを追加
  Future<void> _addTask(String taskName) async {
  if (taskName.trim().isEmpty) return;

  var newTask = ToDoTask(
    id: '',
    title: taskName,
    isDone: false,
  );

  try {
    DocumentReference docRef = await _firestore
        .collection('rooms')
        .doc(widget.roomId)
        .collection('ItemsPage')
        .doc(widget.userId)
        .collection('folders')
        .doc(widget.folderId)
        .collection('tasks')
        .add(newTask.toJson());

    setState(() {
      newTask.id = docRef.id;
      tasks.add(newTask);
    });
  } catch (e) {
    print("タスク追加エラー: $e");
  }
}


  // Firestoreのタスクを更新
  Future<void> _updateTask(ToDoTask task) async {
    try {
      await _firestore
          .collection('rooms')
          .doc(widget.roomId)
          .collection('ItemsPage')
          .doc(widget.userId)
          .collection('folders')
          .doc(widget.folderId)
          .collection('tasks')
          .doc(task.id)
          .update(task.toJson());

      setState(() {
        task.isDone = !task.isDone;
      });
    } catch (e) {
      print("タスク更新エラー: $e");
    }
  }

  // Firestoreのタスクを削除
  Future<void> _deleteTask(String taskId) async {
    try {
      await _firestore
          .collection('rooms')
          .doc(widget.roomId)
          .collection('ItemsPage')
          .doc(widget.userId)
          .collection('folders')
          .doc(widget.folderId)
          .collection('tasks')
          .doc(taskId)
          .delete();

      setState(() {
        tasks.removeWhere((task) => task.id == taskId);
      });
    } catch (e) {
      print("タスク削除エラー: $e");
    }
  }

  // タスク追加用のダイアログ表示
  void _showAddTaskDialog() {
    TextEditingController taskController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('新しいタスクを追加'),
        content: TextField(
          controller: taskController,
          decoration: InputDecoration(hintText: 'タスク名'),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: Text('キャンセル')),
          TextButton(
            onPressed: () {
              _addTask(taskController.text);
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
      appBar: AppBar(title: Text('タスク一覧')),
      body: tasks.isEmpty
          ? Center(child: Text("タスクがありません"))
          : ListView.builder(
              padding: EdgeInsets.all(16.0),
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                var task = tasks[index];
                return ListTile(
                  title: Text(
                    task.title,
                    style: TextStyle(
                      decoration: task.isDone ? TextDecoration.lineThrough : null,
                    ),
                  ),
                  leading: Checkbox(
                    value: task.isDone,
                    onChanged: (bool? value) {
                      _updateTask(task);
                    },
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () => _deleteTask(task.id),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddTaskDialog,
        backgroundColor: Color(0xFFE5D1CA),
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
