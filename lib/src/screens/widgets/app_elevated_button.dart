import 'package:flutter/material.dart';

class AppElevatedButton extends StatelessWidget {
  const AppElevatedButton({
    required this.press,
    required this.text,
    this.width = double.infinity,
    this.height = 56,
    this.padding = EdgeInsets.zero,
    super.key,
  });

  final double? width;
  final double? height;
  final VoidCallback press;
  final EdgeInsetsGeometry? padding;
  final String text;

  @override
  Widget build(BuildContext context) => SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: press,
        child: Padding(
          padding: padding!,
          child: FittedBox(child: Text(text)),
        ),
      ),
    );
}
