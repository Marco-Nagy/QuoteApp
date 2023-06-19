part of 'locale_cubit.dart';

abstract class LocaleState extends Equatable {
  Locale locale;
  @override
  // TODO: implement props
  List<Object?> get props => [locale];
  LocaleState(this.locale);
}

class ChangeLocaleState extends LocaleState {
  final Locale selectedLocale;
  ChangeLocaleState(this.selectedLocale) : super(selectedLocale);
}
