import 'package:quotes/core/api/api_consumer.dart';

import '../../core/api/end_point.dart';
import '../models/QuoteModel.dart';

abstract class RandomQuoteRemoteDataSource {
  Future<QuoteModel> getRandomQuote();
}

class RandomQuoteRemoteDataSourceImpl implements RandomQuoteRemoteDataSource {
  ApiConsumer apiConsumer;
  RandomQuoteRemoteDataSourceImpl({
    required this.apiConsumer,
  });

  @override
  Future<QuoteModel> getRandomQuote() async {
    final response = await apiConsumer.get(
      EndPoint.randomQuote,
    );
    return QuoteModel.fromJson(response);
  }
}
