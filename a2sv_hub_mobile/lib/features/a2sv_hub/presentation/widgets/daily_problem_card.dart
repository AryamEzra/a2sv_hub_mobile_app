import 'package:flutter/material.dart';

class DailyProblemCard extends StatelessWidget {
  final String problemTitle;
  final String difficulty;
  final String category;
  final int solvedCount;
  final VoidCallback onSolvePressed;
  final VoidCallback onUpvotePressed;
  final VoidCallback onDownvotePressed;

  const DailyProblemCard({
    super.key,
    required this.problemTitle,
    required this.difficulty,
    required this.category,
    required this.solvedCount,
    required this.onSolvePressed,
    required this.onUpvotePressed,
    required this.onDownvotePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      decoration: BoxDecoration(
        color: Color(0xFFE0F2E9), // ✅ Green section
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
            "Daily Problem",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            problemTitle,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 8),
          Text(
            "$difficulty · $category",
            style: TextStyle(fontSize: 14, color: Colors.grey[700]),
          ),
          SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: onSolvePressed, // Use the callback function
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF008037), // Button background color
                  foregroundColor: Colors.white, // Text color
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32.0,
                    vertical: 12.0,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      8.0,
                    ), // Button corner radius
                  ),
                ),
                child: const Text(
                  'Solve it now',
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.thumb_up),
                    onPressed: onUpvotePressed,
                  ),
                  Text("$solvedCount"),
                  IconButton(
                    icon: Icon(Icons.thumb_down),
                    onPressed: onDownvotePressed,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
