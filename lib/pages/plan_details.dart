import 'dart:math';
import 'package:flutter/material.dart';
import 'package:florida_handbook/pages/plan_pages/2.8.dart';
import 'package:florida_handbook/pages/plan_pages/2.9.dart';
import 'package:florida_handbook/pages/plan_pages/2.10.dart';
import 'package:florida_handbook/pages/plan_pages/2.11.dart';
import 'package:florida_handbook/pages/plan_pages/2.12.dart';
import 'package:florida_handbook/pages/plan_pages/2.13.dart';
import 'package:florida_handbook/pages/plan_pages/2.14.dart';
import 'package:florida_handbook/pages/plan_pages/2.15.dart';
import 'package:florida_handbook/pages/plan_pages/2.16.dart';
import 'package:florida_handbook/pages/plan_pages/2.17.dart';
import 'package:florida_handbook/pages/plan_pages/2.18.dart';

class PlanDetailsPage extends StatelessWidget {
  final List<String> days = [
    '2.8 (Sat.)', '2.9 (Sun.)', '2.10 (Mon.)', '2.11 (Tue.)', '2.12 (Wed.)',
    '2.13 (Thu.)', '2.14 (Fri.)', '2.15 (Sat.)', '2.16 (Sun.)', '2.17 (Mon.)', '2.18 (Tue.)'
  ];

  final Map<String, Widget> dayPages = {
    '2.8 (Sat.)': PlanPage28(),
    '2.9 (Sun.)': PlanPage29(),
    '2.10 (Mon.)': PlanPage210(),
    '2.11 (Tue.)': PlanPage211(),
    '2.12 (Wed.)': PlanPage212(),
    '2.13 (Thu.)': PlanPage213(),
    '2.14 (Fri.)': PlanPage214(),
    '2.15 (Sat.)': PlanPage215(),
    '2.16 (Sun.)': PlanPage216(),
    '2.17 (Mon.)': PlanPage217(),
    '2.18 (Tue.)': PlanPage218(),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Itinerary',
          style: TextStyle(
            fontFamily: 'Merriweather',
            fontSize: 34,
            fontWeight: FontWeight.bold,
            color: Color(0xFFCCA092),
          ),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          // リストビュー（元のリストを表示）
          ListView.builder(
            itemCount: days.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => dayPages[days[index]]!,
                    ),
                  );
                },
                child: Card(
                  margin: EdgeInsets.symmetric(horizontal: 120, vertical: 8),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.5, // 画面幅の50%に設定
                    padding: EdgeInsets.symmetric(vertical: 10),
                    alignment: Alignment.center,
                    child: Text(
                      days[index],
                      style: TextStyle(
                        fontFamily: 'Nunito',
                        fontSize: 22,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFFa5a4a4),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),

          // 画像を上から配置0
          Positioned(
            top: 10,  // 上から50px
            left: 40, // 右から20px
            child: Opacity(
              opacity: 1, // 透明度を70%にする
              child: 
              Transform.rotate(
  angle: pi / 3, // 45度回転（自由に変更可能）
  child:
  Image.asset(
                'assets/iconbox/airplane.png',
                width: 50,  // 幅
                height: 50, // 高さ
                fit: BoxFit.cover, // 画像の表示方法を調整
              ),
            ),
            ),
          ),

          // 画像を上から配置1
          Positioned(
            top: 70,  // 上から50px
            right: 10, // 右から20px
            child: Opacity(
              opacity: 1, // 透明度を70%にする
              child: 
              Transform.rotate(
  angle: pi / 12, // 45度回転（自由に変更可能）
  child:
  Image.asset(
                'assets/pensacola.png',
                width: 100,  // 幅
                height: 100, // 高さ
                fit: BoxFit.cover, // 画像の表示方法を調整
              ),
            ),
            ),
          ),


          // 画像を上から配置2
          Positioned(
            top: 160,  // 上から50px
            left: 10, // 右から20px
            child: Opacity(
              opacity: 1, // 透明度を70%にする
              child: 
              Transform.rotate(
  angle: pi / 20, // 45度回転（自由に変更可能）
  child:
  Image.asset(
                'assets/iconbox/sea-turtle.png',
                width: 100,  // 幅
                height: 100, // 高さ
                fit: BoxFit.cover, // 画像の表示方法を調整
              ),
            ),
            ),
          ),
        ],
      ),
    );
  }
}
