import 'package:flutter/material.dart';
import 'package:florida_handbook/firestore_service.dart';
import 'package:florida_handbook/models/todo_models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RyudaiPage extends StatefulWidget {
  final String roomId;
  final String userId;

  const RyudaiPage({
    Key? key,
    required this.roomId,
    required this.userId,
  }) : super(key: key);

  @override
  _RyudaiPageState createState() => _RyudaiPageState();
}

class _RyudaiPageState extends State<RyudaiPage> {
  final FirestoreService _firestoreService = FirestoreService();
  final List<String> sections = ['リュック', '機内持ち込み手荷物', 'スーツケース', 'その他'];
  Map<String, List<ToDoFolder>> folders = {};

  @override
  void initState() {
    super.initState();
    for (var section in sections) {
      folders[section] = []; // セクションごとに空リストを初期化
    }
    initializeSections();
  }

  // RyudaiPage.dart
Future<void> initializeSections() async {
  try {
    Map<String, List<ToDoFolder>> allFolders = {};
    for (var section in sections) {
      var sectionFolders = await _firestoreService.fetchFoldersWithTasks(
        widget.roomId,
        widget.userId,
        section,
      );

      // フォルダが空の場合はデフォルトフォルダを追加
      if (sectionFolders.isEmpty) {
        await _firestoreService.addFolder(
          widget.roomId,
          widget.userId,
          section,
          {'name': 'Default Folder', 'isExpanded': false},
        );
        sectionFolders = await _firestoreService.fetchFoldersWithTasks(
          widget.roomId,
          widget.userId,
          section,
        );
      }

      allFolders[section] = sectionFolders;
    }

    if (mounted) {
      setState(() {
        folders = allFolders;
      });
    }
  } catch (e) {
    print("データの初期化エラー: $e");
  }
}



  Future<void> _loadData(String sectionName) async {
  try {
    // フォルダを取得
    var cloudFolders = await _firestoreService.fetchFoldersWithTasks(
      widget.roomId,
      widget.userId,
      sectionName,
    );

    // UIに反映
    if (mounted) {
      setState(() {
        folders[sectionName] = cloudFolders;
      });
    }
  } catch (e) {
    print("データ取得エラー: $e");
    if (mounted) {
      setState(() {
        folders[sectionName] = [];
      });
    }
  }
}



  Future<void> _addTask(String sectionName, String folderId) async {
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
              onPressed: () => Navigator.pop(context), child: Text('キャンセル')),
          TextButton(
            onPressed: () async {
              if (taskController.text.trim().isEmpty) return;
              await _firestoreService.addTask(
                widget.roomId,
                widget.userId,
                sectionName,
                folderId,
                {'title': taskController.text.trim(), 'isDone': false},
              );
              Navigator.pop(context);
              await _loadData(sectionName); // 再取得
setState(() {}); // 明示的にUIを再描画
            },
            child: Text('追加'),
          ),
        ],
      ),
    );
  }

  Future<void> _editFolder(String sectionName, ToDoFolder folder) async {
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
              onPressed: () => Navigator.pop(context), child: Text('キャンセル')),
          TextButton(
            onPressed: () async {
              if (folderController.text.trim().isEmpty) return;
              await _firestoreService.updateFolderName(
                widget.roomId,
                widget.userId,
                sectionName,
                folder.id,
                folderController.text.trim(),
              );
              Navigator.pop(context);
              await _loadData(sectionName); // 再描画のため再ロード
            },
            child: Text('保存'),
          ),
        ],
      ),
    );
  }

  Future<void> _deleteFolderWithTasks(String sectionName, ToDoFolder folder) async {
    bool confirmDelete = await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('フォルダー削除'),
        content: Text('本当に削除しますか？'),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context, false), child: Text('キャンセル')),
          TextButton(
              onPressed: () => Navigator.pop(context, true), child: Text('削除')),
        ],
      ),
    );

    if (confirmDelete == true) {
      await _firestoreService.deleteFolderWithTasks(widget.roomId, widget.userId, sectionName, folder.id);
      await _loadData(sectionName); // 再描画のため再ロード
    }
  }

  

  Widget _buildFolderTile(String sectionName, ToDoFolder folder) {
  return Card(
    margin: EdgeInsets.symmetric(vertical: 4.0, horizontal: 20.0), // フォルダ間の余白を調整
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
        children: [
          ...folder.tasks.map((task) {
            return Dismissible(
              key: Key(task.id),
              direction: DismissDirection.endToStart,
              onDismissed: (direction) async {
                await _firestoreService.deleteTask(
                  widget.roomId,
                  widget.userId,
                  sectionName,
                  folder.id,
                  task.id,
                );
                await _loadData(sectionName); // 再描画のため再取得
              },
              background: Container(
                color: Colors.red,
                alignment: Alignment.centerRight,
                padding: EdgeInsets.only(right: 16.0),
                child: Icon(Icons.delete, color: Colors.white),
              ),
              child: GestureDetector(
                onLongPress: () => _editTask(sectionName, folder.id, task),
                child: Padding(
  padding: EdgeInsets.symmetric(vertical: 1.0), // タスク全体の上下マージンを最小限に
  child: Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Padding(
        padding: EdgeInsets.only(left: 20.0), // 左端からの位置を調整
        child: Transform.scale(
          scale: 1.0, // チェックボックスのサイズを小さく
          child: Checkbox(
            shape: CircleBorder(),
            value: task.isDone,
            onChanged: (bool? value) async {
              await _firestoreService.updateToDoStatus(
                widget.roomId,
                widget.userId,
                sectionName,
                folder.id,
                task.id,
                value ?? false,
              );
              await _loadData(sectionName); // 再取得
            },
            fillColor: MaterialStateProperty.resolveWith<Color>(
              (states) {
                if (states.contains(MaterialState.selected)) {
                  return Color(0xFFD3B2A7); // チェック時の色
                }
                return Colors.transparent; // 非チェック時
              },
            ),
            side: MaterialStateBorderSide.resolveWith(
              (states) {
                if (!states.contains(MaterialState.selected)) {
                  return BorderSide(color: Color(0xFFE5D1CA), width: 2); // 非チェック時枠線
                }
                return BorderSide.none; // チェック時枠線なし
              },
            ),
          ),
        ),
      ),
      SizedBox(width: 8.0), // チェックボックスとテキストの間隔を調整
      Expanded(
        child: Text(
          task.title,
          style: TextStyle(
            fontFamily: 'NotoSansJP',
            fontSize: 14, // タスク文字サイズ
            color: Color(0xFF544740),
          ),
        ),
      ),
    ],
  ),
),

              ),
            );
          }).toList(),
          ListTile(
            leading: Icon(Icons.add, color: Color(0xFFE5D1CA)),
            title: Text('タスクを追加'),
            onTap: () => _addTask(sectionName, folder.id),
          ),
        ],
      ),
    ),
  );
}



// RyudaiPage.dart
Future<void> _editTask(String sectionName, String folderId, ToDoItem task) async {
  TextEditingController taskController = TextEditingController(text: task.title);
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      backgroundColor: Colors.white,
      title: Text('タスクを編集'),
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
              sectionName,
              folderId,
              task.id,
              {
                'title': taskController.text.trim(),
                'isDone': task.isDone,
              },
            );
            Navigator.pop(context);
            await _loadData(sectionName); // 再描画
          },
          child: Text('保存'),
        ),
      ],
    ),
  );
}


  @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text(
        'Ryudai',
        style: TextStyle(
          fontFamily: 'Merriweather',
          fontSize: 34,
          fontWeight: FontWeight.bold,
          color: Color(0xFFCCA092),
        ),
      ),
    ),
    body: folders.isEmpty
        ? Center(child: CircularProgressIndicator())
        : ListView.builder(
            itemCount: sections.length,
            itemBuilder: (context, index) {
              final sectionName = sections[index];
              return folders[sectionName]!.isEmpty
                  ? SizedBox.shrink()
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text(
                                sectionName,
                                style: TextStyle(
                                  fontFamily: 'NotoSansJP',
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF6d615b),
                                ),
                              ),
                              SizedBox(width: 8),
                              IconButton(
                                icon: Icon(Icons.add, color: Color(0xFFCCA092)),
                                onPressed: () async {
                                  TextEditingController folderController =
                                      TextEditingController();
                                  await showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      title: Text('新しいフォルダー'),
                                      content: TextField(
                                        controller: folderController,
                                        decoration: InputDecoration(
                                            hintText: 'フォルダー名'),
                                      ),
                                      actions: [
                                        TextButton(
                                            onPressed: () =>
                                                Navigator.pop(context),
                                            child: Text('キャンセル')),
                                        TextButton(
                                          onPressed: () async {
                                            if (folderController.text
                                                .trim()
                                                .isEmpty) return;
                                            await _firestoreService.addFolder(
                                              widget.roomId,
                                              widget.userId,
                                              sectionName,
                                              {
                                                'name': folderController.text
                                                    .trim(),
                                                'isExpanded': false,
                                              },
                                            );
                                            Navigator.pop(context);
                                            await _loadData(sectionName);
                                          },
                                          child: Text('追加'),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                        ...folders[sectionName]!.map(
                          (folder) => Dismissible(
                            key: Key(folder.id),
                            direction: DismissDirection.endToStart,
                            onDismissed: (direction) async {
                              await _deleteFolderWithTasks(sectionName, folder);
                            },
                            background: Container(
                              color: Colors.red,
                              alignment: Alignment.centerRight,
                              padding: EdgeInsets.only(right: 16.0),
                              child: Icon(Icons.delete, color: Colors.white),
                            ),
                            child: GestureDetector(
                              onLongPress: () =>
                                  _editFolder(sectionName, folder),
                              child: _buildFolderTile(sectionName, folder),
                            ),
                          ),
                        ).toList(),
                      ],
                    );
            },
          ),
  );
}

}
