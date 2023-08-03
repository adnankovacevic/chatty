import 'package:auto24/ui/account_setup/widgets/upload_image_section.dart';
import 'package:auto24/ui/home/home_screen.dart';
import 'package:auto24/widgets/primary_button.dart';
import 'package:auto24/widgets/text_input_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AccountSetupScreen extends StatelessWidget {
  const AccountSetupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          'Create Account',
          style: GoogleFonts.dmSans(
              fontSize: 16, fontWeight: FontWeight.w800, color: Colors.black),
        ),
      ),
      body: ListView(
        physics: AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        children: [
          const SizedBox(height: 50),
          //Upload image section widget
          const Center(
            child: UploadImageSection(),
          ),
          const SizedBox(height: 20),
          // Input fields (name, dob, email, pass, gender)
          TextInputField(
              controller: TextEditingController(text: ''),
              focusNode: FocusNode(),
              hint: 'First Name'),
          const SizedBox(height: 20),
          TextInputField(
              controller: TextEditingController(text: ''),
              focusNode: FocusNode(),
              hint: 'Last Name'),
          const SizedBox(height: 20),
          // Input fields (name, dob, email, pass, gender)
          TextInputField(
              controller: TextEditingController(text: ''),
              focusNode: FocusNode(),
              hint: 'Date Of Birth'),
          const SizedBox(height: 20),
          TextInputField(
              controller: TextEditingController(text: ''),
              focusNode: FocusNode(),
              hint: 'Phone Number'),
          const SizedBox(height: 20),
          TextInputField(
              controller: TextEditingController(text: ''),
              focusNode: FocusNode(),
              hint: 'Gender'),
          const SizedBox(height: 20),
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
                  pageBuilder: (_, __, ___) => HomeScreen(),
                  transitionDuration: const Duration(milliseconds: 200),
                  transitionsBuilder: (_, a, __, c) =>
                      FadeTransition(opacity: a, child: c),
                ),
                (route) => false,
              );
            },
          ),
        ],
      ),
    );
  }
}
