import 'package:dartz/dartz.dart';

import '../../core/error/exceptions.dart';
import '../../core/error/failures.dart';
import '../../core/network/network_info.dart';
import '../../domain/entities/quote.dart';
import '../../domain/repositories/quote_repository.dart';
import '../datasource/quote_local_data_source.dart';
import '../datasource/quote_remote_data_source.dart';

class QuoteRepositoryImpl implements QuoteRepository {
  final NetworkInfo networkInfo;
  final RandomQuoteRemoteDataSource randomQuoteRemoteDataSource;
  final RandomQuoteLocalDataSource randomQuoteLocalDataSource;

  const QuoteRepositoryImpl({
    required this.networkInfo,
    required this.randomQuoteRemoteDataSource,
    required this.randomQuoteLocalDataSource,
  });

  @override
  Future<Either<Failure, Quote>> getRandomQuote() async {
    //  if (await networkInfo.isConnected) {
    try {
      final remoteQuote = await randomQuoteRemoteDataSource.getRandomQuote();
      return Right(remoteQuote);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
  // else {
  //   try {
  //     final localQuote =
  //         await randomQuoteLocalDataSource.getLastRandomQuote();
  //     return Right(localQuote);
  //   } on CacheException {
  //     return Left(CacheFailure());
  //   }
  //}
  //}
}
