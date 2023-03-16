import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  const AppText({required this.text,super.key, this.style, this.maxLine = 1});

  final TextStyle? style;
  final String text;
  final int? maxLine;

  @override
  Widget build(BuildContext context) => Text(
      text,
      style: style,
      maxLines: maxLine,
      overflow: TextOverflow.ellipsis,
    );
}
