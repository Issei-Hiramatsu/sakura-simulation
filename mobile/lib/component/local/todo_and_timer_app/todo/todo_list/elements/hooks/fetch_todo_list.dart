//ここでデータベースを選定する
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../../../infrastructure/test_data/test_todo_list_repository.dart';
import '../../../../../../../use_case/todo_list_use_case.dart';

final fetchAllTodoList = StreamProvider.family(
  (ref, arg) {
    return TodoListUseCase(todoListRepository: TestTodoListRepository())
        .fetchAllTodoList();
  },
);

final fetchAllCompletedTodoList = StreamProvider.family(
  (ref, arg) {
    return TodoListUseCase(todoListRepository: TestTodoListRepository())
        .fetchAllCompletedTodoList();
  },
);

final fetchAllFavoriteTodoList = StreamProvider.family(
  (ref, arg) {
    return TodoListUseCase(todoListRepository: TestTodoListRepository())
        .fetchAllFavoriteTodoList();
  },
);

final fetchTodoListByDate = StreamProvider.family(
  (ref, DateTime date) {
    return TodoListUseCase(todoListRepository: TestTodoListRepository())
        .fetchTodoListByDate(date: date);
  },
);
