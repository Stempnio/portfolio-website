import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:portfolio_website/responsive_layout.dart';
import 'package:portfolio_website/utils.dart';

class GlassMorphicAppBar extends StatelessWidget {
  const GlassMorphicAppBar({
    Key? key,
    required this.openDrawer,
  }) : super(key: key);

  final VoidCallback openDrawer;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey.withOpacity(0.2),
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 56,
              child: Row(
                children: [
                  Text(
                    "Jakub Stępień",
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  ResponsiveLayout.isDesktop(context)
                      ? navButtons(context)
                      : IconButton(
                          onPressed: openDrawer,
                          icon: Icon(Icons.menu_sharp),
                        ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget navButtons(BuildContext context) => Row(
        children: [
          TextButton(
            onPressed: () {},
            child: const Text("About me"),
          ),
          _horizontalSpace(context),
          TextButton(
            onPressed: () {},
            child: const Text("Tech stack"),
          ),
          _horizontalSpace(context),
          TextButton(
            onPressed: () {},
            child: const Text("Projects"),
          ),
          _horizontalSpace(context),
          OutlinedButton(
            onPressed: () {},
            child: const Text("Contact"),
          ),
        ],
      );

  Widget _horizontalSpace(BuildContext context) =>
      SizedBox(width: ResponsiveLayout.isMobile(context) ? 0 : 10);
}
