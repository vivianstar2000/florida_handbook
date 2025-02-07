// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'plan_edit_page.dart';

// // 🔥 時間をフォーマットする関数
// String _formatTime(int? hour, int? minute, String? period) {
//   if (hour == null || minute == null || period == null) {
//     return "時間未設定";
//   }

//   // 分を2桁に統一
//   String formattedMinute = minute.toString().padLeft(2, '0');

//   // 🔥 24時間制から12時間制へ変換
//   String adjustedPeriod = period; // Firestoreから取得した period をそのまま利用
//   int adjustedHour = hour;

//   // 24時間表記を正しい12時間表記に変換
//   if (hour >= 12) {
//     adjustedPeriod = "p.m."; // 12以上は p.m.
//     if (hour > 12) adjustedHour -= 12; // 13時以上なら 12 を引く
//   } else {
//     adjustedPeriod = "a.m."; // 0〜11 は a.m.
//     if (hour == 0) adjustedHour = 12; // 0時を12 a.m. に変換
//   }

//   return "$adjustedHour:$formattedMinute $adjustedPeriod";
// }





// class PlanPage extends StatelessWidget {
//   final String date;

//   PlanPage({required this.date});

//   @override
//   Widget build(BuildContext context) {
//     final fixedDate = date.trim(); 

//     FirebaseFirestore.instance
//         .collection('rooms/usa_room/PlanPage')
//         .get()
//         .then((snapshot) {
//       print("🔍 Firestoreの全 `PlanPage` の日付リスト:");
//       for (var doc in snapshot.docs) {
//         print("📅 Firestoreの日付: ${doc.id}");
//       }
//     }).catchError((error) {
//       print("❌ Firestore 取得エラー: $error");
//     });

//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           '$date',
//           style: TextStyle(
//             fontFamily: 'Nunito',
//             fontSize: 34,
//             fontWeight: FontWeight.w800,
//             color: Color(0xFFCCA092),
//           ),
//         ),
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         actions: [
//           Padding(
//             padding: EdgeInsets.only(right: 15),
//             child: GestureDetector(
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => PlanEditPage(date: date),
//                   ),
//                 );
//               },
//               child: CircleAvatar(
//                 backgroundColor: Color(0xFFd3b2a7),
//                 child: Icon(Icons.add, color: Colors.white, size: 24),
//               ),
//             ),
//           ),
//         ],
//       ),

//       body: StreamBuilder(
//         stream: FirebaseFirestore.instance
//             .collection('rooms/usa_room/PlanPage/$fixedDate/tasks')
//             .snapshots(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           }
//           if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
//             print("⚠️ Firestore: データなし (スナップショットにデータがない)");
//             return Center(child: Text("データがありません"));
//           }

//           var tasks = snapshot.data!.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();

//           print("📌 Firestore取得データ (${tasks.length} 件):");
//           for (var task in tasks) {
//             print(task);
//           }

//           return ListView.builder(
//             itemCount: tasks.length,
//             itemBuilder: (context, index) {
//               var task = tasks[index];

//               // 🔥 `startHour`, `startMinute`, `startPeriod` から `timeStart` に変換
//               String formattedStartTime = _formatTime(
//                 task['startHour'],
//                 task['startMinute'],
//                 task['startPeriod'],
//               );
//               String formattedEndTime = _formatTime(
//                 task['endHour'],
//                 task['endMinute'],
//                 task['endPeriod'],
//               );

//               return TaskCard(
//                 taskData: {
//                   'title': task['title'] ?? 'No Title',
//                   'description': task['description'] ?? 'No Description',
//                   'icon': task['icon'] ?? 'assets/iconbox/default.png',
//                   'timeStart': formattedStartTime,  // ✅ 修正済みの時間フォーマット
//                   'timeEnd': formattedEndTime,      // ✅ 修正済みの時間フォーマット
//                 },
//                 taskId: snapshot.data!.docs[index].id,
//                 date: date,
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => PlanEditPage(
//                         date: date, 
//                         taskId: snapshot.data!.docs[index].id, 
//                       ),
//                     ),
//                   );
//                 },
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }


// class TaskCard extends StatelessWidget {
//   final Map<String, dynamic> taskData;
//   final String taskId;
//   final String date;
//   final VoidCallback onTap;

//   TaskCard({required this.taskData, required this.taskId, required this.date, required this.onTap});

//   @override
//   Widget build(BuildContext context) {
//     return Dismissible(
//       key: Key(taskId),
//       direction: DismissDirection.endToStart,
//       background: Container(
//         color: Colors.red,
//         alignment: Alignment.centerRight,
//         padding: EdgeInsets.symmetric(horizontal: 20),
//         child: Icon(Icons.delete, color: Colors.white),
//       ),
//       onDismissed: (_) {
//         FirebaseFirestore.instance
//             .collection('rooms/usa_room/PlanPage/$date/tasks')
//             .doc(taskId)
//             .delete()
//             .then((_) => print("✅ Firestore削除成功 (ID: $taskId)"))
//             .catchError((error) => print("❌ Firestore削除エラー: $error"));
//       },

//       child: Card(
//         color: Colors.transparent,
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//         elevation: 0,
//         child: Padding(
//           padding: const EdgeInsets.only(left: 20, right: 10, top: 10, bottom: 10),
//           child: GestureDetector(
//             onTap: onTap,
//             child: Row(
//               children: [
//                 // 🔥 アイコン
//                 Expanded(
//                   flex: 1,
//                   child: Image.asset(
//                     taskData['icon'] ?? 'assets/iconbox/default.png',
//                     width: 30,
//                     height: 30,
//                   ),
//                 ),

//                 // 🔥 時間
//                 Expanded(
//                   flex: 3,
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text(
//                         taskData['timeStart'] ?? '',
//                         style: TextStyle(
//                           fontFamily: 'Nunito',
//                           fontSize: 14,
//                           fontWeight: FontWeight.w900,
//                           color: Color(0xFFa5a4a4),
//                         ),
//                       ),
//                       if (taskData['timeEnd'] != "時間未設定")
//                         Padding(
//                           padding: const EdgeInsets.symmetric(vertical: 2.0),
//                           child: Text("|",
//                               style: TextStyle(
//                                 fontSize: 12,
//                                 fontWeight: FontWeight.bold,
//                                 color: Color(0xFFa5a4a4),
//                               )),
//                         ),
//                       Text(
//                         taskData['timeEnd'] ?? '',
//                         style: TextStyle(
//                           fontFamily: 'Nunito',
//                           fontSize: 14,
//                           fontWeight: FontWeight.w900,
//                           color: Color(0xFFa5a4a4),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),

//                 // 🔥 タイトルと詳細
//                 Expanded(
//                   flex: 6, // ここを追加
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start, // 左寄せ
//                     children: [
//                       Text(
//                         taskData['title'] ?? 'No Title',
//                         style: TextStyle(
//                           fontFamily: 'Nunito',
//                           fontSize: 16,
//                           fontWeight: FontWeight.w800,
//                           color: Colors.black87,
//                         ),
//                       ),
//                       SizedBox(height: 4),
//                       Text(
//                         taskData['description'] ?? 'No Description',
//                         style: TextStyle(
//                           fontFamily: 'Nunito',
//                           fontSize: 14,
//                           fontWeight: FontWeight.w500,
//                           color: Colors.black54,
//                         ),
//                         maxLines: 2, // 2行まで表示
//                         overflow: TextOverflow.ellipsis, // 長すぎる場合は「…」
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

