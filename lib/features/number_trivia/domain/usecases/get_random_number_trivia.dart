import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:reso_clean_arch/core/errors/failures.dart';
import 'package:reso_clean_arch/core/errors/usercases/usecase.dart';
import 'package:reso_clean_arch/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:reso_clean_arch/features/number_trivia/domain/repositories/number_trivia_repository.dart';

class GetRandomNumberTrivia implements Usecase<NumberTrivia, NoParams> {
  final NumberTriviaRepository numberTriviaRepository;

  GetRandomNumberTrivia(this.numberTriviaRepository);

  @override
  Future<Either<Failure, NumberTrivia>?>? call(NoParams noParams) {
    return numberTriviaRepository.getRandomNumberTrivia();
  }
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => throw UnimplementedError();
}
