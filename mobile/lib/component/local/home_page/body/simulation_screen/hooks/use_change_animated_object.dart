import 'package:flutter_hooks/flutter_hooks.dart';

import 'container_list.dart';

//アニメーションが行われる対象を変更する
final beginIndex = useState(0);
final endIndex = useState(1);

void changeFadeInAnimatedObject() {
  beginIndex.value++;
  if (beginIndex.value > containerList.length) {
    beginIndex.value = 0;
  }
  return;
}

void changeFadeOutAnimatedObject() {
  endIndex.value++;
  if (endIndex.value > containerList.length) {
    endIndex.value = 0;
  }
  return;
}
