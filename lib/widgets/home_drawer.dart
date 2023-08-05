import 'package:auto24/models/user.dart';
import 'package:auto24/notifier/user_notifier.dart';
import 'package:auto24/ui/auth/auth_screen.dart';
import 'package:auto24/widgets/avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeDrawer extends ConsumerWidget {
  const HomeDrawer({
    super.key,
    required this.user,
  });
  final ChatUser? user;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final logout = ref.watch(authServiceProvider);

    return Drawer(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Avatar.large(url: user?.profilePicture ?? ''),
                const SizedBox(width: 20),
                Text(user?.name ?? ''),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: Text(
              'Logout',
              style: GoogleFonts.lato(),
            ),
            onTap: () async {
              var isSuccessful = await logout.signOut();
              if (isSuccessful != null) {
                Navigator.pushAndRemoveUntil(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (_, __, ___) => const AuthScreen(),
                    transitionDuration: const Duration(milliseconds: 200),
                    transitionsBuilder: (_, a, __, c) =>
                        FadeTransition(opacity: a, child: c),
                  ),
                  (route) => false,
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
