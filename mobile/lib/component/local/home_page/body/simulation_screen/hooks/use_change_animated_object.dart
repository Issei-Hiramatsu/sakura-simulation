import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'container_list.dart';

//アニメーションを行う対象を変更する
class BeginIndexNotifier extends StateNotifier<int> {
  BeginIndexNotifier(int initialState) : super(initialState);
  void changeFadeInAnimatedObject() {
    state++;
    if (state == containerList.length) {
      state = 0;
    }
  }
}

final beginIndexProvider = StateNotifierProvider<BeginIndexNotifier, int>(
    (ref) => BeginIndexNotifier(0));

class EndIndexNotifier extends StateNotifier<int> {
  EndIndexNotifier(int initialState) : super(initialState);
  void changeFadeOutAnimatedObject() {
    state++;
    if (state == containerList.length) {
      state = 0;
    }
  }
}

final endIndexProvider =
    StateNotifierProvider<EndIndexNotifier, int>((ref) => EndIndexNotifier(0));
