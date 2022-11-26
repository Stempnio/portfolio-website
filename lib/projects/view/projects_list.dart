import 'package:flutter/material.dart';
import 'package:portfolio_website/projects/projects.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectsList extends StatelessWidget {
  const ProjectsList({
    Key? key,
    required this.projects,
  }) : super(key: key);

  final List<Project> projects;
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 20,
      runSpacing: 20,
      children: projects
          .map(
            (project) => ProjectCard(
              name: project.repository.name.replaceAll('-', ' '),
              description: project.repository.description,
              imageAssetName: project.imageAssetName,
              btnOnTap: () => launchUrl(Uri.parse(project.repository.htmlUrl)),
            ),
          )
          .toList(),
    );
  }
}
