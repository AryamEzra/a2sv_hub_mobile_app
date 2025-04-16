import 'dart:convert';
import 'package:a2sv_hub_mobile/core/error/failures.dart';
import 'package:a2sv_hub_mobile/features/a2sv_hub/domain/entities/tracks.dart';
import 'package:a2sv_hub_mobile/features/a2sv_hub/domain/repositories/track_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart' show rootBundle;

// Concrete implementation of TrackRepository using mock JSON assets
class TrackRepositoryImpl implements TrackRepository {
  // In a real app, inject data sources (remote, local) here
  // final TrackRemoteDataSource remoteDataSource;
  // final TrackLocalDataSource localDataSource;
  // TrackRepositoryImpl({required this.remoteDataSource, required this.localDataSource});

  final String _mockDataPath = 'assets/mock_data/mock_tracks.json';

  @override
  Future<Either<Failure, List<Track>>> getTracks() async {
    // For now, we load directly from the mock JSON asset
    try {
      print("TrackRepositoryImpl: Loading mock data from $_mockDataPath");
      // 1. Load JSON string from asset
      final jsonString = await rootBundle.loadString(_mockDataPath);

      // 2. Decode JSON string
      final List<dynamic> jsonList = json.decode(jsonString);

      // 3. Parse into List<Track> using Track.fromJson
      final List<Track> tracks =
          jsonList
              .map(
                (jsonItem) => Track.fromJson(jsonItem as Map<String, dynamic>),
              )
              .toList();

      print(
        "TrackRepositoryImpl: Successfully parsed ${tracks.length} tracks.",
      );
      // Simulate network delay
      await Future.delayed(const Duration(milliseconds: 300));

      return Right(tracks); // Success
    }
    // Catch specific exceptions if needed (e.g., FormatException for bad JSON)
    catch (e) {
      print("TrackRepositoryImpl: Error loading/parsing mock JSON: $e");
      // Return a specific Failure type
      return Left(AssetReadFailure(message: "Failed to load track data: $e"));
    }
  }
}
