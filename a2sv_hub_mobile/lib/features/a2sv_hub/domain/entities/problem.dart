import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class Problem {
  final String id;
  final String name;
  final String difficulty;
  final List<String> tags;
  final int solvedCount;
  final String added;
  final int votes;
  final String link;

  Problem({
    required this.id,
    required this.name,
    required this.difficulty,
    required this.tags,
    required this.solvedCount,
    required this.added,
    required this.votes,
    required this.link,
  });

  factory Problem.fromJson(Map<String, dynamic> json) {
    return Problem(
      id: json['id'],
      name: json['name'],
      difficulty: json['difficulty'],
      tags: List<String>.from(json['tags']),
      solvedCount: json['solvedCount'],
      added: json['added'],
      votes: json['votes'],
      link: json['link'],
    );
  }

  static Future<List<Problem>> loadProblems() async {
    final jsonString = await rootBundle.loadString(
      'assets/mock_data/mock_problems.json',
    );
    final List<dynamic> jsonData = json.decode(jsonString);
    return jsonData.map((item) => Problem.fromJson(item)).toList();
  }

  // ✅ Add copyWith method
  Problem copyWith({int? votes}) {
    return Problem(
      id: id,
      name: name,
      difficulty: difficulty,
      tags: tags,
      solvedCount: solvedCount,
      added: added,
      votes: votes ?? this.votes,
      link: link,
    );
  }
}
