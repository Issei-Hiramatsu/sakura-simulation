import 'package:hooks_riverpod/hooks_riverpod.dart';

import '/infrastructure/todo_list_repository.dart';
import '/use_case/todo_list_use_case.dart';

final fetchAllTodoList = StreamProvider(
  (ref) {
    return TodoListUseCase(todoListRepository: TodoListRepository())
        .fetchAllTodoList();
  },
);
