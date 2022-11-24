import 'package:flutter/material.dart';
import 'package:portfolio_website/responsive_layout.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({
    Key? key,
    required this.appName,
    required this.appDescription,
  }) : super(key: key);

  final String appName;
  final String appDescription;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ResponsiveLayout.isDesktop(context) ? 300 : double.infinity,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 10,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 15, 15, 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg",
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Text(
                appName,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black54),
              ),
              const SizedBox(height: 5),
              Text(
                appDescription,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text("see details"),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
