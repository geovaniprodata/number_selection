import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

class Awesome {
  static Future<void> custom(
    BuildContext context,
    String title,
    String desc, {
    Widget? content,
    DialogType type = DialogType.info,
    bool dismissable = false,
    double? width,
    AnimType? animType,
    Function()? callBackFunctionPositivo,
    Function()? callBackFunctionNegativo,
    Color? corPositivo,
    Color? corNegativo,
    String? textoPerguntaPositivo,
    String? textoPerguntaNegativo,
    bool isDark = true,
  }) {
    var size = MediaQuery.of(context).size;
    width = width ?? size.width * .4;

    return AwesomeDialog(
      context: context,
      dialogType: type,
      width: width,
      dialogBackgroundColor: isDark ? Colors.black87 : Colors.white,
      titleTextStyle: Theme.of(context).textTheme.headlineMedium?.copyWith(color: isDark ? Colors.white : Colors.black),
      descTextStyle: Theme.of(context).textTheme.labelMedium?.copyWith(color: isDark ? Colors.white : Colors.black),
      headerAnimationLoop: false,
      dismissOnBackKeyPress: dismissable,
      dismissOnTouchOutside: dismissable,
      animType: animType ?? AnimType.bottomSlide,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: isDark ? Colors.white : Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                desc,
                textAlign: TextAlign.justify,
                style: TextStyle(
                  color: isDark ? Colors.white70 : Colors.black54,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            content ?? const SizedBox.shrink(),
          ]
              .map((e) => Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: e,
                  ))
              .toList(),
        ),
      ),
      btnOkText: textoPerguntaPositivo,
      btnOkColor: corPositivo,
      btnOkOnPress: callBackFunctionPositivo,
      btnCancelText: textoPerguntaNegativo,
      btnCancelColor: corNegativo,
      btnCancelOnPress: callBackFunctionNegativo,
    ).show();
  }
}
