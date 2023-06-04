import 'package:github/github.dart';

import 'package:portfolio_website/projects/model/project.dart';

class ProjectsRepository {
  ProjectsRepository({
    required this.user,
    required this.repoNames,
    GitHub? githubInstance,
  }) : _githubInstance = githubInstance ?? GitHub();

  final String user;
  final List<String> repoNames;
  final GitHub _githubInstance;

  Future<List<Project>> getProjects() async {
    final projects = <Project>[];
    for (final repoName in repoNames) {
      final repo = await _githubInstance.repositories
          .getRepository(RepositorySlug(user, repoName));
      final imageAssetName = 'assets/${repo.name}-logo.png';
      final project = Project(repository: repo, imageAssetName: imageAssetName);
      projects.add(project);
    }
    return projects;
  }
}
