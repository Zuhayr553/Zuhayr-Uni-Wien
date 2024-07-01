import 'widgets.dart';

class TasksBody extends ConsumerWidget {
  const TasksBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final darkMode = ref.watch(prefsProvider.select((p) => p.isDarkMode));
    final taskState = ref.watch(taskProvider);
    final tasks = ref.watch(taskNotifierProvider);

    return ScaffoldPage(
      content: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            _buildHeader(context, darkMode),
            const SizedBox(height: 20),
            Expanded(
              child: _buildTaskContent(
                context,
                ref,
                taskState,
                tasks,
                darkMode,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, bool darkMode) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Spacer(),
        headerBoldText(
          context,
          context.loc.taskManagerTextHomePage,
          customFontSize: 20,
        ),
        const Spacer(),
        SizedBox(
          width: 150,
          height: 35,
          child: Button(
            style: ButtonStyle(
              backgroundColor:
                  darkMode ? null : ButtonState.all(AppColors.platinum),
            ),
            child: bodyText(
              context,
              context.loc.addTaskTitleTasksPage,
              color: AppColors.richBlack,
            ),
            onPressed: () => _showAddTaskDialog(context, darkMode),
          ),
        ),
      ],
    );
  }

  Widget _buildTaskContent(
    BuildContext context,
    WidgetRef ref,
    AsyncValue taskState,
    List<Task> tasks,
    bool darkMode,
  ) {
    return taskState.when(
      data: (_) => _buildTaskGrid(
        context,
        ref,
        tasks,
        darkMode,
      ),
      loading: () => buildLoading(context),
      error: (error, stack) => buildError(
        error.toString(),
        context.loc.errorTextHomePage,
      ),
    );
  }

  Widget _buildTaskGrid(
    BuildContext context,
    WidgetRef ref,
    List<Task> tasks,
    bool darkMode,
  ) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 300,
        childAspectRatio: 1.5 / 1,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        final task = tasks[index];
        return _buildTaskCard(
          context,
          ref,
          task,
          darkMode,
        );
      },
    );
  }

  Widget _buildTaskCard(
    BuildContext context,
    WidgetRef ref,
    Task task,
    bool darkMode,
  ) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: darkMode ? AppColors.darkGray : AppColors.ghostWhite,
        boxShadow: darkMode
            ? null
            : const [
                BoxShadow(
                  color: AppColors.lightGray,
                  spreadRadius: 2,
                  blurRadius: 6,
                  offset: Offset(0, 4),
                )
              ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              headerBoldText(context, task.title, color: AppColors.richBlack),
              GestureDetector(
                onTap: () =>
                    _showDeleteConfirmationDialog(context, ref, task, darkMode),
                child: const Icon(FluentIcons.delete, size: 15),
              ),
            ],
          ),
          const SizedBox(height: 2),
          bodyText(
            context,
            task.subtext,
            color: AppColors.richBlack,
          ),
        ],
      ),
    );
  }

  void _showAddTaskDialog(
    BuildContext context,
    bool darkMode,
  ) {
    showDialog(
      context: context,
      builder: (context) => AddTaskDialog(isDarkMode: darkMode),
    );
  }

  void _showDeleteConfirmationDialog(
    BuildContext context,
    WidgetRef ref,
    Task task,
    bool darkMode,
  ) {
    showDialog(
      context: context,
      builder: (context) => ContentDialog(
        title: headerBoldText(
          context,
          context.loc.deleteTaskTitleTasksPage,
          color: darkMode ? AppColors.platinum : AppColors.richBlack,
        ),
        content: bodyText(
          context,
          context.loc.deleteTaskContentTasksPage,
          color: darkMode ? AppColors.platinum : AppColors.richBlack,
        ),
        actions: [
          SizedBox(
            height: 30,
            child: Button(
              child: bodyText(
                context,
                context.loc.noButtonTextTasksPage,
                color: darkMode ? AppColors.richBlack : AppColors.platinum,
              ),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          SizedBox(
            height: 30,
            child: Button(
              child: bodyText(
                context,
                context.loc.yesButtonTextTasksPage,
                color: darkMode ? AppColors.richBlack : AppColors.platinum,
              ),
              onPressed: () {
                ref.read(taskNotifierProvider.notifier).removeTask(task);
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
