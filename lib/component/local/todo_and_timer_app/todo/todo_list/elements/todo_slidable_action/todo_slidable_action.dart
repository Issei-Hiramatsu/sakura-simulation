import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../../../../../../importer.dart';

class TodoSlidableAction extends StatelessWidget {
  const TodoSlidableAction({
    super.key,
    required this.child,
    required this.onDismissed,
  });

  final Widget child;
  final VoidCallback onDismissed;
  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: UniqueKey(),
      closeOnScroll: true,
      endActionPane: ActionPane(
        extentRatio: 0.25,
        dismissible: DismissiblePane(
          onDismissed: () => onDismissed(),
          closeOnCancel: true,
        ),
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (context) => onDismissed(),
            backgroundColor: tertiary,
            foregroundColor: white,
            icon: Icons.delete_outline,
          ),
        ],
      ),
      child: child,
    );
  }
}
