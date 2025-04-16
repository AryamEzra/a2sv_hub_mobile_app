import 'package:equatable/equatable.dart';

// Base abstract class for all Failures
abstract class Failure extends Equatable {
  const Failure();

  @override
  List<Object?> get props => []; // Allow nullable props if needed
}

// General failures
class ServerFailure extends Failure {
  final String? message;
  const ServerFailure({this.message});
  @override
  List<Object?> get props => [message];
}

class CacheFailure extends Failure {
  final String? message;
  const CacheFailure({this.message});
  @override
  List<Object?> get props => [message];
}

class NetworkFailure extends Failure {
  final String? message;
  const NetworkFailure({this.message});
  @override
  List<Object?> get props => [message];
}

class ParsingFailure extends Failure {
  final String? message;
  const ParsingFailure({this.message});
  @override
  List<Object?> get props => [message];
}

class AssetReadFailure extends Failure {
  final String? message;
  const AssetReadFailure({this.message});
  @override
  List<Object?> get props => [message];
}
