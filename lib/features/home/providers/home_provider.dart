import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelectedIndexNotifier extends StateNotifier<int> {
  SelectedIndexNotifier() : super(0);

  void setSelectedIndex(int index) {
    state = index;
  }
}

final selectedIndexProvider = StateNotifierProvider<SelectedIndexNotifier, int>(
  (ref) => SelectedIndexNotifier(),
);
