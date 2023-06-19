import 'package:dartz/dartz.dart';

import '../../core/error/failures.dart';
import '../../core/usecases/usecase.dart';
import '../entities/quote.dart';
import '../repositories/quote_repository.dart';

class GetRandomQuote implements UseCase<Quote, NoParams> {
  QuoteRepository quoteRepository;
  GetRandomQuote({
    required this.quoteRepository,
  });
  @override
  Future<Either<Failure, Quote>> call(NoParams params) {
    return quoteRepository.getRandomQuote();
  }
}
