import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_website/about_me/about_me.dart';
import 'package:portfolio_website/app_bar/app_bar.dart';
import 'package:portfolio_website/contact_me/contact_me.dart';
import 'package:portfolio_website/projects/view/projects.dart';
import 'package:portfolio_website/responsive_layout.dart';
import 'package:portfolio_website/tech_stack/tech_stack.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:portfolio_website/navigation/navigation.dart';
import 'package:portfolio_website/constants.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  final scrollController = AutoScrollController();

  bool mobileMenuHidden = true;

  final bodyItems = const [
    AboutMe(),
    TechStack(),
    Projects(),
    ContactMe(),
  ];

  void _scrollTo(int index) {
    scrollController.scrollToIndex(
      index,
      preferPosition: AutoScrollPosition.begin,
    );
  }

  List<Widget> navItems() => [
        NavButton(
          scrollTo: () => _scrollTo(0),
          text: "About me",
        ),
        NavButton(
          scrollTo: () => _scrollTo(1),
          text: "Tech stack",
        ),
        NavButton(
          scrollTo: () => _scrollTo(2),
          text: "Projects",
        ),
        ElevatedNavButton(
          scrollTo: () => _scrollTo(3),
          text: "Contact",
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jakub Stępień',
      home: Scaffold(
        key: scaffoldKey,
        appBar: PreferredSize(
          preferredSize: const Size(
            double.infinity,
            appBarHeight,
          ),
          child: PortfolioAppBar(
            navItems: navItems(),
          ),
        ),
        body: Stack(
          children: [
            ListView.builder(
              controller: scrollController,
              itemCount: bodyItems.length,
              itemBuilder: (context, index) {
                return AutoScrollTag(
                  key: ValueKey(index),
                  controller: scrollController,
                  index: index,
                  child: bodyItems[index],
                );
              },
            ),
            BlocBuilder<PortfolioAppBarCubit, PortfolioAppBarState>(
              builder: (context, state) {
                return AnimatedOpacity(
                  opacity: state.mobileMenuVisible &&
                          ResponsiveLayout.isMobile(context)
                      ? 1
                      : 0,
                  duration: const Duration(milliseconds: 400),
                  child: Container(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: navItems(),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
