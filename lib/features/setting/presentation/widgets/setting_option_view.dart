import 'package:flutter/material.dart';
import 'package:flutter_tdd_boilerplate/core/utils/theme/theme.dart';

class SettingOptionView extends StatelessWidget {
  const SettingOptionView({
    Key? key,
    required this.title,
    required this.msg,
    this.onPressed,
  }) : super(key: key);

  final String title;
  final String msg;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    AppTheme theme = AppTheme.instance;
    return Column(
      children: [
        MaterialButton(
          padding: EdgeInsets.symmetric(horizontal: 12),
          onPressed: onPressed,
          child: Row(
            children: [
              Text(
                "$title: ",
                style: TextStyle(
                    color: theme.textColor,
                    fontSize: theme.fontSize.normal,
                    fontWeight: FontWeight.w400),
              ),
              Text(
                "$msg",
                style: TextStyle(
                    color: theme.textColor,
                    fontSize: theme.fontSize.normal,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
        Container(
          height: 0.5,
          margin: EdgeInsets.symmetric(horizontal: 12),
          color: theme.textColor.withAlpha(100),
        )
      ],
    );
  }
}
