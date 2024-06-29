import 'package:uni_wien_zuhayr_test/data/models/models.dart';
import 'package:uni_wien_zuhayr_test/logger.dart';
import 'widgets.dart';

class HomeBody extends ConsumerWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chartData = ref.watch(chartDataProvider);
    logger.d(chartData);
    return ScaffoldPage(
        padding: EdgeInsets.zero,
        content: Column(
          children: [
            Row(
              children: [
                SfCircularChart(
                  title: const ChartTitle(text: "Fake Data"),
                  series: _getRadialBarDefaultSeries(chartData),
                )
              ],
            )
          ],
        ));
  }
}

List<RadialBarSeries<ChartSampleData, String>> _getRadialBarDefaultSeries(
    List<ChartSampleData> chartData) {
  return <RadialBarSeries<ChartSampleData, String>>[
    RadialBarSeries<ChartSampleData, String>(
        maximumValue: 15,
        dataLabelSettings: const DataLabelSettings(
            isVisible: true, textStyle: TextStyle(fontSize: 10.0)),
        dataSource: chartData,
        cornerStyle: CornerStyle.bothCurve,
        gap: '10%',
        radius: '90%',
        xValueMapper: (ChartSampleData data, _) => data.x as String,
        yValueMapper: (ChartSampleData data, _) => data.y,
        pointRadiusMapper: (ChartSampleData data, _) => data.text,
        pointColorMapper: (ChartSampleData data, _) => data.pointColor,
        dataLabelMapper: (ChartSampleData data, _) => data.x as String)
  ];
}
