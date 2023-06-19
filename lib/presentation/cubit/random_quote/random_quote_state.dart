import 'package:equatable/equatable.dart';
import 'package:quotes/domain/entities/quote.dart';

abstract class RandomQuoteState extends Equatable {
  const RandomQuoteState();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class RandomQuoteInitial extends RandomQuoteState {
  @override
  List<Object> get props => [];
}

class LoadingRandomQuote extends RandomQuoteState {}

class SuccessRandomQuote extends RandomQuoteState {
  final Quote quote;

  @override
  List<Object?> get props => [];

  const SuccessRandomQuote({
    required this.quote,
  });
}

class ErrorRandomQuote extends RandomQuoteState {
  String msg;

  ErrorRandomQuote({
    required this.msg,
  });
  @override
  // TODO: implement props
  List<Object?> get props => [msg];
}
