import 'package:auto24/config/app_colors.dart';
import 'package:auto24/notifier/theme_mode_notifier.dart';
import 'package:auto24/ui/auth/auth_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeNotifierProvider);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Messenger',
      theme:
          theme == ThemeModeState.dark ? AppThemes.dark() : AppThemes.light(),
      home: const AuthScreen(),
    );
  }
}
