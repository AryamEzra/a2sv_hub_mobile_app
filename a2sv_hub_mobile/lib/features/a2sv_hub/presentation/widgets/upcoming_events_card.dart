import 'package:flutter/material.dart';

class UpcomingEventsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      decoration: BoxDecoration(
        color: Color(0xFFE0F2E9), // ✅ Light green background
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 4,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Upcoming Event",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            "Problem-Solving Contest",
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 8),
          Text(
            "Starts in: 2d 38m 31s",
            style: TextStyle(fontSize: 14, color: Colors.green),
          ),
          SizedBox(height: 8),
          Text(
            "Date: Fri Apr 11 | 05:30 - 08:00",
            style: TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }
}
