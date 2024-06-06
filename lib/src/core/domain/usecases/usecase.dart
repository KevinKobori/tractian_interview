import 'package:dartz/dartz.dart';

mixin UseCase<Failure, Output, Input> {
  Either<Failure, Output> call(Input params);
}
