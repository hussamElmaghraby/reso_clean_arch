// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:reso_clean_arch/core/errors/failures.dart';
import 'package:reso_clean_arch/core/errors/usercases/usecase.dart';
import 'package:reso_clean_arch/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:reso_clean_arch/features/number_trivia/domain/repositories/number_trivia_repository.dart';

class GetConcreteNumberTrivia implements Usecase<NumberTrivia, Params> {
  final NumberTriviaRepository numberTriviaRepository;
  GetConcreteNumberTrivia({
    required this.numberTriviaRepository,
  });

  @override
  Future<Either<Failure, NumberTrivia>?>? call(params) async {
    return await numberTriviaRepository.getConcreteNumberTrivia(params.number);
  }
}

// hold all params of the usecase
class Params extends Equatable {
  final int number;
  const Params({required this.number});

  @override
  List<Object> get props => [number];
}
