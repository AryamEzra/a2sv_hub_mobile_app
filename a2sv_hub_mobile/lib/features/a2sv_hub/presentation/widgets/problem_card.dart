import 'package:flutter/material.dart';
import '../../domain/entities/problem.dart'; // ✅ Use the existing Problem entity

class ProblemCard extends StatelessWidget {
  final Problem problem; // ✅ Directly use the Problem entity
  final VoidCallback onVoteUp;
  final VoidCallback onVoteDown;
  final VoidCallback onOpenDetails;

  const ProblemCard({
    super.key,
    required this.problem,
    required this.onVoteUp,
    required this.onVoteDown,
    required this.onOpenDetails,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: ListTile(
        title: Text(
          problem.name,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          "${problem.difficulty} · ${problem.tags.join(", ")} · ${problem.added}",
          style: TextStyle(color: Colors.grey[700]),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(icon: Icon(Icons.thumb_up), onPressed: onVoteUp),
            Text("${problem.votes}"),
            IconButton(icon: Icon(Icons.thumb_down), onPressed: onVoteDown),
          ],
        ),
        onTap: onOpenDetails,
      ),
    );
  }
}
