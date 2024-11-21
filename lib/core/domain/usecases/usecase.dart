import 'package:dartz/dartz.dart';

abstract interface class UseCase<Failure, Output, Input> {
  Either<Failure, Output> call(Input params);
}
