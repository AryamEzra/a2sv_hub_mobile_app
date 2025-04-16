import 'package:a2sv_hub_mobile/features/a2sv_hub/domain/entities/tracks.dart';
import 'package:equatable/equatable.dart';

// This class acts as a Data Transfer Object (DTO) or Model for the use case result.
// It bundles tracks with their calculated summaries for presentation.
class TrackSummaryData extends Equatable {
  final List<Track> tracks;
  final double averageProgressPercent;
  final int totalProblemsSum;
  final int totalSolvedSum;
  final int totalAvailableSum;
  final int solvedPercentForStats;
  final int availablePercentForStats;

  const TrackSummaryData({
    required this.tracks,
    required this.averageProgressPercent,
    required this.totalProblemsSum,
    required this.totalSolvedSum,
    required this.totalAvailableSum,
    required this.solvedPercentForStats,
    required this.availablePercentForStats,
  });

  // Factory for an empty/default state
  factory TrackSummaryData.empty() => const TrackSummaryData(
    tracks: [],
    averageProgressPercent: 0,
    totalProblemsSum: 0,
    totalSolvedSum: 0,
    totalAvailableSum: 0,
    solvedPercentForStats: 0,
    availablePercentForStats: 0,
  );

  @override
  List<Object?> get props => [
    tracks,
    averageProgressPercent,
    totalProblemsSum,
    totalSolvedSum,
    totalAvailableSum,
    solvedPercentForStats,
    availablePercentForStats,
  ];
}
