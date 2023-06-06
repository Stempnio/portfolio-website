import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_website/projects/bloc/projects_bloc.dart';
import 'package:portfolio_website/projects/view/projects_list.dart';
import 'package:portfolio_website/responsive_layout.dart';

class Projects extends StatelessWidget {
  const Projects({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = ResponsiveLayout.isDesktop(context);

    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: 50, horizontal: isDesktop ? screenWidth * 0.1 : 0),
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Colors.white10, Colors.black26],
            begin: Alignment.topCenter,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const Text(
                'Projects',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              const SizedBox(height: 30),
              BlocBuilder<ProjectsBloc, ProjectsState>(
                builder: (context, state) {
                  if (state.status == ProjectsStatus.loading) {
                    return ProjectsList(
                      projects: state.projects,
                      isLoading: true,
                    );
                  } else if (state.status == ProjectsStatus.success) {
                    // return Text("success");
                    return ProjectsList(projects: state.projects);
                  } else {
                    //TODO: failure screen
                    return const Text('failure');
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
