import 'package:auto24/config/app_colors.dart';
import 'package:auto24/notifier/theme_mode_notifier.dart';
import 'package:flutter/material.dart';

class IconWithBackground extends StatelessWidget {
  const IconWithBackground({
    super.key,
    required this.icon,
    required this.onPressed,
    required this.theme,
  });
  final ThemeModeState theme;

  final IconData icon;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Theme.of(context).cardColor,

        //  AppColors.textFaded.withOpacity(0.1),
        borderRadius: BorderRadius.circular(6),
        child: InkWell(
          borderRadius: BorderRadius.circular(6),
          splashColor: Colors.transparent,
          onTap: onPressed,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Icon(
              icon,
              color: theme == ThemeModeState.dark
                  ? LightColors.background
                  : DarkColors.background,
              size: 24,
            ),
          ),
        ));
  }
}
