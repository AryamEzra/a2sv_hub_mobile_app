import 'package:a2sv_hub_mobile/core/error/failures.dart';
import 'package:a2sv_hub_mobile/features/a2sv_hub/domain/entities/tracks.dart';
import 'package:dartz/dartz.dart';

abstract class TrackRepository {
  Future<Either<Failure, List<Track>>> getTracks();
}
