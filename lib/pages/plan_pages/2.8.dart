import 'package:flutter/material.dart';

class PlanPage28 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('2.8 (Sat.) Itinerary'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Schedule for 2.8 (Sat.)',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            ScheduleItem(time: '08:00 AM', event: 'Breakfast at hotel'),
            ScheduleItem(time: '10:00 AM', event: 'Visit local market'),
            ScheduleItem(time: '12:30 PM', event: 'Lunch at seafood restaurant'),
            ScheduleItem(time: '03:00 PM', event: 'Explore historical sites'),
            ScheduleItem(time: '06:00 PM', event: 'Dinner with family'),
            ScheduleItem(time: '08:00 PM', event: 'Relax at hotel'),
          ],
        ),
      ),
    );
  }
}

class ScheduleItem extends StatelessWidget {
  final String time;
  final String event;

  ScheduleItem({required this.time, required this.event});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Text(
            time,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Text(
              event,
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}