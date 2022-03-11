import 'package:clean_architecture_flutter/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:clean_architecture_flutter/features/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:clean_architecture_flutter/features/number_trivia/domain/usecases/get_concrete_number_trivia.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'get_concrete_number_trivia_test.mocks.dart';

@GenerateMocks([
  NumberTriviaRepository
]) // class MockNumberTriviaRepository extends Mock implements NumberTriviaRepository

void main() {
  late GetConcreteNumberTrivia usecase;
  late MockNumberTriviaRepository mockNumberTriviaRepository;

  setUp(() {
    mockNumberTriviaRepository = MockNumberTriviaRepository();
    usecase = GetConcreteNumberTrivia(mockNumberTriviaRepository);
  });

  final tNumber = 1;
  final tNumberTrivia = NumberTrivia(number: 1, text: 'text');

  test('should get trivia for the number from the repository', () async {
    // arrange

    when(mockNumberTriviaRepository.getConcreteNumberTrivia((any)))
        .thenAnswer((_) async => Right(tNumberTrivia));
    // act
    final result = await usecase(Params(number: tNumber));

    //assert
    expect(result, Right(tNumberTrivia));
    // verify(mockNumberTriviaRepository.getConcreteNumberTrivia(tNumber));
    // verify(verifyNoMoreInteractions(mockNumberTriviaRepository));
  });
}
