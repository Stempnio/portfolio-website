import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_website/about_me/about_me.dart';
import 'package:portfolio_website/app_bar/app_bar.dart';
import 'package:portfolio_website/constants.dart';
import 'package:portfolio_website/contact_me/contact_me.dart';
import 'package:portfolio_website/navigation/navigation.dart';
import 'package:portfolio_website/projects/view/projects.dart';
import 'package:portfolio_website/responsive_layout.dart';
import 'package:portfolio_website/tech_stack/tech_stack.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  final scrollController = ItemScrollController();

  bool mobileMenuHidden = true;

  final bodyItems = const [
    AboutMe(),
    TechStack(),
    Projects(),
    ContactMe(),
  ];

  void _scrollTo(int index) {
    scrollController.scrollTo(
      index: index,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  List<Widget> navItems() => [
        NavButton(
          scrollTo: () => _scrollTo(0),
          text: 'About me',
        ),
        NavButton(
          scrollTo: () => _scrollTo(1),
          text: 'Tech stack',
        ),
        NavButton(
          scrollTo: () => _scrollTo(2),
          text: 'Projects',
        ),
        ElevatedNavButton(
          scrollTo: () => _scrollTo(3),
          text: 'Contact',
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jakub Stępień',
      theme: ThemeData(
        brightness: Brightness.dark,
        textTheme: GoogleFonts.merriweatherSansTextTheme(
          ThemeData(brightness: Brightness.dark).textTheme,
        ),
      ),
      home: Title(
        color: Colors.blue,
        title: 'Jakub Stępień',
        child: Scaffold(
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
              ScrollablePositionedList.builder(
                physics: const ClampingScrollPhysics(),
                itemScrollController: scrollController,
                itemCount: bodyItems.length,
                itemBuilder: (context, index) {
                  return bodyItems[index];
                },
              ),
              _MobileAppBar(
                items: navItems(),
              ),
            ],
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class _MobileAppBar extends StatelessWidget {
  const _MobileAppBar({required this.items});

  final List<Widget> items;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PortfolioAppBarCubit, PortfolioAppBarState>(
      builder: (context, state) {
        return AnimatedOpacity(
          opacity: state.mobileMenuVisible && ResponsiveLayout.isMobile(context)
              ? 1
              : 0,
          duration: const Duration(milliseconds: 400),
          child: Container(
            color: Theme.of(context).scaffoldBackgroundColor,
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: items,
            ),
          ),
        );
      },
    );
  }
}
