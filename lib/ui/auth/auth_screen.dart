import 'package:auto24/config/app_colors.dart';
import 'package:auto24/services/auth_service.dart';
import 'package:auto24/ui/home/home_screen.dart';
import 'package:auto24/widgets/primary_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(flex: 14),
            PrimaryButton(
              color: AppColors.primaryColor,
              textColor: Colors.white,
              text: 'Sign In',
              padding: 8,
              imageAsset: '',
              onPressed: () {
                // Navigator.pushAndRemoveUntil(
                //   context,
                //   PageRouteBuilder(
                //     pageBuilder: (_, __, ___) => const AccountSetupScreen(),
                //     transitionDuration: const Duration(milliseconds: 200),
                //     transitionsBuilder: (_, a, __, c) =>
                //         FadeTransition(opacity: a, child: c),
                //   ),
                //   (route) => false,
                // );
              },
            ),
            const SizedBox(height: 20),
            PrimaryButton(
              color: AppColors.primaryColor,
              textColor: Colors.white,
              text: 'Sign In With Google',
              padding: 8,
              imageAsset: 'assets/google_icon.svg',
              onPressed: () async {
                AuthService authService = AuthService();
                UserCredential? userCredential =
                    await authService.signInWithGoogle();

                if (userCredential != null) {
                  // Sign-in successful, navigate to the next screen
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                } else {
                  // Sign-in failed, do nothing as the SnackBar already showed the error
                  print('Error signing in');
                }
              },
            ),
            const Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}
