import 'package:flutter/material.dart';
import 'package:portfolio_website/app_bar/app_bar.dart';
import 'package:portfolio_website/about_me/about_me.dart';
import 'package:portfolio_website/contact_me/contact_me.dart';
import 'package:portfolio_website/projects/projects.dart';
import 'package:portfolio_website/tech_stack/tech_stack.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jakub Stępień',
      theme: ThemeData(
          // brightness: Brightness.dark,
          ),
      home: Scaffold(
        key: scaffoldKey,
        drawer: Drawer(
            child: Wrap(
          children: [
            TextButton(
              onPressed: () {},
              child: const Text("About me"),
            ),
            TextButton(
              onPressed: () {},
              child: const Text("Tech stack"),
            ),
            TextButton(
              onPressed: () {},
              child: const Text("Projects"),
            ),
            OutlinedButton(
              onPressed: () {},
              child: const Text("Contact"),
            ),
          ],
        )),
        extendBodyBehindAppBar: true,
        appBar: PreferredSize(
          preferredSize: const Size(
            double.infinity,
            56.0,
          ),
          child: GlassMorphicAppBar(openDrawer: () {
            scaffoldKey.currentState!.openDrawer();
          }),
        ),
        body: ListView(
          children: const [
            AboutMe(),
            TechStack(),
            Projects(),
            ContactMe(),
          ],
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
