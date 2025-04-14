import 'package:flutter/material.dart';
import '../../domain/entities/problem.dart';

class ProblemsTable extends StatelessWidget {
  final List<Problem> problems;
  final void Function(String) onFilterSelected; // ✅ Callback for filtering

  const ProblemsTable({
    super.key,
    required this.problems,
    required this.onFilterSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // ✅ FILTER ROW AT THE TOP
        Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children:
                ["All", "Easy", "Medium", "Hard"].map((difficulty) {
                  return ElevatedButton(
                    onPressed: () => onFilterSelected(difficulty),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _getFilterColor(difficulty),
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.0,
                        vertical: 6.0,
                      ),
                    ),
                    child: Text(
                      difficulty,
                      style: TextStyle(
                        color: _getTextColor(difficulty),
                        fontSize: 14,
                      ),
                    ),
                  );
                }).toList(),
          ),
        ),

        // ✅ TABLE CONTENT WITH SCROLLING
        Expanded(
          // ✅ Ensures table takes full space
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: [
                  DataColumn(
                    label: Text("Difficulty"),
                  ), // ✅ Moved to first column
                  DataColumn(label: Text("Name")),
                  DataColumn(label: Text("Tags")),
                  DataColumn(label: Text("Votes")),
                  DataColumn(label: Text("Solved Count")),
                  DataColumn(label: Text("Added")),
                  DataColumn(
                    label: Text("Link"),
                  ), // ✅ New column for external links
                ],
                rows:
                    problems.map((problem) {
                      return DataRow(
                        cells: [
                          DataCell(
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: _buildDifficultyTag(problem.difficulty),
                            ),
                          ), // ✅ Styled difficulty tag
                          DataCell(Text(problem.name)),
                          DataCell(Text(problem.tags.join(", "))),
                          DataCell(Text("${problem.votes}")),
                          DataCell(Text("${problem.solvedCount}")),
                          DataCell(Text(problem.added)),
                          DataCell(
                            IconButton(
                              icon: Icon(Icons.open_in_new),
                              onPressed: () => print("Opening ${problem.link}"),
                            ),
                          ),
                        ],
                      );
                    }).toList(),
              ),
            ),
          ),
        ),
      ],
    );
  }

  // ✅ Helper function to get colors for buttons
  Color _getFilterColor(String difficulty) {
    switch (difficulty) {
      case "Easy":
        return Colors.green[100]!;
      case "Medium":
        return Colors.yellow[100]!;
      case "Hard":
        return Colors.red[100]!;
      default:
        return Colors.grey[200]!;
    }
  }

  Color _getTextColor(String difficulty) {
    switch (difficulty) {
      case "Easy":
        return Colors.green[800]!;
      case "Medium":
        return Colors.yellow[800]!;
      case "Hard":
        return Colors.red[800]!;
      default:
        return Colors.grey[800]!;
    }
  }
}

Widget _buildDifficultyTag(String difficulty) {
  Color bgColor;
  Color textColor; // Declare the textColor variable
  switch (difficulty) {
    case "Easy":
      bgColor = Colors.green[100]!;
      textColor = Colors.green[700]!;
      break;
    case "Medium":
      bgColor = Colors.yellow[100]!;
      textColor = Colors.yellow[800]!;
      break;
    case "Hard":
      bgColor = Colors.red[100]!;
      textColor = Colors.red[700]!;
      break;
    default:
      bgColor = Colors.grey[300]!;
      textColor = Colors.grey[700]!;
  }

  return ElevatedButton(
    onPressed: () {}, // No action, just for styling
    style: ElevatedButton.styleFrom(
      backgroundColor: bgColor,
      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
    ),
    child: Text(difficulty, style: TextStyle(color: textColor)),
  );
}
