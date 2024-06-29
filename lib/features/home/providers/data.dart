import 'package:uni_wien_zuhayr_test/data/backend/backend.dart';
import 'package:uni_wien_zuhayr_test/shared/providers/shared_providers.dart';

class ChartDataNotifier extends StateNotifier<List<ChartSampleData>> {
  ChartDataNotifier() : super([]);

  Future<void> loadData() async {
    state = await fetchChartData();
  }
}

final chartDataProvider =
    StateNotifierProvider<ChartDataNotifier, List<ChartSampleData>>(
  (ref) => ChartDataNotifier(),
);
