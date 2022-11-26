import 'package:github/github.dart';

class Project {
  Project({
    required this.repository,
    required this.imageAssetName,
  });

  final Repository repository;
  final String imageAssetName;
}
