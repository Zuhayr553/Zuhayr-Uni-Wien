import 'package:fluent_ui/fluent_ui.dart';

Text headerBoldText(
  BuildContext context,
  String text, {
  Color? color,
  double? customFontSize,
}) {
  return Text(
    text,
    style: FluentTheme.of(context).typography.bodyStrong?.copyWith(
          fontSize: customFontSize ?? 16,
          color: color,
        ),
  );
}

SizedBox bodyText(
  BuildContext context,
  String text, {
  double? customWidth,
  double? customFontSize,
  Color? color,
  TextAlign? textAlign,
}) {
  return SizedBox(
    width: customWidth,
    child: Text(
      text,
      textAlign: textAlign ?? TextAlign.justify,
      overflow: TextOverflow.fade,
      style: FluentTheme.of(context).typography.body?.copyWith(
            fontSize: customFontSize ?? 12,
            color: color,
          ),
    ),
  );
}
