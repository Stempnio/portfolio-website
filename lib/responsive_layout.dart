import 'package:flutter/cupertino.dart';

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({
    Key? key,
    required this.desktop,
    required this.mobile,
  }) : super(key: key);

  final Widget desktop;
  final Widget mobile;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width > 600;

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width <= 600;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return constraints.maxWidth > 600 ? desktop : mobile;
    });
  }
}
