import 'package:flutter/material.dart';
import 'package:portfolio_website/responsive_layout.dart';

class InfoBar extends StatelessWidget {
  const InfoBar({
    Key? key,
    required this.body,
  }) : super(key: key);

  final Widget body;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = ResponsiveLayout.isDesktop(context);

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blueAccent, Colors.blueGrey],
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: isDesktop ? 20 : 10,
          horizontal: isDesktop ? screenWidth * 0.12 : 10,
        ),
        child: body,
      ),
      // child: ,
    );
  }
}
