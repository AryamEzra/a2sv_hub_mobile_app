import 'package:flutter/material.dart';

class ProblemToolbar extends StatelessWidget {
  final Function(String) onFilterSelected; // ✅ Pass filtering function

  const ProblemToolbar({super.key, required this.onFilterSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          _ToolbarButton(icon: Icons.view_column_outlined, text: 'Columns'),
          SizedBox(width: 16),

          // ✅ Filter Button Opens a Modal
          _ToolbarButton(
            icon: Icons.filter_list,
            text: 'Filters',
            onPressed:
                () => showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return Padding(
                      padding: EdgeInsets.all(8),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children:
                              ["All", "Easy", "Medium", "Hard"].map((
                                difficulty,
                              ) {
                                return ElevatedButton(
                                  onPressed: () {
                                    onFilterSelected(difficulty);
                                    Navigator.pop(
                                      context,
                                    ); // ✅ Close sheet after selecting
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: _getFilterColor(
                                      difficulty,
                                    ), // ✅ Fix Error
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
                    );
                  },
                ),
          ),
          SizedBox(width: 16),
          _ToolbarButton(icon: Icons.file_download_outlined, text: 'Export'),
        ],
      ),
    );
  }

  // ✅ Fix: Define `_getFilterColor` inside `ProblemToolbar`
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

// --- Helper Widget for Toolbar Buttons (keep private or make public) ---
class _ToolbarButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback? onPressed; // ✅ Allow custom action

  const _ToolbarButton({
    required this.icon,
    required this.text,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:
          onPressed ??
          () {
            print('$text tapped'); // ✅ Default tap behavior
          },
      child: Row(
        children: [
          Icon(icon, color: Colors.grey[700], size: 20),
          SizedBox(width: 6),
          Text(
            text,
            style: TextStyle(
              color: Colors.grey[800],
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
