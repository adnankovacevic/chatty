import 'package:auto24/ui/account_setup/account_setup.dart';
import 'package:auto24/widgets/primary_button.dart';
import 'package:auto24/widgets/text_input_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(flex: 1),
            Text(
              'Create Your Account',
              style:
                  GoogleFonts.dmSans(fontSize: 22, fontWeight: FontWeight.w800),
            ),
            const Spacer(flex: 3),
            TextInputField(
                controller: TextEditingController(text: ''),
                focusNode: FocusNode(),
                hint: 'Email'),
            const SizedBox(height: 20),
            TextInputField(
                controller: TextEditingController(text: ''),
                focusNode: FocusNode(),
                hint: 'Password'),
            const SizedBox(height: 20),
            TextInputField(
                controller: TextEditingController(text: ''),
                focusNode: FocusNode(),
                hint: 'Repeat Password'),
            const Spacer(flex: 3),
            PrimaryButton(
              color: Colors.black,
              textColor: Colors.white,
              text: 'Continue',
              padding: 8,
              imageAsset: '',
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (_, __, ___) => const AccountSetupScreen(),
                    transitionDuration: const Duration(milliseconds: 200),
                    transitionsBuilder: (_, a, __, c) =>
                        FadeTransition(opacity: a, child: c),
                  ),
                  (route) => false,
                );
              },
            ),
            const Spacer(flex: 1),
          ],
        ),
      ),
    );
  }
}
