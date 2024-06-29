import 'backend.dart';

// Generate random color
Color getRandomColor() {
  Random random = Random();
  return Color.fromRGBO(
    random.nextInt(256),
    random.nextInt(256),
    random.nextInt(256),
    1.0,
  );
}

// Generate random data
List<ChartSampleData> generateRandomChartData(int count) {
  Random random = Random();
  List<ChartSampleData> data = [];
  for (int i = 0; i < count; i++) {
    data.add(
      ChartSampleData(
        x: 'Person $i',
        y: random.nextInt(100).toDouble(),
        text: '${random.nextInt(100)}%',
        pointColor: getRandomColor(),
      ),
    );
  }
  return data;
}

Future<List<ChartSampleData>> fetchChartData() async {
  await Future.delayed(const Duration(seconds: 2)); // Simulate network delay
  return <ChartSampleData>[
    ...generateRandomChartData(20),
  ];
}
