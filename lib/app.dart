import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotes/config/locale/app_localizations_setup.dart';
import 'package:quotes/core/utils/strings/app_strings.dart';
import 'package:quotes/presentation/cubit/locale/locale_cubit.dart';

import 'config/routes/app_routes.dart';
import 'config/themes/app_themes.dart';
import 'injection_container.dart' as di;

class QuoteApp extends StatelessWidget {
  const QuoteApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (_) => di.sl<LocaleCubit>()..getSavedLang(context)),
      ],
      child: BlocBuilder<LocaleCubit, LocaleState>(
        buildWhen: (previousStata, currentState) {
          return previousStata != currentState;
        },
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: getTranslatedText("appStr_app_name", context).toString(),
            locale: state.locale,
            theme: appTheme(),
            initialRoute: '/',
            onGenerateRoute: AppRoute.onGenerateRoute,
            supportedLocales: AppLocalizationsSetup.supportedLocales,
            localeResolutionCallback:
                AppLocalizationsSetup.localeResolutionCallback,
            localizationsDelegates:
                AppLocalizationsSetup.localizationsDelegates,
          );
        },
      ),
    );
  }
}
