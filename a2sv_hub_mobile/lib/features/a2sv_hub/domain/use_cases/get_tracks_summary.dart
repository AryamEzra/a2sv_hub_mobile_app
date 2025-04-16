import 'package:a2sv_hub_mobile/core/error/failures.dart';
import 'package:a2sv_hub_mobile/features/a2sv_hub/domain/entities/tracks.dart';
import 'package:a2sv_hub_mobile/features/a2sv_hub/domain/entities/tracks_summary_data.dart';
import 'package:a2sv_hub_mobile/features/a2sv_hub/domain/repositories/track_repository.dart';
import 'package:dartz/dartz.dart';

// Use Case responsible for getting tracks and calculating their summary
class GetTracksSummary {
  final TrackRepository repository;

  GetTracksSummary(this.repository); // Depends on the repository contract

  /// Executes the use case.
  /// Fetches tracks via the repository and calculates summary data.
  /// Returns [Either] a [Failure] or [TrackSummaryData].
  Future<Either<Failure, TrackSummaryData>> execute() async {
    final failureOrTracks = await repository.getTracks();

    // Process the result from the repository
    return failureOrTracks.fold(
      (failure) {
        // If repository returned failure, pass it through
        print("GetTracksSummary: Fetch failed, returning Failure.");
        return Left(failure);
      },
      (tracks) {
        // If repository returned tracks, calculate summary
        print("GetTracksSummary: Fetch succeeded, calculating summary...");
        final summaryData = _calculateSummary(tracks);
        print(
          "GetTracksSummary: Summary calculated, returning TrackSummaryData.",
        );
        return Right(summaryData);
      },
    );
  }

  // Private helper method to calculate summary data from a list of tracks
  TrackSummaryData _calculateSummary(List<Track> tracks) {
    if (tracks.isEmpty) {
      return TrackSummaryData.empty();
    }

    int totalProblems = 0;
    int totalSolved = 0;
    double totalProgressSumPercent = 0; // Sum of individual track.progress

    for (var track in tracks) {
      totalProblems += track.totalProblems;
      totalSolved += track.solvedProblems;
      totalProgressSumPercent += track.progress; // Use the 'progress' field
    }

    // Calculate overall available problems
    final int totalAvailable = totalProblems - totalSolved;
    // Calculate average progress based on the 'progress' field in Track
    final double averageProgress = totalProgressSumPercent / tracks.length;

    // Calculate overall percentages for StatsCard based on problems
    final int solvedPercent =
        (totalProblems > 0) ? ((totalSolved / totalProblems) * 100).round() : 0;
    // Recalculate available percent for accuracy, ensure it sums to 100 with solved
    final int availablePercent = (totalProblems > 0) ? 100 - solvedPercent : 0;

    return TrackSummaryData(
      tracks: tracks,
      averageProgressPercent: averageProgress.clamp(0, 100), // Ensure 0-100
      totalProblemsSum: totalProblems,
      totalSolvedSum: totalSolved,
      totalAvailableSum: totalAvailable.clamp(
        0,
        totalProblems,
      ), // Ensure non-negative
      solvedPercentForStats: solvedPercent.clamp(0, 100),
      availablePercentForStats: availablePercent.clamp(0, 100),
    );
  }
}
