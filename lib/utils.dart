import 'package:flutter/cupertino.dart';

extension StringX on String {
  String toTitleCase() => split(' ')
      .map(
        (word) => word.isNotEmpty
            ? '${word[0].toUpperCase()}${word.substring(1)}'
            : '',
      )
      .join(' ');
}

class VerticalSpace extends StatelessWidget {
  const VerticalSpace({super.key, required this.value});

  final double value;

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: value);
  }
}

class HorizontalSpace extends StatelessWidget {
  const HorizontalSpace({super.key, required this.value});

  final double value;

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: value);
  }
}
