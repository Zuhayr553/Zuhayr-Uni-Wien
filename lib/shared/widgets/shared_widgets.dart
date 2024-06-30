import '../../features/home/home.dart';

Widget buildLoading(BuildContext context) {
  return ScaffoldPage(
    padding: EdgeInsets.zero,
    content: Center(child: context.circularProgressIndicator()),
  );
}

Widget buildError(String error, String errorStringText) {
  return ScaffoldPage(
    padding: EdgeInsets.zero,
    content: Center(
      child: Text('$errorStringText: $error'),
    ),
  );
}
