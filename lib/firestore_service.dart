import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> addRoomData(String roomId, String value) async {
    try {
      await firestore.collection('rooms').doc(roomId).collection('data').add({
        'sample_field': value,
        'timestamp': FieldValue.serverTimestamp(),
      });
      print("データが追加されました！");
    } catch (e) {
      print("データの追加エラー: $e");
      throw Exception("Firestoreにデータを追加できませんでした: $e");
    }
  }

  Future<List<Map<String, dynamic>>> fetchRoomData(String roomId) async {
    try {
      var snapshot = await firestore
          .collection('rooms')
          .doc(roomId)
          .collection('data')
          .get();

      return snapshot.docs.map((doc) => doc.data()).toList();
    } catch (e) {
      print("データ取得エラー: $e");
      return [];
    }
  }

  Stream<List<Map<String, dynamic>>> streamRoomData(String roomId) {
    return firestore
        .collection('rooms')
        .doc(roomId)
        .collection('data')
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => doc.data()).toList());
  }
}

