import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addUserData(String userId, String value) async {
    try {
      await _firestore.collection('users').doc(userId).collection('data').add({
        'sample_field': value,
        'timestamp': FieldValue.serverTimestamp(),
      });
      print("データが追加されました！");
    } catch (e) {
      print("データの追加エラー: $e");
    }
  }

  Future<List<Map<String, dynamic>>> fetchUserData(String userId) async {
    try {
      var snapshot = await _firestore
          .collection('users')
          .doc(userId)
          .collection('data')
          .get();

      return snapshot.docs.map((doc) => doc.data()).toList();
    } catch (e) {
      print("データ取得エラー: $e");
      return [];
    }
  }
}
