import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tdd_boilerplate/core/utils/theme/theme.dart';

class ModalBottom {
  static void show({
    required String title,
    required List<ItemModal> items,
    required BuildContext context,
  }) {
    AppTheme theme = AppTheme.instance;
    showModalBottomSheet(
        elevation: 10,
        context: context,
        barrierColor: Colors.black45,
        builder: (context) {
          return Container(
            decoration: BoxDecoration(
              color: theme.backgroundColor,
            ),
            child: SafeArea(
              top: false,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 45,
                    child: Center(
                      child: Text(
                        title,
                        style: TextStyle(
                          color: AppTheme.instance.textColor,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 0.5,
                    color: Colors.grey.shade400,
                  ),
                  ...items,
                  ItemModal(
                      icon: Icon(
                        Icons.close,
                        color: AppTheme.instance.textColor,
                      ),
                      title: AppLocalizations.of(context)!.cancel,
                      isTail: true),
                ],
              ),
            ),
          );
        });
  }
}

class ItemModal extends StatelessWidget {
  final String title;
  final Widget? icon;
  final Function()? onPress;
  final bool isTail;
  const ItemModal({
    Key? key,
    required this.title,
    this.icon,
    this.onPress,
    this.isTail = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.symmetric(horizontal: 16),
      onPressed: () {
        Navigator.of(context).pop();
        if (onPress != null) {
          onPress!();
        }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 50,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (icon != null)
                  Row(
                    children: [
                      icon!,
                      SizedBox(
                        width: 12,
                      ),
                    ],
                  ),
                Text(
                  title,
                  style: TextStyle(
                    color: AppTheme.instance.textColor,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
          if (!isTail)
            Container(
              height: 0.5,
              color: Colors.grey.shade300,
            )
        ],
      ),
    );
  }
}
