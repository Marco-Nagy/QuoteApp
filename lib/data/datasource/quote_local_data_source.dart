import 'dart:convert';

import 'package:dartz/dartz.dart';
import '../../core/error/exceptions.dart';
import '../../core/utils/strings/app_strings.dart';
import '../models/QuoteModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class RandomQuoteLocalDataSource {
  Future<QuoteModel> getLastRandomQuote();
  Future<Unit> cacheQuote(QuoteModel quoteModel);
}

class RandomQuoteLocalDataSourceImpl implements RandomQuoteLocalDataSource {
  SharedPreferences sharedPreferences;
  RandomQuoteLocalDataSourceImpl({
    required this.sharedPreferences,
  });

  @override
  Future<Unit> cacheQuote(QuoteModel quoteModel) {
    sharedPreferences.setString(
        AppStrings.cachedRandomQuote, json.encode(quoteModel));
    return Future.value(unit);
  }

  @override
  Future<QuoteModel> getLastRandomQuote() {
    final jsonString =
        sharedPreferences.getString(AppStrings.cachedRandomQuote);
    if (jsonString == null) {
      final decodeJsonData =
          Future.value(QuoteModel.fromJson(json.decode(jsonString!)));
      return decodeJsonData;
    } else {
      throw CacheException();
    }
  }
}
