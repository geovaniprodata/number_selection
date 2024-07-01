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
    double width = 0.5,
    AnimType? animType,
    Function? callBackFunctionPositivo,
    Function? callBackFunctionNegativo,
    Color? corPositivo,
    Color? corNegativo,
    String? textoPerguntaPositivo,
    String? textoPerguntaNegativo,
  }) {
    return AwesomeDialog(
      context: context,
      dialogType: type,
      headerAnimationLoop: false,
      dismissOnBackKeyPress: dismissable,
      dismissOnTouchOutside: dismissable,
      animType: animType ?? AnimType.bottomSlide,
      body: SizedBox(
        width: MediaQuery.of(context).size.width * width,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
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
                    color: Colors.black54,
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
      ),
      btnOkText: textoPerguntaPositivo,
      btnOkColor: corPositivo,
      btnOkOnPress: (() {
        if (callBackFunctionPositivo != null) {
          callBackFunctionPositivo.call();
        }
      }),
      btnCancelText: textoPerguntaNegativo,
      btnCancelColor: corNegativo,
      btnCancelOnPress: (() {
        if (callBackFunctionNegativo != null) {
          callBackFunctionNegativo.call();
        }
      }),
    ).show();
  }
}
