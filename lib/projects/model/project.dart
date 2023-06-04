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
  static Project _createBlankProject() =>
      Project(repository: Repository(), imageAssetName: '');

  static List<Project> generateBlankProjects(int amount) =>
      List.generate(amount, (index) => _createBlankProject());
}
