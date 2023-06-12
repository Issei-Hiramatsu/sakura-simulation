//ここでデータベースを選定する
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../../../infrastructure/test_data/test_todo_list_repository.dart';
import '../../../../../../../use_case/todo_list_use_case.dart';

final fetchTodoListByDate = StreamProvider.family(
  (ref, DateTime date) {
    return TodoListUseCase(todoListRepository: TestTodoListRepository())
        .fetchTodoListByDate(date: date);
  },
);
