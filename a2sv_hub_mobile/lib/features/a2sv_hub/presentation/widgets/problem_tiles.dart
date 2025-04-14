import 'package:flutter/material.dart';

class ProblemTitles extends StatelessWidget {
  const ProblemTitles({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.0), // Space below titles
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // ✅ Align text left
          children: [
            Align(
              alignment: Alignment.centerLeft, // ✅ Force left alignment
              child: Text(
                'Problems',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
            SizedBox(height: 8), // Space between title and subtitle
            Align(
              alignment: Alignment.centerLeft, // ✅ Ensure left alignment
              child: Text(
                'All',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
