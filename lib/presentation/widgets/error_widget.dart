import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quotes/core/utils/colors/app_colors.dart';
import 'package:quotes/core/utils/media_query_values.dart';
import 'package:quotes/core/utils/strings/app_strings.dart';

class ErrorScreen extends StatelessWidget {
  final VoidCallback? onPress;
  const ErrorScreen({Key? key, this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Icon(
              Icons.warning_amber_rounded,
              color: primary,
              size: 150,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 12),
            child: Text(
              getTranslatedText("errors_server", context).toString(),
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w700),
            ),
          ),
          Text(
            getTranslatedText("errors_Please_Try_again_later", context)
                .toString(),
            style: const TextStyle(
                color: hint, fontSize: 18, fontWeight: FontWeight.w500),
          ),
          Container(
            height: 55,
            width: context.w * .55,
            margin: const EdgeInsets.symmetric(vertical: 15),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: primary,
                onPrimary: Theme.of(context).primaryColor,
                elevation: 500,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              onPressed: () {
                if (onPress != null) {
                  onPress!();
                }
              },
              child: Text(
                getTranslatedText("appStr_reload_screen", context).toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
