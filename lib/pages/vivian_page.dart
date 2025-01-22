import 'package:flutter/material.dart';
import 'package:florida_handbook/firestore_service.dart';
import 'package:florida_handbook/models/todo_models.dart';
import 'package:florida_handbook/pages/task_list_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class VivianPage extends StatefulWidget {
  final String roomId;
  final String userId;

  const VivianPage({
    Key? key,
    required this.roomId,
    required this.userId,
  }) : super(key: key);

  @override
  _VivianPageState createState() => _VivianPageState();
}

class _VivianPageState extends State<VivianPage> {
  List<ToDoFolder> folders = [];
  final FirestoreService _firestoreService = FirestoreService();

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _addFolder() {
    TextEditingController folderController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.white,
        title: Text('新しいフォルダー'),
        content: TextField(
          controller: folderController,
          decoration: InputDecoration(hintText: 'フォルダー名'),
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context), child: Text('キャンセル')),
          TextButton(
            onPressed: () {
              if (folderController.text.trim().isEmpty) return;
              var newFolder = ToDoFolder(
                id: '', // Firestoreが自動で生成
                name: folderController.text.trim(),
                isExpanded: false,
                tasks: [],
              );

              setState(() {
                folders.add(newFolder);
              });

              _saveData(newFolder, folderController.text.trim()); // フォルダー名を渡す
              Navigator.pop(context);
            },
            child: Text('追加'),
          ),
        ],
      ),
    );
  }

  // Firestoreからデータを取得
Future<void> _loadData() async {
  try {
    var cloudFolders = await _firestoreService.fetchFolders(widget.roomId, widget.userId);
    
    for (var folder in cloudFolders) {
      var cloudTasks = await _firestoreService.fetchToDoItems(widget.roomId, widget.userId, folder.id);
      folder.tasks = cloudTasks;
    }

    if (mounted) {
      setState(() {
        folders = cloudFolders;
      });
    }
  } catch (e) {
    print("データ取得エラー: $e");
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("データの読み込みに失敗しました")),
    );
  }
}





  Future<void> _loadToDoItems(ToDoFolder folder) async {
  try {
    var cloudTasks = await _firestoreService.fetchToDoItems(widget.roomId, widget.userId, folder.id);

    if (mounted) {
      setState(() {
        folder.tasks = cloudTasks;
      });
    }
  } catch (e) {
    print("To-Doリストの取得エラー: $e");
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("タスクの読み込みに失敗しました")),
    );
  }
}



// Firestoreにフォルダーを保存
Future<void> _saveData(ToDoFolder folder, String folderName) async {
  try {
    DocumentReference docRef = await _firestoreService.addFolder(widget.roomId, widget.userId, {
      'name': folderName,
      'isExpanded': false,
      'tasks': [],
    });

    setState(() {
      folder.id = docRef.id;
      folder.tasks = [];  // 空のタスクリストを初期化
    });
  } catch (e) {
    print("フォルダー保存エラー: $e");
  }
}



  Widget _buildFolderTile(ToDoFolder folder) {
  return GestureDetector(
    onLongPress: () => _editFolder(folder),
    child: Dismissible(
      key: Key(folder.id),
      direction: DismissDirection.endToStart,
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Icon(Icons.delete, color: Colors.white),
      ),
      onDismissed: (direction) => _deleteFolder(folder),
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 8.0),
        child: ExpansionTile(
          title: Text(
            folder.name,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          initiallyExpanded: folder.isExpanded,
          onExpansionChanged: (expanded) async {
            if (expanded && folder.tasks.isEmpty) {
              await _loadToDoItems(folder);
            }
            setState(() {
              folder.isExpanded = expanded;
            });
          },
          children: [
  if (folder.tasks.isEmpty)
    ListTile(title: Text('To-Doがありません'))
  else
    ...folder.tasks.map((todo) => _buildTaskTile(folder, todo)).toList(),
  ListTile(
    leading: Icon(Icons.add, color: Colors.blue),
    title: Text('新しいタスクを追加'),
    onTap: () => _addToDo(folder),
  ),
],

        ),
      ),
    ),
  );
}


Widget _buildTaskTile(ToDoFolder folder, ToDoItem todo) {
  return GestureDetector(
    onLongPress: () => _editToDo(folder, todo), // 長押しで編集
    child: Dismissible(
      key: Key(todo.id),
      direction: DismissDirection.endToStart,
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Icon(Icons.delete, color: Colors.white),
      ),
      onDismissed: (direction) => _deleteToDo(folder, todo), // スワイプで削除
      child: ListTile(
        leading: Checkbox(
          value: todo.isDone,
          onChanged: (value) async {
  setState(() {
    todo.isDone = value ?? false;
  });

  print("タスク ${todo.title} の新しい状態: ${todo.isDone}");

  try {
    await _firestoreService.updateToDoStatus(
      widget.roomId, widget.userId, folder.id, todo.id, todo.isDone,
    );
    print("Firestoreに保存完了: ${todo.isDone}");
  } catch (e) {
    print("Firestore保存エラー: $e");
  }
},


        ),
        title: Text(todo.title),
      ),
    ),
  );
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Vivian')),
      body: folders.isEmpty
          ? Center(child: Text("フォルダーがありません"))
          : ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: folders.length,
              itemBuilder: (context, index) {
                return _buildFolderTile(folders[index]);
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addFolder,
        backgroundColor: Color(0xFFE5D1CA),
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  void _editFolder(ToDoFolder folder) {
  TextEditingController folderController = TextEditingController(text: folder.name);
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      backgroundColor: Colors.white,
      title: Text('フォルダーの編集'),
      content: TextField(
        controller: folderController,
        decoration: InputDecoration(hintText: 'フォルダー名'),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text('キャンセル'),
        ),
        TextButton(
          onPressed: () async {
            if (folderController.text.trim().isEmpty) return;
            await _firestoreService.updateFolderName(widget.roomId, widget.userId, folder.id, folderController.text.trim());
            setState(() {
              folder.name = folderController.text.trim();
            });
            Navigator.pop(context);
          },
          child: Text('保存'),
        ),
      ],
    ),
  );
}

void _deleteFolder(ToDoFolder folder) async {
  bool confirmDelete = await showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text('フォルダー削除'),
      content: Text('本当に削除しますか？'),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context, false),
          child: Text('キャンセル'),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context, true),
          child: Text('削除'),
        ),
      ],
    ),
  );

  if (confirmDelete == true) {
    await _firestoreService.deleteFolder(widget.roomId, widget.userId, folder.id);
    setState(() {
      folders.remove(folder);
    });
  }
}

void _addToDo(ToDoFolder folder) {
  TextEditingController taskController = TextEditingController();
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      backgroundColor: Colors.white,
      title: Text('新しいタスク'),
      content: TextField(
        controller: taskController,
        decoration: InputDecoration(hintText: 'タスク名'),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text('キャンセル'),
        ),
        TextButton(
          onPressed: () async {
            if (taskController.text.trim().isEmpty) return;

            // Firestoreへタスクを追加
            var newTask = ToDoItem(
  id: '',  // Firestoreが自動生成
  title: taskController.text.trim(),
  isDone: false,
);

DocumentReference taskRef = await _firestoreService.addTask(
  widget.roomId,
  widget.userId,
  folder.id,
  {
    'title': taskController.text.trim(),
    'isDone': false,
  }
);



            // ローカルのリストに新規タスクを追加
            setState(() {
  folder.tasks.add(ToDoItem(
    id: taskRef.id,
    title: taskController.text.trim(),
    isDone: false,
  ));
});


            Navigator.pop(context);
          },
          child: Text('追加'),
        ),
      ],
    ),
  );
}



void _editToDo(ToDoFolder folder, ToDoItem todo) {
  TextEditingController taskController = TextEditingController(text: todo.title);
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      backgroundColor: Colors.white,
      title: Text('タスクの編集'),
      content: TextField(
        controller: taskController,
        decoration: InputDecoration(hintText: 'タスク名'),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text('キャンセル'),
        ),
        TextButton(
          onPressed: () async {
            if (taskController.text.trim().isEmpty) return;
            await _firestoreService.updateTask(
  widget.roomId,
  widget.userId,
  folder.id,
  todo.id,
  taskController.text.trim(),
);
            setState(() {
              todo.title = taskController.text.trim();
            });
            Navigator.pop(context);
          },
          child: Text('保存'),
        ),
      ],
    ),
  );
}

void _deleteToDo(ToDoFolder folder, ToDoItem todo) async {
  await _firestoreService.deleteTask(widget.roomId, widget.userId, folder.id, todo.id);

  setState(() {
    folder.tasks.remove(todo);
  });
}



}
