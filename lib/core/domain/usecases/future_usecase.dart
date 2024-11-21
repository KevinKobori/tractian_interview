import 'package:dartz/dartz.dart';

abstract interface class FutureUseCase<Failure, Output, Input> {
  Future<Either<Failure, Output>> call(Input params);
}
