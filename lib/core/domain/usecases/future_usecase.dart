import 'package:dartz/dartz.dart';

mixin FutureUseCase<Failure, Output, Input> {
  Future<Either<Failure, Output>> call(Input params);
}
