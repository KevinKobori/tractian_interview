import 'package:dartz/dartz.dart';

mixin UseCase<Failure, Output, Input> {
  Future<Either<Failure, Output>> call(Input params);
}
