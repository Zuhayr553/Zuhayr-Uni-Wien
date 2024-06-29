import 'package:fluent_ui/fluent_ui.dart';

Text headerBoldText(BuildContext context, String text) {
  return Text(
    text,
    style:
        FluentTheme.of(context).typography.bodyStrong?.copyWith(fontSize: 16),
  );
}

SizedBox bodyText(
  BuildContext context,
  String text, {
  double? customWidth,
  double? customFontSize,
}) {
  return SizedBox(
    width: customWidth,
    child: Text(
      text,
      textAlign: TextAlign.justify,
      style: FluentTheme.of(context)
          .typography
          .body
          ?.copyWith(fontSize: customFontSize ?? 12),
    ),
  );
}
