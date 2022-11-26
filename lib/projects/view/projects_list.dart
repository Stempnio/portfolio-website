import 'package:flutter/material.dart';
import 'package:portfolio_website/projects/projects.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectsList extends StatelessWidget {
  const ProjectsList({
    Key? key,
    required this.projects,
    this.loading = false,
  }) : super(key: key);

  final List<Project> projects;
  final bool loading;
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 20,
      runSpacing: 20,
      children: projects
          .map(
            (project) => ProjectCard(
              name: loading
                  ? "Loading"
                  : project.repository.name.replaceAll('-', ' '),
              description: loading ? "" : project.repository.description,
              imageAssetName: loading ? "" : project.imageAssetName,
              btnOnTap: () => launchUrl(Uri.parse(project.repository.htmlUrl)),
              loading: loading,
            ),
          )
          .toList(),
    );
  }
}
