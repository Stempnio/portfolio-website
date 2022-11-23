import 'package:flutter/material.dart';
import 'package:portfolio_website/responsive_layout.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hello there!",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              SizedBox(
                height: ResponsiveLayout.isDesktop(context) ? 50 : 20,
              ),
              const SizedBox(
                width: 200,
                child: Text(
                  "My name is Kuba and im blahblah blahblah blahblah blahblah blahblah blahblah blahblah blahblah blahblah blahblah",
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.black54,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(width: ResponsiveLayout.isDesktop(context) ? 70 : 0),
          SizedBox(
            height: ResponsiveLayout.isDesktop(context) ? 300 : 200,
            width: ResponsiveLayout.isDesktop(context) ? 300 : 200,
            child: const CircleAvatar(
              backgroundImage: AssetImage("assets/profile.png"),
            ),
          ),
        ],
      ),
    );
  }
}
