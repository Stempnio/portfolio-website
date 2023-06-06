import 'package:flutter/material.dart';
import 'package:portfolio_website/projects/projects.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectsList extends StatelessWidget {
  const ProjectsList({
    super.key,
    required this.projects,
    this.isLoading = false,
  });

  final List<Project> projects;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 20,
      runSpacing: 20,
      children: projects
          .map(
            (project) => ProjectCard(
              name: isLoading
                  ? 'Loading'
                  : project.repository.name.replaceAll('-', ' '),
              description: isLoading ? '' : project.repository.description,
              language: isLoading ? '' : project.repository.language,
              imageAssetName: isLoading ? '' : project.imageAssetName,
              onPressed: () => launchUrl(Uri.parse(project.repository.htmlUrl)),
              loading: isLoading,
            ),
          )
          .toList(),
    );
  }
}
