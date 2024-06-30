import 'package:uni_wien_zuhayr_test/data/backend/backend.dart';
import 'providers.dart';

class TaskNotifier extends StateNotifier<List<Task>> {
  TaskNotifier() : super([]);

  void setInitialTasks(List<Task> tasks) {
    state = tasks;
  }

  void addTask(Task task) {
    state = [...state, task];
  }

  void removeTask(Task task) {
    state = state.where((t) => t != task).toList();
  }
}

final taskNotifierProvider =
    StateNotifierProvider<TaskNotifier, List<Task>>((ref) {
  return TaskNotifier();
});

final taskProvider = FutureProvider<List<Task>>((ref) async {
  final fakeData = FakeData();
  final tasks = await fakeData.fetchTasks();
  ref.read(taskNotifierProvider.notifier).setInitialTasks(tasks);
  return tasks;
});
