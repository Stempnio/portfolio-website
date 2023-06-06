import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:portfolio_website/responsive_layout.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveLayout.isDesktop(context);
    return Material(
      elevation: 10,
      child: ColoredBox(
        color: Colors.black12,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Flexible(child: _AboutMeText()),
              if (isDesktop) const SizedBox(width: 50),
              const Flexible(child: _ProfilePicture()),
            ],
          ),
        ),
      ),
    );
  }
}

class _AboutMeText extends StatelessWidget {
  const _AboutMeText();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: ColoredBox(
            color: Colors.black38,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                'Flutter Developer',
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall
                    ?.copyWith(color: Colors.deepOrange),
              ),
            ),
          ),
        ),
        const SizedBox(height: 25),
        Text(
          'Jakub Stępień',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(height: 15),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 250),
          child: Text(
            '''Translating imagination into beautifully crafted mobile experiences.''',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
      ],
    );
  }
}

class _ProfilePicture extends StatelessWidget {
  const _ProfilePicture();

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveLayout.isDesktop(context);

    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: isDesktop ? 400 : 300,
        maxWidth: isDesktop ? 400 : 300,
      ),
      child: Stack(
        children: <Widget>[
          Transform.translate(
            offset: const Offset(20, 20),
            child: ImageFiltered(
              imageFilter: ImageFilter.blur(sigmaY: 20, sigmaX: 20),
              child: ColorFiltered(
                colorFilter: const ColorFilter.mode(
                  Colors.orange,
                  BlendMode.srcATop,
                ),
                child: Image.asset('assets/profile.png'),
              ),
            ),
          ),
          ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(20),
              bottomLeft: Radius.circular(20),
            ),
            child: Image.asset('assets/profile.png'),
          ),
        ],
      ),
    );
  }
}
