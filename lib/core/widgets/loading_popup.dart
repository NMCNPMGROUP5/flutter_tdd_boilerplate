import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingPopup {
  static BuildContext? _context;
  static void hide() {
    var ctx = _context;
    if (ctx != null) {
      _context = null;
      try {
        Navigator.of(ctx).pop();
      } catch (e) {
        print(e);
      }
    } else {
      //do nothing
    }
  }

  static void show(BuildContext context) {
    if (_context == null) {
      _context = context;
      showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          _context = context;
          return Scaffold(
            backgroundColor: Colors.transparent,
            body: Center(
              child: Theme.of(context).platform == TargetPlatform.iOS
                  ? Theme(
                      data: ThemeData(
                          cupertinoOverrideTheme:
                              CupertinoThemeData(brightness: Brightness.dark)),
                      child: CupertinoActivityIndicator(
                        radius: 14,
                      ))
                  : CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
            ),
          );
        },
      );
    } else {
      //do nothing
    }
  }
}
