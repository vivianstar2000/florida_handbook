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
