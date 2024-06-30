import '../../../data/data.dart';
import 'widgets.dart';

class HomeBody extends ConsumerWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chartDataAsync = ref.watch(chartDataProvider);
    final darkMode = ref.watch(prefsProvider.select((p) => p.isDarkMode));

    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              buildChartSection(
                chartDataAsync,
                context,
                darkMode,
                _buildContent,
                context.loc.overviewTextHomePage,
                context.loc.fakeDataOverviewHomeBody,
              ),
              buildChartSection(
                chartDataAsync,
                context,
                darkMode,
                _buildContentForChartTwo,
                context.loc.overviewTextHomePage,
                context.loc.fakeDataOverviewHomeBody,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

Widget buildChartSection(
  AsyncValue<List<ChartSampleData>> chartDataAsync,
  BuildContext context,
  bool darkMode,
  Widget Function(List<ChartSampleData>, BuildContext, bool) buildContent,
  String headerText,
  String text,
) {
  return Column(
    children: [
      SizedBox(
        height: 380,
        child: chartDataAsync.when(
          loading: () => buildLoading(context),
          error: (error, stackTrace) => buildError(
            error.toString(),
            context.loc.errorTextHomePage,
          ),
          data: (chartData) => buildContent(
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
        headerText,
      ),
      SizedBox(
        height: 2.h,
      ),
      bodyText(
        context,
        text,
        customWidth: 200.w,
      ),
      const SizedBox(
        height: 24,
      ),
    ],
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
