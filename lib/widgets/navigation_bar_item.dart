import 'package:auto24/config/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NavigationBarItem extends StatelessWidget {
  const NavigationBarItem({
    super.key,
    this.onPressed,
    required this.icon,
    required this.lable,
    required this.isSelected,
  });
  final Function()? onPressed;
  final IconData icon;
  final String lable;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: isSelected ? 24 : 22,
              color: isSelected ? AppColors.primaryColor : null,
            ),
            Text(
              lable,
              style: isSelected
                  ? GoogleFonts.dmSans(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: AppColors.primaryColor,
                    )
                  : GoogleFonts.dmSans(fontSize: 10),
            ),
          ],
        ),
      ),
    );
  }
}
