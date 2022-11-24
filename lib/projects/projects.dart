import 'package:flutter/material.dart';
import 'package:portfolio_website/projects/project_card.dart';
import 'package:portfolio_website/responsive_layout.dart';

class Projects extends StatelessWidget {
  const Projects({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: 50,
          horizontal:
              ResponsiveLayout.isDesktop(context) ? screenWidth * 0.1 : 0),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Colors.grey, Colors.blueGrey]),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const Text(
                "Projects",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              SizedBox(height: 30),
              Wrap(
                spacing: 20,
                runSpacing: 20,
                children: [
                  ProjectCard(
                    appName: "App 1",
                    appDescription: "Description of app 1",
                  ),
                  ProjectCard(
                    appName: "App 1",
                    appDescription: "Description of app 1",
                  ),
                  ProjectCard(
                    appName: "App 1",
                    appDescription: "Description of app 1",
                  ),
                  ProjectCard(
                    appName: "App 1",
                    appDescription: "Description of app 1",
                  ),
                  ProjectCard(
                    appName: "App 1",
                    appDescription: "Description of app 1",
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
