// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/cupertino.dart';

// class PlanEditPage extends StatefulWidget {
//   final String date;
//   final String? taskId;

//   PlanEditPage({required this.date, this.taskId});

//   @override
//   _PlanEditPageState createState() => _PlanEditPageState();
// }

// class _PlanEditPageState extends State<PlanEditPage> {
//   TextEditingController titleController = TextEditingController();
//   TextEditingController descriptionController = TextEditingController();
//   int? startHour, startMinute, endHour, endMinute;
//   String startPeriod = 'a.m.', endPeriod = 'a.m.';
//   String selectedIcon = 'assets/iconbox/sun.png';

//   // 🔥 時間フォントの選択肢
//   List<Map<String, dynamic>> timeFontStyles = [
//     {
//       'name': '通常',
//       'style': TextStyle(
//         fontFamily: 'Nunito',
//         fontSize: 14,
//         fontWeight: FontWeight.w900,
//         color: Color(0xFFa5a4a4),
//       ),
//     },
//     {
//       'name': '強調',
//       'style': TextStyle(
//         fontFamily: 'Nunito',
//         fontSize: 16,
//         fontWeight: FontWeight.w900,
//         color: Color(0xFFd78282),
//       ),
//     },
//   ];

//   // 🔥 初期スタイル
//   TextStyle selectedTimeStyle = TextStyle(
//     fontFamily: 'Nunito',
//     fontSize: 14,
//     fontWeight: FontWeight.w900,
//     color: Color(0xFFa5a4a4),
//   );

//   @override
//   void initState() {
//     super.initState();
//     if (widget.taskId != null) {
//       FirebaseFirestore.instance
//           .collection('rooms/usa_room/PlanPage/${widget.date.trim().toLowerCase()}/tasks')
//           .doc(widget.taskId)
//           .get()
//           .then((snapshot) {
//         if (snapshot.exists && snapshot.data() != null) {
//           var data = snapshot.data()!;
//           setState(() {
//             titleController.text = data['title'] ?? '';
//             descriptionController.text = data['description'] ?? '';
//             startHour = data['startHour'];
//             startMinute = data['startMinute'];
//             endHour = data['endHour'];
//             endMinute = data['endMinute'];
//             startPeriod = data['startPeriod'] ?? 'a.m.';
//             endPeriod = data['endPeriod'] ?? 'a.m.';
//             selectedIcon = data['icon'] ?? 'assets/iconbox/sun.png';
//           });
//         }
//       });
//     }
//   }

//   void saveTask() {
//     var taskData = {
//       'title': titleController.text,
//       'description': descriptionController.text,
//       'startHour': startHour,
//       'startMinute': startMinute,
//       'startPeriod': startPeriod,
//       'endHour': endHour,
//       'endMinute': endMinute,
//       'endPeriod': endPeriod,
//       'icon': selectedIcon,
//     };

//     Future<void> updateFirestore() async {
//       if (widget.taskId == null) {
//         await FirebaseFirestore.instance
//             .collection('rooms/usa_room/PlanPage/${widget.date}/tasks')
//             .add(taskData);
//       } else {
//         await FirebaseFirestore.instance
//             .collection('rooms/usa_room/PlanPage/${widget.date}/tasks')
//             .doc(widget.taskId)
//             .update(taskData);
//       }
//     }

//     updateFirestore().then((_) {
//       setState(() {});
//       Navigator.pop(context);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('タスク編集')),
//       body: Padding(
//         padding: EdgeInsets.all(16),
//         child: Column(
//           children: [
//             Expanded(
//               child: SingleChildScrollView(
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     TextField(
//                       controller: titleController,
//                       decoration: InputDecoration(labelText: 'タイトル'),
//                     ),
//                     TextField(
//                       controller: descriptionController,
//                       decoration: InputDecoration(labelText: '詳細'),
//                     ),
//                     SizedBox(height: 10),

//                     // 🔥 時間フォント選択ドロップダウン
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text('時間フォント:'),
//                         DropdownButton<TextStyle>(
//                           value: selectedTimeStyle,
//                           items: timeFontStyles.map((font) {
//                             return DropdownMenuItem<TextStyle>(
//                               value: font['style'],
//                               child: Text(font['name']),
//                             );
//                           }).toList(),
//                           onChanged: (newStyle) {
//                             setState(() {
//                               selectedTimeStyle = newStyle!;
//                             });
//                           },
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: 10),

//                     // 🔥 選択されたフォントで時間を表示
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text(
//                           "${startHour ?? '00'}:${startMinute?.toString().padLeft(2, '0') ?? '00'} $startPeriod",
//                           style: selectedTimeStyle,
//                         ),
//                         Text(" 〜 ", style: TextStyle(fontSize: 16)),
//                         Text(
//                           "${endHour ?? '00'}:${endMinute?.toString().padLeft(2, '0') ?? '00'} $endPeriod",
//                           style: selectedTimeStyle,
//                         ),
//                       ],
//                     ),

//                     SizedBox(height: 10),

//                     Row(
//                       children: [
//                         Expanded(
//                           child: CupertinoTimerPicker(
//                             mode: CupertinoTimerPickerMode.hm,
//                             onTimerDurationChanged: (Duration newTime) {
//                               setState(() {
//                                 startHour = newTime.inHours;
//                                 startMinute = newTime.inMinutes % 60;
//                               });
//                             },
//                           ),
//                         ),
//                         Expanded(
//                           child: CupertinoTimerPicker(
//                             mode: CupertinoTimerPickerMode.hm,
//                             onTimerDurationChanged: (Duration newTime) {
//                               setState(() {
//                                 endHour = newTime.inHours;
//                                 endMinute = newTime.inMinutes % 60;
//                               });
//                             },
//                           ),
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: 10),

//                     ElevatedButton(
//                       onPressed: saveTask,
//                       child: Text('保存'),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

