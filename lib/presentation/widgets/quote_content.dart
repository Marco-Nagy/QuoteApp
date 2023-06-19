import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quotes/core/utils/colors/app_colors.dart';
import 'package:quotes/domain/entities/quote.dart';

class QuoteContent extends StatelessWidget {
  Quote quote;
  QuoteContent({Key? key, required this.quote}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: primary, borderRadius: BorderRadius.circular(30)),
      child: Center(
        child: Column(
          children: [
            Text(
              quote.content,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text(
              quote.author,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
