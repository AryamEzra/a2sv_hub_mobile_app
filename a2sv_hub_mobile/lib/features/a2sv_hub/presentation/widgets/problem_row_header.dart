import 'package:flutter/material.dart';

class ProblemRowHeader extends StatelessWidget {
  const ProblemRowHeader({super.key});

  @override
  Widget build(BuildContext context) {
    // Style for the header text
    final headerStyle = TextStyle(
      color: Colors.grey[600], // Grey color for header text
      fontWeight: FontWeight.w500, // Medium weight
      fontSize: 13, // Adjust font size as needed
    );

    return Padding(
      // Vertical padding for the header row, horizontal to align with rows
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
      child: Row(
        children: [
          // Difficulty column (fixed width)
          SizedBox(
            width: 80, // Match the width used in ProblemRow's chip
            child: Text('Difficulty', style: headerStyle),
          ),
          const SizedBox(width: 16), // Spacing
          // Name column (takes up flexible space)
          Expanded(
            flex: 3, // Give Name more space relative to Tag
            child: Text('Name', style: headerStyle),
          ),
          const SizedBox(width: 16), // Spacing
          // Tag column (takes up flexible space)
          Expanded(
            flex: 1, // Give Tag less space than Name
            child: Text(
              'Tag',
              style: headerStyle,
              overflow: TextOverflow.ellipsis, // Handle overflow if needed
            ),
          ),
          const SizedBox(width: 16), // Spacing
          // Solved column (fixed width)
          SizedBox(
            width: 50, // Match width used in ProblemRow
            child: Text(
              'Solved',
              style: headerStyle,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(width: 16), // Spacing
          // Added column (fixed width)
          SizedBox(
            width: 50, // Match width used in ProblemRow
            child: Text(
              'Added',
              style: headerStyle,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(width: 16), // Spacing
          // Vote column (fixed width)
          SizedBox(
            width: 70, // Match width used in ProblemRow
            child: Text(
              'Vote',
              style: headerStyle,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(width: 16), // Spacing
          // Link column (fixed width)
          SizedBox(
            width: 40, // Match width used in ProblemRow
            child: Text(
              'Link',
              style: headerStyle,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
