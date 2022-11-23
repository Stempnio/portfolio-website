import 'package:flutter/cupertino.dart';

class VerticalSpace extends StatelessWidget {
  const VerticalSpace({Key? key, required this.value}) : super(key: key);

  final double value;

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: value);
  }
}

class HorizontalSpace extends StatelessWidget {
  const HorizontalSpace({Key? key, required this.value}) : super(key: key);

  final double value;

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: value);
  }
}
