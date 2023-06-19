import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:quotes/core/error/failures.dart';
import 'package:quotes/core/usecases/usecase.dart';
import 'package:quotes/core/utils/constants.dart';
import 'package:quotes/core/utils/strings/app_strings.dart';
import 'package:quotes/domain/entities/quote.dart';
import 'package:quotes/domain/usecases/get_random_quote.dart';

import 'random_quote_state.dart';

class RandomQuoteCubit extends Cubit<RandomQuoteState> {
  GetRandomQuote getRandomQuoteUseCase;

  RandomQuoteCubit({required this.getRandomQuoteUseCase})
      : super(RandomQuoteInitial());

  Future<void> getRandomQuote(BuildContext context) async {
    emit(LoadingRandomQuote());
    Either<Failure, Quote> response = await getRandomQuoteUseCase(NoParams());
    emit(
      response.fold((failure) {
        Constants.showToast(
            msg: _mapFailureToMessage(failure, context), color: Colors.red);
        return ErrorRandomQuote(msg: _mapFailureToMessage(failure, context));
      }, (quote) => SuccessRandomQuote(quote: quote)),
    );
  }

  String _mapFailureToMessage(Failure failure, BuildContext context) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return getTranslatedText("errors_server", context).toString();
      case CacheFailure:
        return getTranslatedText("errors_cache", context).toString();
      case OfflineFailure:
        return getTranslatedText("error_offline", context).toString();
      default:
        return getTranslatedText("errors_unExpected", context).toString();
    }
  }
}
