import 'package:florida_handbook/firestore_service.dart';


class ToDoFolder {
  String id; // フォルダーのID
  String name; // フォルダーの名前
  bool isExpanded; // 展開状態
  List<ToDoFolder> subfolders; // サブフォルダーのリスト
  List<ToDoItem> tasks; // タスクリスト

  ToDoFolder({
    required this.id,
    required this.name,
    this.isExpanded = false,
    this.subfolders = const [], // 初期値は空のリスト
    this.tasks = const [], // 初期値は空のリスト
  });

  // Firestoreのデータから`ToDoFolder`インスタンスを生成
  factory ToDoFolder.fromJson(Map<String, dynamic> json, String documentId) {
    return ToDoFolder(
      id: documentId,
      name: json['name'] ?? 'Untitled',
      isExpanded: json['isExpanded'] ?? false,
      subfolders: [], // サブフォルダーは別途取得する
      tasks: [], // タスクは別途取得する
    );
  }

  // インスタンスをFirestoreに保存するためのMap形式に変換
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'isExpanded': isExpanded,
    };
  }
}


class ToDoItem {
  String id; // タスクのID
  String title; // タスク名
  bool isDone; // 完了状態

  ToDoItem({
    required this.id,
    required this.title,
    required this.isDone,
  });


  // Firestoreのデータから`ToDoItem`インスタンスを生成
  factory ToDoItem.fromJson(Map<String, dynamic> json, String docId) {
    return ToDoItem(
      id: docId,
      title: json['title'] ?? '',
      isDone: json['isDone'] ?? false,
    );
  }

 // インスタンスをFirestoreに保存するためのMap形式に変換
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'isDone': isDone,
    };
  }
}

class ToDoTask {
  String id;
  String title;
  bool isDone;

  ToDoTask({required this.id, required this.title, this.isDone = false});

  factory ToDoTask.fromJson(Map<String, dynamic> json, String documentId) {
    return ToDoTask(
      id: documentId,
      title: json['title'] ?? 'Untitled',
      isDone: json['isDone'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'isDone': isDone,
    };
  }
}

