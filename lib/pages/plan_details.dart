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
      body: ListView.builder(
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
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 20),
                alignment: Alignment.center,
                child: Text(
                  days[index],
                  style: TextStyle(
                    fontFamily: 'Nunito',
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF6d615b),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}