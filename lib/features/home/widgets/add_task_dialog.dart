import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uni_wien_zuhayr_test/data/backend/backend.dart';
import 'widgets.dart';

class AddTaskDialog extends HookConsumerWidget {
  const AddTaskDialog({
    super.key,
    required this.isDarkMode,
  });
  final bool isDarkMode;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final titleController = useTextEditingController();
    final subtitleController = useTextEditingController();
    final formKey = GlobalKey<FormState>();

    return Material(
      color: const Color.fromRGBO(0, 0, 0, 0),
      child: ContentDialog(
        title: headerBoldText(
          context,
          context.loc.addTaskTitleTasksPage,
          color: isDarkMode ? AppColors.platinum : AppColors.richBlack,
        ),
        content: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: titleController,
                decoration: InputDecoration(
                  labelText: context.loc.titleFieldLabelTasksPage,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return context.loc.titleFieldErrorTasksPage;
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: subtitleController,
                decoration: InputDecoration(
                  labelText: context.loc.subtitleFieldLabelTasksPage,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return context.loc.subtitleFieldErrorTasksPage;
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
        actions: [
          SizedBox(
            height: 30,
            child: Button(
              child: bodyText(
                context,
                context.loc.cancelButtonTextTasksPage,
                color: isDarkMode ? AppColors.richBlack : AppColors.platinum,
              ),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          SizedBox(
            height: 30,
            child: Button(
              child: bodyText(
                context,
                context.loc.addButtonTextTasksPage,
                color: isDarkMode ? AppColors.richBlack : AppColors.platinum,
              ),
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  final newTask = Task(
                    title: titleController.text,
                    subtext: subtitleController.text,
                  );
                  ref.read(taskNotifierProvider.notifier).addTask(newTask);
                  Navigator.pop(context);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
