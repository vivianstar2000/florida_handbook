import 'package:florida_handbook/firestore_service.dart';


class ToDoFolder {
  String id;
  String name;
  bool isExpanded;
  List<ToDoItem> tasks;

  ToDoFolder({
    required this.id,
    required this.name,
    this.isExpanded = false,
    this.tasks = const [],
  });

  // Firestoreからデータを取得する際のFactory
  factory ToDoFolder.fromJson(Map<String, dynamic> json, String documentId) {
    return ToDoFolder(
      id: documentId,
      name: json['name'] ?? 'Untitled', // デフォルト値を設定
      isExpanded: json['isExpanded'] ?? false,
      tasks: [], // タスクは後で追加される
    );
  }

  // Firestoreにデータを保存する際のメソッド
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'isExpanded': isExpanded,
    };
  }
}

class ToDoItem {
  String id;
  String title;
  bool isDone;

  ToDoItem({
    required this.id,
    required this.title,
    required this.isDone,
  });

  // Firestoreからデータを取得する際のFactory
  factory ToDoItem.fromJson(Map<String, dynamic> json, String documentId) {
    return ToDoItem(
      id: documentId,
      title: json['title'] ?? 'Untitled Task', // デフォルト値を設定
      isDone: json['isDone'] ?? false,
    );
  }

  // Firestoreにデータを保存する際のメソッド
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'isDone': isDone,
    };
  }
}

