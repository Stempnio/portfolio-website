part of 'projects_bloc.dart';

enum ProjectsStatus {
  loading,
  success,
  failure,
}

class ProjectsState extends Equatable {
  const ProjectsState({
    required this.status,
    required this.projects,
  });

  final ProjectsStatus status;
  final List<Project> projects;

  ProjectsState copyWith({
    ProjectsStatus? status,
    List<Project>? projects,
  }) {
    return ProjectsState(
      status: status ?? this.status,
      projects: projects ?? this.projects,
    );
  }

  @override
  List<Object?> get props => [
        status,
        projects,
      ];
}
