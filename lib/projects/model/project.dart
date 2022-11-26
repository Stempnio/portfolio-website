import 'package:github/github.dart';

class Project {
  Project({
    required this.repository,
    required this.imageAssetName,
  });

  final Repository repository;
  final String imageAssetName;
}

extension BlankProjects on Project {
  static Project blankProject() =>
      Project(repository: Repository(), imageAssetName: "");

  static List<Project> getBlankProjects(int number) {
    List<Project> result = [];
    for (var i = 0; i < number; i++) {
      result.add(blankProject());
    }
    return result;
  }
}
