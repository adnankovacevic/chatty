import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextInputField extends StatelessWidget {
  const TextInputField({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.hint,
  });
  final TextEditingController controller;
  final FocusNode focusNode;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: Colors.grey.shade200,
      ),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
          hintText: hint,
          hintStyle:
              GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.w400),
          border: InputBorder.none,
        ),
        focusNode: focusNode,
      ),
    );
  }
}
