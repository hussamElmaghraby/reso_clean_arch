import 'package:dartz/dartz.dart';
import 'package:reso_clean_arch/core/errors/failures.dart';

abstract class Usecase<Type, Params> {
  Future<Either<Failure, Type>?>? call(Params params);
}
