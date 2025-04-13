import 'package:flutter/material.dart';

class FeatureCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const buttonColor = Color(0xFF008037);

    return Container(
      padding: EdgeInsets.all(16.0),
      margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      decoration: BoxDecoration(
        color: Color(0xFFE0F2E9), // ✅ Soft background color
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
            "A2SV Hub: Your All-in-One Solution",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            "Streamline organization and collaboration across problem-solving, solution-sharing, contests, and events.",
            style: TextStyle(fontSize: 14),
          ),
          SizedBox(height: 12),

          ElevatedButton(
            onPressed:
                () => print("Learn More clicked"), // Use the callback function
            style: ElevatedButton.styleFrom(
              backgroundColor: buttonColor, // Button background color
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
            child: const Text('Learn More', style: TextStyle(fontSize: 16.0)),
          ),
        ],
      ),
    );
  }
}
