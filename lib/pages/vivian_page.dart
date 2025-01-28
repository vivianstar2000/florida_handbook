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

  void _addFolder({ToDoFolder? parentFolder}) {
    TextEditingController folderController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.white,
        title: Text(parentFolder == null ? '新しいフォルダー' : '新しいサブフォルダー'),
        content: TextField(
          controller: folderController,
          decoration: InputDecoration(hintText: 'フォルダー名'),
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context), child: Text('キャンセル')),
          TextButton(
            onPressed: () async {
              if (folderController.text.trim().isEmpty) return;

              var newFolder = ToDoFolder(
                id: '',
                name: folderController.text.trim(),
                isExpanded: false,
                tasks: [],
                subfolders: [],
              );

              if (parentFolder == null) {
                // Top-level folder
                DocumentReference docRef = await _firestoreService.addFolder(
                  widget.roomId,
                  widget.userId,
                  {
                    'name': folderController.text.trim(),
                    'isExpanded': false,
                  },
                );
                setState(() {
                  newFolder.id = docRef.id;
                  folders.add(newFolder);
                });
              } else {
                // Subfolder
                DocumentReference docRef = await _firestoreService.addSubFolder(
                  widget.roomId,
                  widget.userId,
                  parentFolder.id,
                  {
                    'name': folderController.text.trim(),
                    'isExpanded': false,
                  },
                );
                setState(() {
                  newFolder.id = docRef.id;
                  parentFolder.subfolders.add(newFolder);
                });
              }

              Navigator.pop(context);
            },
            child: Text('追加'),
          ),
        ],
      ),
    );
  }

  Future<void> _loadData() async {
    try {
      var cloudFolders = await _firestoreService.fetchFolders(widget.roomId, widget.userId);

      for (var folder in cloudFolders) {
        folder.tasks = await _firestoreService.fetchToDoItems(widget.roomId, widget.userId, folder.id);
        folder.subfolders = await _firestoreService.fetchSubFolders(widget.roomId, widget.userId, folder.id);
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

  Future<void> _loadSubFolderData(ToDoFolder folder) async {
    try {
      folder.subfolders = await _firestoreService.fetchSubFolders(widget.roomId, widget.userId, folder.id);
      if (mounted) {
        setState(() {});
      }
    } catch (e) {
      print("サブフォルダー取得エラー: $e");
    }
  }

  void _addToDo(ToDoFolder folder) {
  TextEditingController taskController = TextEditingController();
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      backgroundColor: Colors.white,
      title: Text('新しいタスクを追加'),
      content: TextField(
        controller: taskController,
        decoration: InputDecoration(hintText: 'タスク名を入力してください'),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text('キャンセル'),
        ),
        TextButton(
          onPressed: () async {
            if (taskController.text.trim().isEmpty) return;

            // Firestoreにタスクを追加
            var newTask = ToDoItem(
              id: '', // Firestoreで自動生成されるID
              title: taskController.text.trim(),
              isDone: false,
            );

            DocumentReference taskRef = await _firestoreService.addTask(
              widget.roomId,
              widget.userId,
              folder.id,
              newTask.toJson(),
            );

            // ローカルデータにタスクを追加して画面を更新
            setState(() {
              folder.tasks.add(ToDoItem(
                id: taskRef.id,
                title: taskController.text.trim(),
                isDone: false,
              ));
            });

            Navigator.pop(context); // ダイアログを閉じる
          },
          child: Text('追加'),
        ),
      ],
    ),
  );
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
          child: Theme(
            data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
            child: ExpansionTile(
              title: Text(
                folder.name,
                style: TextStyle(
                  fontFamily: 'NotoSansJP',
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFFa0928d),
                ),
              ),
              initiallyExpanded: folder.isExpanded,
              onExpansionChanged: (expanded) async {
                if (expanded && folder.subfolders.isEmpty) {
                  await _loadSubFolderData(folder);
                }
                setState(() {
                  folder.isExpanded = expanded;
                });
              },
              children: [
                // Subfolders
                ...folder.subfolders.map((subfolder) => _buildFolderTile(subfolder)).toList(),
                // Tasks
                if (folder.tasks.isEmpty)
                  ListTile(title: Text('To-Doがありません'))
                else
                  ...folder.tasks.map((todo) => _buildTaskTile(folder, todo)).toList(),
                // サブフォルダー追加ボタン
                ListTile(
                leading: Icon(Icons.create_new_folder, color: Colors.blue),
                title: Text(
                  'Add Subfolder',
                  style: TextStyle(fontFamily: 'NotoSansJP', fontSize: 16,),
                ),
                onTap: () => _addFolder(parentFolder: folder),
              ),
                // タスク追加ボタン
              ListTile(
                leading: Icon(Icons.add_circle_outline, color: Colors.green),
                title: Text(
                  'Add Task',
                  style: TextStyle(fontFamily: 'NotoSansJP', fontSize: 16),
                ),
                onTap: () => _addToDo(folder),
              ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTaskTile(ToDoFolder folder, ToDoItem todo) {
    return GestureDetector(
      onLongPress: () => _editToDo(folder, todo),
      child: Dismissible(
        key: Key(todo.id),
        direction: DismissDirection.endToStart,
        background: Container(
          color: Colors.red,
          alignment: Alignment.centerRight,
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Icon(Icons.delete, color: Colors.white),
        ),
        onDismissed: (direction) => _deleteToDo(folder, todo),
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 30, vertical: -4),
          dense: true,
          visualDensity: VisualDensity(horizontal: 0, vertical: -4),
          leading: GestureDetector(
            onTap: () async {
              setState(() {
                todo.isDone = !todo.isDone;
              });
              try {
                await _firestoreService.updateToDoStatus(
                  widget.roomId, widget.userId, folder.id, todo.id, todo.isDone,
                );
              } catch (e) {
                print("Firestore保存エラー: $e");
              }
            },
            child: Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: const Color(0xFFD3B2A7), width: 2),
                color: todo.isDone ? const Color(0xFFD3B2A7) : Colors.white,
              ),
              child: todo.isDone ? Icon(Icons.check, color: Colors.white, size: 18) : null,
            ),
          ),
          title: Text(
            todo.title,
            style: TextStyle(
              fontFamily: 'NotoSansJP',
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Color(0xFF6d615b),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Vivian',
          style: TextStyle(
            fontFamily: 'Merriweather',
            fontSize: 34,
            fontWeight: FontWeight.bold,
            color: Color(0xFFCCA092),
          ),
        ),
      ),
      body: folders.isEmpty
          ? Center(child: Text("フォルダーがありません"))
          : ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: folders.length,
              itemBuilder: (context, index) {
                return _buildFolderTile(folders[index]);
              },
            ),
      floatingActionButton: Container(
        margin: EdgeInsets.only(bottom: 40),
        child: FloatingActionButton(
          onPressed: () => _addFolder(),
          backgroundColor: Color(0xFFE5D1CA),
          shape: CircleBorder(),
          child: Icon(Icons.add, color: Colors.white),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
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
          TextButton(onPressed: () => Navigator.pop(context), child: Text('キャンセル')),
          TextButton(
            onPressed: () async {
              if (folderController.text.trim().isEmpty) return;
              await _firestoreService.updateFolderName(
                widget.roomId, widget.userId, folder.id, folderController.text.trim(),
              );
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
          TextButton(onPressed: () => Navigator.pop(context, false), child: Text('キャンセル')),
          TextButton(onPressed: () => Navigator.pop(context, true), child: Text('削除')),
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
          TextButton(onPressed: () => Navigator.pop(context), child: Text('キャンセル')),
          TextButton(
            onPressed: () async {
              if (taskController.text.trim().isEmpty) return;
              await _firestoreService.updateTask(
                widget.roomId, widget.userId, folder.id, todo.id, taskController.text.trim(),
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
