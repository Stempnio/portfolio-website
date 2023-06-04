import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_website/projects/projects.dart';

part 'projects_event.dart';
part 'projects_state.dart';

class ProjectsBloc extends Bloc<ProjectsEvent, ProjectsState> {
  ProjectsBloc({required this.repository})
      : super(
          ProjectsState(
            status: ProjectsStatus.loading,
            projects: BlankProjects.generateBlankProjects(
              repository.repoNames.length,
            ),
          ),
        ) {
    on<LoadProjects>(_onLoadProjects);
  }

  Future<void> _onLoadProjects(
    LoadProjects event,
    Emitter<ProjectsState> emit,
  ) async {
    final projects = await repository.getProjects();
    emit(
      ProjectsState(
        status: ProjectsStatus.success,
        projects: projects,
      ),
    );
  }

  final ProjectsRepository repository;
}
