import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton(
      {super.key,
      this.onPressed,
      required this.color,
      required this.text,
      required this.padding,
      required this.textColor,
      required this.imageAsset});
  final Color color;
  final Color textColor;
  final Function()? onPressed;
  final String text;
  final double padding;
  final String imageAsset;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      padding: EdgeInsets.all(padding),
      color: color,
      elevation: 4,
      minWidth: double.infinity,
      height: 53,
      onPressed: onPressed,
      textColor: textColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          imageAsset != ''
              ? SvgPicture.asset(
                  imageAsset,
                  height: 20,
                  width: 20,
                )
              : Container(),
          const SizedBox(width: 20),
          Center(
            child: Text(
              text,
              style: GoogleFonts.montserrat(
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
