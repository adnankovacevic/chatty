import 'package:flutter_riverpod/flutter_riverpod.dart';

const List<String> pageTitles = [
  'Messages',
  'Notifications',
  'Calls',
  'Contacts'
];

final selectedIndexProvider =
    StateNotifierProvider<SelectedIndexNotifier, int>((ref) {
  return SelectedIndexNotifier();
});

final selectedTitleProvider = Provider<String>((ref) {
  final selectedIndex = ref.watch(selectedIndexProvider);
  return pageTitles[selectedIndex];
});

class SelectedIndexNotifier extends StateNotifier<int> {
  SelectedIndexNotifier() : super(0);

  void onIndexChanged(int index) {
    print('onIndexChanged: $index');

    state = index;
  }
}
