import 'package:uni_wien_zuhayr_test/data/models/models.dart';
import 'package:uni_wien_zuhayr_test/shared/widgets/text_widgets.dart';
import 'widgets.dart';

class HomeBody extends ConsumerWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chartDataAsync = ref.watch(chartDataProvider);
    final darkMode = ref.watch(prefsProvider.select((p) => p.isDarkMode));
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                SizedBox(
                  height: 400.h,
                  width: 250.w,
                  child: chartDataAsync.when(
                    loading: () => _buildLoading(),
                    error: (error, stackTrace) => _buildError(
                      error.toString(),
                    ),
                    data: (chartData) => _buildContent(
                      chartData,
                      context,
                      darkMode,
                    ),
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                headerBoldText(
                  context,
                  context.loc.overviewTextHomePage,
                ),
                SizedBox(
                  height: 2.h,
                ),
                bodyText(
                  context,
                  context.loc.fakeDataOverviewHomeBody,
                  customWidth: 200.w,
                ),
              ],
            ),
            Column(
              children: [
                SizedBox(
                  height: 400.h,
                  width: 250.w,
                  child: chartDataAsync.when(
                    loading: () => _buildLoading(),
                    error: (error, stackTrace) => _buildError(
                      error.toString(),
                    ),
                    data: (chartData) => _buildContentForChartTwo(
                      chartData,
                      context,
                      darkMode,
                    ),
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                headerBoldText(
                  context,
                  context.loc.overviewTextHomePage,
                ),
                SizedBox(
                  height: 2.h,
                ),
                bodyText(
                  context,
                  context.loc.fakeDataOverviewHomeBody,
                  customWidth: 200.w,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

Widget _buildLoading() {
  return const ScaffoldPage(
    padding: EdgeInsets.zero,
    content: Center(child: CircularProgressIndicator()),
  );
}

Widget _buildError(String error) {
  return ScaffoldPage(
    padding: EdgeInsets.zero,
    content: Center(
      child: Text('Error: $error'),
    ),
  );
}

Widget _buildContent(
  List<ChartSampleData> chartData,
  BuildContext context,
  bool darkMode,
) {
  return ScaffoldPage(
    padding: const EdgeInsets.all(24),
    content: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SfCircularChart(
              title: chartTitle(context),
              tooltipBehavior: tooltipBehavior(),
              series: _getRadialBarDefaultSeries(
                chartData,
                context,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget _buildContentForChartTwo(
  List<ChartSampleData> chartData,
  BuildContext context,
  bool darkMode,
) {
  return ScaffoldPage(
    padding: const EdgeInsets.all(24),
    content: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SfCartesianChart(
              plotAreaBorderWidth: 2,
              plotAreaBackgroundColor: darkMode
                  ? AppColors.darkGray
                  : AppColors.lightGray.withOpacity(0.1),
              isTransposed: true,
              primaryXAxis: CategoryAxis(
                labelStyle: FluentTheme.of(context)
                    .typography
                    .bodyStrong
                    ?.copyWith(fontSize: 12),
              ),
              tooltipBehavior: tooltipBehavior(),
              primaryYAxis: NumericAxis(
                labelStyle: FluentTheme.of(context)
                    .typography
                    .bodyStrong
                    ?.copyWith(fontSize: 12),
              ),
              title: chartTitle(context),
              series: <CartesianSeries>[
                SplineSeries<ChartSampleData, String>(
                  dataSource: chartData,
                  cardinalSplineTension: 1,
                  dataLabelSettings: DataLabelSettings(
                    textStyle: FluentTheme.of(context)
                        .typography
                        .bodyStrong
                        ?.copyWith(fontSize: 12),
                  ),
                  xValueMapper: (ChartSampleData data, _) => data.x,
                  yValueMapper: (ChartSampleData data, _) => data.y,
                  color: darkMode ? AppColors.ghostWhite : AppColors.darkGray,
                )
              ],
            )
          ],
        ),
      ],
    ),
  );
}

List<RadialBarSeries<ChartSampleData, String>> _getRadialBarDefaultSeries(
  List<ChartSampleData> chartData,
  BuildContext context,
) {
  return <RadialBarSeries<ChartSampleData, String>>[
    RadialBarSeries<ChartSampleData, String>(
      maximumValue: 75,
      useSeriesColor: true,
      dataSource: chartData,
      enableTooltip: true,
      cornerStyle: CornerStyle.bothCurve,
      trackOpacity: 0.4,
      trackBorderWidth: 16,
      strokeWidth: 6,
      gap: '6%',
      radius: '120%',
      xValueMapper: (ChartSampleData data, _) => data.x as String,
      yValueMapper: (ChartSampleData data, _) => data.y,
      pointRadiusMapper: (ChartSampleData data, _) => data.text,
      pointColorMapper: (ChartSampleData data, _) => data.pointColor,
      dataLabelMapper: (ChartSampleData data, _) => data.x as String,
    ),
  ];
}

ChartTitle chartTitle(BuildContext context) {
  return ChartTitle(
    text: context.loc.ourDataTextHomePage,
    borderWidth: 8,
    textStyle:
        FluentTheme.of(context).typography.bodyStrong?.copyWith(fontSize: 20),
  );
}

TooltipBehavior tooltipBehavior() {
  return TooltipBehavior(
    enable: true,
    animationDuration: 200,
    header: '',
    format: 'point.x : point.y',
  );
}
