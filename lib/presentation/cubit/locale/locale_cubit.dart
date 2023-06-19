import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:quotes/core/usecases/usecase.dart';
import 'package:quotes/core/utils/strings/app_strings.dart';
import 'package:quotes/core/utils/strings/error_strings.dart';
import 'package:quotes/domain/usecases/lang_useCases/change_local.dart';
import 'package:quotes/domain/usecases/lang_useCases/get_saved_lang.dart';

part 'locale_state.dart';

class LocaleCubit extends Cubit<LocaleState> {
  final GetSavedLangUseCase getSavedLangUseCase;
  final ChangeLangUseCase changeLangUseCase;

  LocaleCubit({
    required this.getSavedLangUseCase,
    required this.changeLangUseCase,
  }) : super(ChangeLocaleState(Locale(AppStrings.englishCode)));

  String currentCode = AppStrings.englishCode;

  Future<void> getSavedLang(context) async {
    final response = await getSavedLangUseCase.call(NoParams());
    response.fold(
      (failure) => print(ErrorStrings(context).errorFailureMsg.toString()),
      (value) {
        currentCode = value;
        emit(ChangeLocaleState(Locale(currentCode)));
      },
    );
  }

  Future<void> _changeLang(String langCode, context) async {
    final response = await changeLangUseCase.call(langCode);
    response.fold(
      (failure) => print(ErrorStrings(context).errorFailureMsg),
      (value) {
        currentCode = langCode;
        emit(ChangeLocaleState(Locale(currentCode)));
      },
    );
  }

  void toEnglish(context) => _changeLang(AppStrings.englishCode, context);
  void toArabic(context) => _changeLang(AppStrings.arabicCode, context);
}
