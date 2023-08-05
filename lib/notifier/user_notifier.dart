import 'package:auto24/models/user.dart';
import 'package:auto24/services/auth_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authServiceProvider = Provider<AuthService>((ref) => AuthService());

final signInWithGoogleProvider = FutureProvider<ChatUser?>((ref) async {
  final authService = ref.watch(authServiceProvider);
  return authService.signInWithGoogle();
});

final logoutProvider = FutureProvider<bool?>((ref) async {
  final authService = ref.watch(authServiceProvider);
  return authService.signOut();
});
