import '../../../data/data.dart';
import 'providers.dart';

final chartDataProvider = FutureProvider.autoDispose<List<ChartSampleData>>(
  (ref) async {
    ref.keepAlive();
    return await FakeData().fetchChartData();
  },
);
