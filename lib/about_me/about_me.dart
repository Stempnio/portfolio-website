import 'package:flutter/material.dart';
import 'package:portfolio_website/responsive_layout.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: ResponsiveLayout.isDesktop(context) ? 30 : 5,
          horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hello there!",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                SizedBox(
                  height: ResponsiveLayout.isDesktop(context) ? 40 : 20,
                ),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 250),
                  child: const Text(
                    '''My name is Kuba and i'm passionate about mobile development, especially Flutter.''',
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.black54,
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (ResponsiveLayout.isDesktop(context)) const SizedBox(width: 60),
          Flexible(
            child: ClipOval(
              child: Container(
                constraints: const BoxConstraints(
                  maxHeight: 300,
                  maxWidth: 300,
                ),
                color: Colors.blueAccent,
                child: Image.asset("assets/profile.png"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
