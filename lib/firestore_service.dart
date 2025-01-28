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
    var snapshot = await _firestore
        .collection('rooms')
        .doc(roomId)
        .collection('ItemsPage')
        .doc(userId)
        .collection('folders')
        .get();

    return snapshot.docs.map((doc) {
      return ToDoFolder.fromJson(doc.data(), doc.id);
    }).toList();
  }

  // サブフォルダーの取得
  Future<List<ToDoFolder>> fetchSubFolders(String roomId, String userId, String parentFolderId) async {
    var snapshot = await _firestore
        .collection('rooms')
        .doc(roomId)
        .collection('ItemsPage')
        .doc(userId)
        .collection('folders')
        .doc(parentFolderId)
        .collection('subfolders')
        .get();

    return snapshot.docs.map((doc) {
      return ToDoFolder.fromJson(doc.data(), doc.id);
    }).toList();
  }

  // フォルダの追加
  Future<DocumentReference> addFolder(String roomId, String userId, Map<String, dynamic> folderData) async {
    return await _firestore
        .collection('rooms')
        .doc(roomId)
        .collection('ItemsPage')
        .doc(userId)
        .collection('folders')
        .add(folderData);
  }

  // サブフォルダーの追加
  Future<DocumentReference> addSubFolder(String roomId, String userId, String parentFolderId, Map<String, dynamic> subFolderData) async {
    return await _firestore
        .collection('rooms')
        .doc(roomId)
        .collection('ItemsPage')
        .doc(userId)
        .collection('folders')
        .doc(parentFolderId)
        .collection('subfolders')
        .add(subFolderData);
  }

  // フォルダ名の更新
  Future<void> updateFolderName(String roomId, String userId, String folderId, String newName) async {
    await _firestore
        .collection('rooms')
        .doc(roomId)
        .collection('ItemsPage')
        .doc(userId)
        .collection('folders')
        .doc(folderId)
        .update({'name': newName});
  }

  // サブフォルダ名の更新
  Future<void> updateSubFolderName(String roomId, String userId, String parentFolderId, String subFolderId, String newName) async {
    await _firestore
        .collection('rooms')
        .doc(roomId)
        .collection('ItemsPage')
        .doc(userId)
        .collection('folders')
        .doc(parentFolderId)
        .collection('subfolders')
        .doc(subFolderId)
        .update({'name': newName});
  }

  // フォルダの削除
  Future<void> deleteFolder(String roomId, String userId, String folderId) async {
    await _firestore
        .collection('rooms')
        .doc(roomId)
        .collection('ItemsPage')
        .doc(userId)
        .collection('folders')
        .doc(folderId)
        .delete();
  }

  // サブフォルダーの削除
  Future<void> deleteSubFolder(String roomId, String userId, String parentFolderId, String subFolderId) async {
    await _firestore
        .collection('rooms')
        .doc(roomId)
        .collection('ItemsPage')
        .doc(userId)
        .collection('folders')
        .doc(parentFolderId)
        .collection('subfolders')
        .doc(subFolderId)
        .delete();
  }

  // タスクの取得
  Future<List<ToDoItem>> fetchToDoItems(String roomId, String userId, String folderId) async {
    var snapshot = await _firestore
        .collection('rooms')
        .doc(roomId)
        .collection('ItemsPage')
        .doc(userId)
        .collection('folders')
        .doc(folderId)
        .collection('tasks')
        .get();

    return snapshot.docs.map((doc) {
      return ToDoItem.fromJson(doc.data(), doc.id);
    }).toList();
  }

  // タスクの追加
  Future<DocumentReference> addTask(String roomId, String userId, String folderId, Map<String, dynamic> taskData) {
    return _firestore
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
    await _firestore
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
    await _firestore
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

  // タスクの完了状態を更新
  Future<void> updateToDoStatus(String roomId, String userId, String folderId, String taskId, bool isDone) async {
    await _firestore
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
