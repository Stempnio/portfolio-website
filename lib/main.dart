import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_website/app/app.dart';
import 'package:portfolio_website/app_bar/app_bar.dart';

void main() {
  runApp(
    BlocProvider(
      create: (_) => PortfolioAppBarCubit(),
      child: const App(),
    ),
  );
}
