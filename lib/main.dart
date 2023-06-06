import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_website/app/app.dart';
import 'package:portfolio_website/app_bar/app_bar.dart';
import 'package:portfolio_website/projects/bloc/projects_bloc.dart';
import 'package:portfolio_website/projects/repository/projects_repository.dart';

void main() {
  const user = 'Stempnio';
  const repoNames = [
    'password-keeper',
    'review-exchange',
    'airport-management-system',
    'ml-tumor-classification',
    'space-dailies',
    'pesel-validator',
    'pseudo-random-number-generators',
    'file-versioning-tool',
  ];

  final projectRepository = ProjectsRepository(
    user: user,
    repoNames: repoNames,
  );

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => PortfolioAppBarCubit()),
        BlocProvider(
          create: (_) => ProjectsBloc(
            repository: projectRepository,
          )..add(LoadProjects()),
        ),
      ],
      child: const App(),
    ),
  );
}
