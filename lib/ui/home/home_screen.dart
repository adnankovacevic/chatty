import 'package:auto24/config/app_colors.dart';
import 'package:auto24/config/helpers.dart';
import 'package:auto24/notifier/selected_index_notifier.dart';
import 'package:auto24/notifier/theme_mode_notifier.dart';
import 'package:auto24/notifier/user_notifier.dart';
import 'package:auto24/ui/pages/mentions_page.dart';
import 'package:auto24/ui/pages/messages/messages_page.dart';
import 'package:auto24/widgets/avatar.dart';
import 'package:auto24/widgets/bottom_navigation.dart';
import 'package:auto24/widgets/home_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  final pages = const [
    MessagesPage(),
    MentionsPage(),
  ];
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageIndex = ref.watch(selectedIndexProvider);
    final pageTitle = pageTitles[pageIndex];
    final theme = ref.watch(themeNotifierProvider);
    final user = ref.watch(signInWithGoogleProvider);

    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      drawerEnableOpenDragGesture: false,
      key: scaffoldKey,
      drawer: HomeDrawer(
        user: user.value,
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 24.0),
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => scaffoldKey.currentState!.openDrawer(),
              child: Avatar.small(
                url: Helpers.radnomImageUrl(),
              ),
            ),
          ),
        ),
        title: Text(
          pageTitle,
          style: GoogleFonts.lato(
              fontSize: 16, fontWeight: FontWeight.w600, letterSpacing: 0.5),
        ),
        actions: [
          IconButton(
            color: theme == ThemeModeState.dark
                ? LightColors.background
                : DarkColors.background,
            icon: Icon(AppColors.getIconData(theme == ThemeModeState.dark)),
            onPressed: () {
              ref.read(themeNotifierProvider.notifier).toggleTheme();
            },
          ),
        ],
      ),
      body: pages[pageIndex],
      bottomNavigationBar: BottomNavigation(
        onItemChanged: (index) =>
            ref.read(selectedIndexProvider.notifier).onIndexChanged(index),
        selectedIndex: ref.watch(selectedIndexProvider),
      ),
    );
  }
}
