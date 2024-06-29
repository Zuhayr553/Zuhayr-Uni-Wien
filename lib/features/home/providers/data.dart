import 'package:uni_wien_zuhayr_test/data/backend/backend.dart';
import 'package:uni_wien_zuhayr_test/shared/providers/shared_providers.dart';

final chartDataProvider = FutureProvider.autoDispose<List<ChartSampleData>>(
  (ref) async {
    ref.keepAlive();
    return await FakeData().fetchChartData();
  },
);
