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

  factory ToDoFolder.fromJson(Map<String, dynamic> json, String documentId) {
    return ToDoFolder(
      id: documentId,
      name: json['name'] ?? 'Untitled',
      isExpanded: json['isExpanded'] ?? false,
      tasks: [],
    );
  }

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

  factory ToDoItem.fromJson(Map<String, dynamic> json, String docId) {
    return ToDoItem(
      id: docId,
      title: json['title'] ?? '',
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

