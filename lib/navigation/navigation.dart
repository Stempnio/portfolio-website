import 'package:flutter/material.dart';

class NavButton extends StatelessWidget {
  const NavButton({
    Key? key,
    required this.scrollTo,
    required this.text,
  }) : super(key: key);

  final VoidCallback scrollTo;
  final String text;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: scrollTo,
      child: Text(text),
    );
  }
}

class OutlineNavButton extends StatelessWidget {
  const OutlineNavButton({
    Key? key,
    required this.scrollTo,
    required this.text,
  }) : super(key: key);

  final VoidCallback scrollTo;
  final String text;
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {},
      child: Text(text),
    );
  }
}
