import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_website/projects/view/projects_list.dart';
import 'package:portfolio_website/responsive_layout.dart';
import 'package:portfolio_website/projects/bloc/projects_bloc.dart';

class Projects extends StatelessWidget {
  const Projects({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: 50,
          horizontal:
              ResponsiveLayout.isDesktop(context) ? screenWidth * 0.1 : 0),
      child: Container(
        decoration: BoxDecoration(
          gradient:
              const LinearGradient(colors: [Colors.grey, Colors.blueGrey]),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const Text(
                "Projects",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              const SizedBox(height: 30),
              BlocBuilder<ProjectsBloc, ProjectsState>(
                builder: (context, state) {
                  if (state.status == ProjectsStatus.loading) {
                    //TODO: loading screen
                    return Text("Loading");
                  } else if (state.status == ProjectsStatus.success) {
                    // return Text("success");
                    return ProjectsList(projects: state.projects);
                  } else {
                    //TODO: failure screen
                    return Text("failure");
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
