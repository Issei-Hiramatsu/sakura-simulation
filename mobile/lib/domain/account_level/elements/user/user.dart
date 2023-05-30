import 'package:freezed_annotation/freezed_annotation.dart';

import 'elements/timer_settings/timer_settings.dart';
import 'elements/todo/todo.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const factory User({
    @Default(0) int id,
    @Default('') String email,
    @Default('') String userName,
    @Default('') String userImagePath,
    TimerSettings? timerSettings,
    @Default({'': []}) Map<String, List<Todo>> todoList,
    DateTime? firstTimeUsing, //カレンダー日程を決めるため
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}