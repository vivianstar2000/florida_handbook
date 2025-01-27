import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:florida_handbook/models/todo_models.dart';

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
      var documentSnapshot = await _firestore.collection('rooms').doc(roomId).get();
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
  Future<List<ToDoFolder>> fetchFolders(String roomId, String userId) async {
  var snapshot = await FirebaseFirestore.instance
      .collection('rooms')
      .doc(roomId)
      .collection('ItemsPage')
      .doc(userId)
      .collection('folders')
      .get();

  return snapshot.docs.map((doc) {
    return ToDoFolder(
      id: doc.id,
      name: doc['name'],
      isExpanded: doc['isExpanded'] ?? false,
      tasks: [],  // ここでは空にし、別メソッドで取得
    );
  }).toList();
}


  // フォルダの追加（修正）
  Future<DocumentReference> addFolder(String roomId, String userId, Map<String, dynamic> folderData) async {
  return await FirebaseFirestore.instance
      .collection('rooms')
      .doc(roomId)
      .collection('ItemsPage')
      .doc(userId)
      .collection('folders')
      .add(folderData);
}


Future<void> updateFolderName(String roomId, String userId, String folderId, String newName) async {
  await FirebaseFirestore.instance
      .collection('rooms')
      .doc(roomId)
      .collection('ItemsPage')
      .doc(userId)
      .collection('folders')
      .doc(folderId)
      .update({'name': newName});
}




Future<void> deleteFolder(String roomId, String userId, String folderId) async {
  await FirebaseFirestore.instance
      .collection('rooms')
      .doc(roomId)
      .collection('ItemsPage')
      .doc(userId)
      .collection('folders')
      .doc(folderId)
      .delete();
}




  // タスクの追加
  Future<DocumentReference> addTask(String roomId, String userId, String folderId, Map<String, dynamic> taskData) {
  return FirebaseFirestore.instance
      .collection('rooms')
      .doc(roomId)
      .collection('ItemsPage')
      .doc(userId)
      .collection('folders')
      .doc(folderId)
      .collection('tasks')
      .add(taskData);
}




  // タスクの更新
  Future<void> updateTask(String roomId, String userId, String folderId, String taskId, String newTitle) async {
  await FirebaseFirestore.instance
      .collection('rooms')
      .doc(roomId)
      .collection('ItemsPage')
      .doc(userId)
      .collection('folders')
      .doc(folderId)
      .collection('tasks')
      .doc(taskId)
      .update({'title': newTitle});
}


  // タスクの削除
  Future<void> deleteTask(String roomId, String userId, String folderId, String taskId) async {
  await FirebaseFirestore.instance
      .collection('rooms')
      .doc(roomId)
      .collection('ItemsPage')
      .doc(userId)
      .collection('folders')
      .doc(folderId)
      .collection('tasks')
      .doc(taskId)
      .delete();
}

  // Firestoreからページデータを取得
  Future<List<Map<String, dynamic>>> fetchPageData(String roomId, String page) async {
    try {
      var querySnapshot = await _firestore
          .collection('rooms')
          .doc(roomId)
          .collection(page)
          .get();

      if (querySnapshot.docs.isEmpty) {
        print("$page のデータが見つかりませんでした");
        return [];
      }
      return querySnapshot.docs.map((doc) => doc.data()).toList();
    } catch (e) {
      print("$page のデータ取得エラー: $e");
      return [];
    }
  }

  Future<List<ToDoItem>> fetchToDoItems(String roomId, String userId, String folderId) async {
  var snapshot = await FirebaseFirestore.instance
      .collection('rooms')
      .doc(roomId)
      .collection('ItemsPage')
      .doc(userId)
      .collection('folders')
      .doc(folderId)
      .collection('tasks')
      .get();

  return snapshot.docs.map((doc) {
    return ToDoItem(
      id: doc.id,
      title: doc['title'],
      isDone: doc['isDone'] ?? false,
    );
  }).toList();
}



Future<void> updateToDoStatus(String roomId, String userId, String folderId, String taskId, bool isDone) async {
  await FirebaseFirestore.instance
      .collection('rooms')
      .doc(roomId)
      .collection('ItemsPage')
      .doc(userId)
      .collection('folders')
      .doc(folderId)
      .collection('tasks')
      .doc(taskId)
      .update({'isDone': isDone});
}


}