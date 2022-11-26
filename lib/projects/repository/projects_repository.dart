import 'package:github/github.dart';

import '../model/project.dart';

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
    List<Project> projects = [];
    for (var repoName in repoNames) {
      var repo = await _githubInstance.repositories
          .getRepository(RepositorySlug(user, repoName));
      var imageAssetName = "${repo.name}-logo.png";
      var project = Project(repository: repo, imageAssetName: imageAssetName);
      projects.add(project);
    }
    return projects;
  }
}
