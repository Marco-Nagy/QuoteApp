import 'package:flutter/material.dart';
import 'package:quotes/core/utils/strings/app_strings.dart';

extension ErrorStrings on BuildContext {
  get noConnectionsErrorMsg => getTranslatedText(
      "please_check_your_internet_connection_and_try_again", this);
  get serverFailureMsg => 'Please Try again later ... ';
  static const emptyCacheFailureMsg = 'No Data ... ';
  static const offLineFailureMsg =
      'Please Check Your Internet Connections ... ';
  static const unExpectedFailureMsg =
      'Unexpected Error , Please Try again later ... ';
  get errorFailureMsg => getTranslatedText("something_went_wrong", this);
}
