import 'package:flutter/material.dart';
import 'package:portfolio_website/responsive_layout.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      width: ResponsiveLayout.isDesktop(context) ? 300 : double.infinity,
      child: Card(
        elevation: 10,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: Image.asset(
                  "profile.png",
                  width: 200,
                  height: 200,
                ),
              ),
              Text(
                "App name",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black54),
              ),
              Text(
                "Description",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
              Container(),
            ],
          ),
        ),
      ),
    );
  }
}
