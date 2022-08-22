import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:reso_clean_arch/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:reso_clean_arch/features/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:reso_clean_arch/features/number_trivia/domain/usecases/get_concrete_number_trivia.dart';

class MockNubmerTriviaRepository extends Mock
    implements NumberTriviaRepository {}

void main() {
  late GetConcreteNumberTrivia usecase;
  late MockNubmerTriviaRepository mockNumberTriviaRepository;
  late int tNumber;
  late NumberTrivia tNumberTrivia;

// runs before every single test.
  setUp(() {
    mockNumberTriviaRepository = MockNubmerTriviaRepository();
    usecase = GetConcreteNumberTrivia(
      numberTriviaRepository: mockNumberTriviaRepository,
    );
    tNumber = 1;
    tNumberTrivia = const NumberTrivia(text: 'number trivia', number: 1);
  });

  test('should get trivia for the number from repository', () async {
    //arrange

    when(mockNumberTriviaRepository.getConcreteNumberTrivia(tNumber))
        .thenAnswer((_) => Future.value(Right(tNumberTrivia)));

    //act
    // final result = await usecase.call(tNumber);
    final result = await usecase(Params(number: tNumber));
    //assert
    NumberTrivia? expected;
    result?.fold((l) => null, (r) => expected = r);
    expect(expected, tNumberTrivia);
    verify(mockNumberTriviaRepository.getConcreteNumberTrivia(tNumber));
    verifyNoMoreInteractions(mockNumberTriviaRepository);
  });
}
