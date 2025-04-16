import 'dart:convert';

class Track {
  final String id;
  final String name;
  final String difficulty;
  final int progress; // Assuming this is 0-100 as used in calculations
  final int totalProblems;
  final int solvedProblems;
  final int availableProblems;

  Track({
    required this.id,
    required this.name,
    required this.difficulty,
    required this.progress,
    required this.totalProblems,
    required this.solvedProblems,
    required this.availableProblems,
  });

  // Factory constructor to create a Track from JSON
  factory Track.fromJson(Map<String, dynamic> json) {
    // Add basic validation/defaults if necessary
    return Track(
      id: json['id'] ?? '', // Provide default or handle null
      name: json['name'] ?? 'Unknown Track',
      difficulty: json['difficulty'] ?? 'Unknown',
      progress:
          (json['progress'] as num?)?.toInt() ?? 0, // Safely convert num to int
      totalProblems: (json['totalProblems'] as num?)?.toInt() ?? 0,
      solvedProblems: (json['solvedProblems'] as num?)?.toInt() ?? 0,
      availableProblems: (json['availableProblems'] as num?)?.toInt() ?? 0,
    );
  }

  // Optional: Method to convert Track instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'difficulty': difficulty,
      'progress': progress,
      'totalProblems': totalProblems,
      'solvedProblems': solvedProblems,
      'availableProblems': availableProblems,
    };
  }

  // Optional: Static helper to parse a list from JSON string (if needed elsewhere)
  static List<Track> parseTracksFromJsonString(String jsonString) {
    final List<dynamic> jsonData = json.decode(jsonString);
    return jsonData
        .map((item) => Track.fromJson(item as Map<String, dynamic>))
        .toList();
  }
}
