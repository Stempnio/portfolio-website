import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:portfolio_website/projects/model/project.dart';

import '../repository/projects_repository.dart';

part 'projects_event.dart';
part 'projects_state.dart';

class ProjectsBloc extends Bloc<ProjectsEvent, ProjectsState> {
  ProjectsBloc({required this.repository})
      : super(const ProjectsState(
          status: ProjectsStatus.loading,
          projects: [],
        )) {
    on<LoadProjects>(_onLoadProjects);
  }

  Future<void> _onLoadProjects(
    LoadProjects event,
    Emitter<ProjectsState> emit,
  ) async {
    List<Project> projects = await repository.getProjects();
    emit(ProjectsState(
      status: ProjectsStatus.success,
      projects: projects,
    ));
  }

  final ProjectsRepository repository;
}
