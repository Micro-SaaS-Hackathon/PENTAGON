import 'package:flutter/material.dart';

class AppTitles extends StatelessWidget {
  const AppTitles({
    super.key,
    required this.title,
    this.fSize,
    this.fWeight,
    this.color,
    this.height,
    this.overflow,
    this.maxLines,
  });

  final String title;
  final double? fSize;
  final FontWeight? fWeight;
  final Color? color;
  final double? height;
  final TextOverflow? overflow;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Text(
      maxLines: maxLines,
      title,
      style: TextStyle(
        fontSize: fSize,
        fontWeight: fWeight,
        color: color,
        height: height,
        overflow: overflow,
      ),
    );
  }
}
