import 'package:flutter/material.dart';
import '../../domain/entities/problem.dart';

class ProblemDetailsCard extends StatelessWidget {
  final Problem problem;
  final VoidCallback onClose;

  const ProblemDetailsCard({
    super.key,
    required this.problem,
    required this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      decoration: BoxDecoration(
        color: Colors.green[100],
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
            problem.name,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text("${problem.difficulty} · ${problem.tags.join(", ")}"),
          SizedBox(height: 8),
          Text("Solved by ${problem.solvedCount} users"),
          SizedBox(height: 8),
          ElevatedButton(
            onPressed: () => print("Solving problem..."),
            child: Text("Solve it now"),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
          ),
          SizedBox(height: 8),
          ElevatedButton(onPressed: onClose, child: Text("Close")),
        ],
      ),
    );
  }
}
