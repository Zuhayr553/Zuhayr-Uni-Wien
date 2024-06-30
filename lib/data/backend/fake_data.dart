import 'backend.dart';

class FakeData {
  Color _getRandomColor() {
    Random random = Random();
    return Color.fromRGBO(
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
      1.0,
    );
  }

  List<ChartSampleData> _generateRandomChartData(int count) {
    Random random = Random();
    List<ChartSampleData> data = [];
    for (int i = 0; i < count; i++) {
      data.add(
        ChartSampleData(
          x: 'Person $i',
          y: random.nextInt(100).toDouble(),
          text: '${random.nextInt(100)}%',
          pointColor: _getRandomColor(),
        ),
      );
    }
    return data;
  }

  Future<List<ChartSampleData>> fetchChartData() async {
    await Future.delayed(const Duration(seconds: 2)); // Simulate network delay
    return <ChartSampleData>[
      ..._generateRandomChartData(8),
    ];
  }

  List<Task> _generateRandomTasks(int count) {
    List<Task> tasks = [];
    for (int i = 0; i < count; i++) {
      tasks.add(
        Task(
          title: 'Task ${i + 1}',
          subtext:
              'This is the description for task ${i + 1}. It includes some random details to make the text a bit longer.',
        ),
      );
    }
    return tasks;
  }

  Future<List<Task>> fetchTasks() async {
    await Future.delayed(const Duration(seconds: 1)); // Simulate network delay
    return _generateRandomTasks(20);
  }
}
