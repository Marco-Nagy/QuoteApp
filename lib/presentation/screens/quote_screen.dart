import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:quotes/config/locale/app_localizations.dart';
import 'package:quotes/core/utils/strings/app_strings.dart';
import 'package:quotes/domain/entities/quote.dart';
import 'package:quotes/presentation/cubit/locale/locale_cubit.dart';
import 'package:quotes/presentation/cubit/random_quote/random_quote_cubit.dart';
import 'package:quotes/presentation/cubit/random_quote/random_quote_state.dart';
import 'package:quotes/presentation/widgets/error_widget.dart' as error_widget;

import '../../core/utils/colors/app_colors.dart';
import '../widgets/quote_content.dart';

class QuoteScreen extends StatefulWidget {
  const QuoteScreen({Key? key}) : super(key: key);

  @override
  State<QuoteScreen> createState() => _QuoteScreenState();
}

class _QuoteScreenState extends State<QuoteScreen> {
  _getRandomQuote() {
    BlocProvider.of<RandomQuoteCubit>(context).getRandomQuote(context);
  }

  @override
  initState() {
    super.initState();
    _getRandomQuote();
  }

  Widget buildBodyContent() {
    return BlocBuilder<RandomQuoteCubit, RandomQuoteState>(
      builder: (context, state) {
        if (state is LoadingRandomQuote) {
          print(state.toString());
          return const CircularProgressIndicator();
        } else if (state is ErrorRandomQuote) {
          print(state.toString());
          return error_widget.ErrorScreen(
            onPress: _getRandomQuote,
          );
        } else if (state is SuccessRandomQuote) {
          print(state.toString());
          return buildBodyScreen(state.quote);
        } else {
          print(state.toString());

          return const CircularProgressIndicator();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => _getRandomQuote(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(getTranslatedText("appStr_app_name", context).toString()),
          leading: IconButton(
            icon: Icon(Icons.translate_outlined, size: 20, color: primary),
            onPressed: () {
              if (AppLocalizations.of(context)!.isEnLocale) {
                BlocProvider.of<LocaleCubit>(context).toArabic(context);
              } else {
                BlocProvider.of<LocaleCubit>(context).toEnglish(context);
              }
            },
          ),
        ),
        body: buildBodyContent(),
      ),
    );
  }

  Widget buildLoading() => Center(
        child: SpinKitFadingCircle(
          itemBuilder: (BuildContext context, int index) {
            return DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: index.isEven ? hint : primary,
              ),
            );
          },
        ),
      );

  Widget buildBodyScreen(Quote quote) => Column(
        children: [
          QuoteContent(
            quote: quote,
          ),
          InkWell(
            onTap: () {
              _getRandomQuote();
            },
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 15),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: primary,
              ),
              child: const Icon(
                Icons.refresh,
                color: Colors.white,
                size: 28,
              ),
            ),
          ),
        ],
      );
}
