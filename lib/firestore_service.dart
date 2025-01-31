import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:florida_handbook/models/todo_models.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // 部屋データの追加
  Future<void> addRoomData(String roomId, String value) async {
    try {
      await _firestore.collection('rooms').doc(roomId).set({
        'sample_field': value,
        'timestamp': FieldValue.serverTimestamp(),
      });
      print("データが追加されました！");
    } catch (e) {
      print("データの追加エラー: $e");
      throw Exception("Firestoreにデータを追加できませんでした: $e");
    }
  }

  // 部屋データの取得
  Future<Map<String, dynamic>?> fetchRoomData(String roomId) async {
    try {
      var documentSnapshot =
          await _firestore.collection('rooms').doc(roomId).get();
      if (!documentSnapshot.exists || documentSnapshot.data() == null) {
        print("データが見つかりませんでした");
        return null;
      }
      return documentSnapshot.data();
    } catch (e) {
      print("データ取得エラー: $e");
      return null;
    }
  }

  // フォルダの取得
  // フォルダとタスクの取得（キャッシュ機能付き）
  Future<List<ToDoFolder>> fetchFoldersWithTasks(
      String roomId, String userId, String sectionName) async {
    try {
      // Firestoreからデータを取得
      var folderSnapshot = await _firestore
          .collection('rooms')
          .doc(roomId)
          .collection('ItemsPage')
          .doc(userId)
          .collection(sectionName)
          .get();

      List<ToDoFolder> folders = [];

      for (var folderDoc in folderSnapshot.docs) {
        var folderData = folderDoc.data();
        var folder = ToDoFolder(
          id: folderDoc.id,
          name: folderData['name'] ?? 'Untitled',
          isExpanded: folderData['isExpanded'] ?? false,
          tasks: [],
        );

        // フォルダ内のタスクを取得
        var taskSnapshot = await _firestore
            .collection('rooms')
            .doc(roomId)
            .collection('ItemsPage')
            .doc(userId)
            .collection(sectionName)
            .doc(folderDoc.id)
            .collection('tasks')
            .get();

        folder.tasks = taskSnapshot.docs.map((taskDoc) {
          var taskData = taskDoc.data();
          return ToDoItem(
            id: taskDoc.id,
            title: taskData['title'] ?? 'Untitled Task',
            isDone: taskData['isDone'] ?? false,
          );
        }).toList();

        folders.add(folder);
      }

      // 取得したデータをキャッシュに保存
      await _cacheFolders(roomId, userId, sectionName, folders);

      return folders;
    } catch (e) {
      print("Firestoreからデータを取得できませんでした。キャッシュを使用します: $e");
      return await _getCachedFolders(roomId, userId, sectionName);
    }
  }

  // 📌 Firestoreのデータをキャッシュする
  Future<void> _cacheFolders(
      String roomId, String userId, String sectionName, List<ToDoFolder> folders) async {
    final prefs = await SharedPreferences.getInstance();
    final String key = "folders_$roomId\_$userId\_$sectionName";
    
    // JSONエンコードして保存
    List<Map<String, dynamic>> folderList = folders.map((folder) {
      return {
        "id": folder.id,
        "name": folder.name,
        "isExpanded": folder.isExpanded,
        "tasks": folder.tasks.map((task) => {
          "id": task.id,
          "title": task.title,
          "isDone": task.isDone
        }).toList(),
      };
    }).toList();

  String jsonData = jsonEncode(folderList);
  await prefs.setString(key, jsonData);

  // 🔍 キャッシュが保存されたかログを出力
  print("Firestoreキャッシュ保存: $jsonData");
  }

  // 📌 キャッシュデータを取得する（オフライン時用）
  Future<List<ToDoFolder>> _getCachedFolders(
      String roomId, String userId, String sectionName) async {
    final prefs = await SharedPreferences.getInstance();
    final String key = "folders_$roomId\_$userId\_$sectionName";

    String? cachedData = prefs.getString(key);
    if (cachedData == null) {
      print("キャッシュデータがありません。");
      return [];
    }

  print("✅ キャッシュデータ取得成功: $cachedData");

    // JSONデコードしてリストに変換
    List<dynamic> jsonData = jsonDecode(cachedData);
    List<ToDoFolder> folders = jsonData.map((folder) {
      return ToDoFolder(
        id: folder["id"],
        name: folder["name"],
        isExpanded: folder["isExpanded"],
        tasks: (folder["tasks"] as List<dynamic>).map((task) {
          return ToDoItem(
            id: task["id"],
            title: task["title"],
            isDone: task["isDone"],
          );
        }).toList(),
      );
    }).toList();

    return folders;
  }

  // 📌 Firestoreのデータが更新されたら、キャッシュも更新
  Future<void> updateFolderCache(
      String roomId, String userId, String sectionName) async {
    var updatedFolders = await fetchFoldersWithTasks(roomId, userId, sectionName);
    await _cacheFolders(roomId, userId, sectionName, updatedFolders);
  }



  // フォルダの追加
  Future<DocumentReference> addFolder(String roomId, String userId,
      String sectionName, Map<String, dynamic> folderData) async {
    return await _firestore
        .collection('rooms')
        .doc(roomId)
        .collection('ItemsPage')
        .doc(userId)
        .collection(sectionName)
        .add(folderData);
  }

  // フォルダ名の更新
  Future<void> updateFolderName(String roomId, String userId, String sectionName, String folderId, String newName) async {
  await FirebaseFirestore.instance
      .collection('rooms')
      .doc(roomId)
      .collection('ItemsPage')
      .doc(userId)
      .collection(sectionName)
      .doc(folderId)
      .update({'name': newName});
}

  // フォルダの削除
  Future<void> deleteFolderWithTasks(String roomId, String userId, String sectionName, String folderId) async {
  // フォルダ内のタスクを削除
  var tasksSnapshot = await _firestore
      .collection('rooms')
      .doc(roomId)
      .collection('ItemsPage')
      .doc(userId)
      .collection(sectionName)
      .doc(folderId)
      .collection('tasks')
      .get();

  for (var taskDoc in tasksSnapshot.docs) {
    await taskDoc.reference.delete();
  }

  // フォルダを削除
  await _firestore
      .collection('rooms')
      .doc(roomId)
      .collection('ItemsPage')
      .doc(userId)
      .collection(sectionName)
      .doc(folderId)
      .delete();
}




  // タスクの追加
  Future<DocumentReference> addTask(String roomId, String userId,
      String sectionName, String folderId, Map<String, dynamic> taskData) async {
    return await _firestore
        .collection('rooms')
        .doc(roomId)
        .collection('ItemsPage')
        .doc(userId)
        .collection(sectionName)
        .doc(folderId)
        .collection('tasks')
        .add(taskData);
  }

  // タスクの更新
  // FirestoreService.dart
Future<void> updateTask(String roomId, String userId, String sectionName,
    String folderId, String taskId, Map<String, dynamic> taskData) async {
  await _firestore
      .collection('rooms')
      .doc(roomId)
      .collection('ItemsPage')
      .doc(userId)
      .collection(sectionName)
      .doc(folderId)
      .collection('tasks')
      .doc(taskId)
      .update(taskData);
}


  // タスクの削除
  Future<void> deleteTask(String roomId, String userId, String sectionName,
      String folderId, String taskId) async {
    await _firestore
        .collection('rooms')
        .doc(roomId)
        .collection('ItemsPage')
        .doc(userId)
        .collection(sectionName)
        .doc(folderId)
        .collection('tasks')
        .doc(taskId)
        .delete();
  }

  // タスクの完了状態を更新
  Future<void> updateToDoStatus(String roomId, String userId,
      String sectionName, String folderId, String taskId, bool isDone) async {
    await _firestore
        .collection('rooms')
        .doc(roomId)
        .collection('ItemsPage')
        .doc(userId)
        .collection(sectionName)
        .doc(folderId)
        .collection('tasks')
        .doc(taskId)
        .update({'isDone': isDone});
  }

}
