import 'package:flutter/material.dart';

import 'package:portfolio_website/responsive_layout.dart';

class NavButton extends StatelessWidget {
  const NavButton({
    super.key,
    required this.scrollTo,
    required this.text,
  });

  final VoidCallback scrollTo;
  final String text;
  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveLayout.isDesktop(context);
    return Padding(
      padding: EdgeInsets.only(right: isDesktop ? 20 : 0),
      child: TextButton(
        style: TextButton.styleFrom(
          foregroundColor: Colors.white,
        ),
        onPressed: scrollTo,
        child: Text(text, style: TextStyle(fontSize: isDesktop ? 18 : 14)),
      ),
    );
  }
}

class ElevatedNavButton extends StatelessWidget {
  const ElevatedNavButton({
    super.key,
    required this.scrollTo,
    required this.text,
  });

  final VoidCallback scrollTo;
  final String text;
  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveLayout.isDesktop(context);

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        padding: const EdgeInsets.all(18),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      onPressed: scrollTo,
      child: Text(text, style: TextStyle(fontSize: isDesktop ? 18 : 14)),
    );
  }
}
