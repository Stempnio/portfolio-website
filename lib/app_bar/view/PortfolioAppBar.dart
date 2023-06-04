import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_website/app_bar/app_bar.dart';
import 'package:portfolio_website/constants.dart';
import 'package:portfolio_website/responsive_layout.dart';

class PortfolioAppBar extends StatefulWidget {
  const PortfolioAppBar({super.key, required this.navItems});
  final List<Widget> navItems;

  @override
  State<PortfolioAppBar> createState() => _PortfolioAppBarState();
}

class _PortfolioAppBarState extends State<PortfolioAppBar>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> menuIconAnimation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );
    menuIconAnimation =
        CurvedAnimation(parent: animationController, curve: Curves.linear);
  }

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveLayout.isDesktop(context);
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: SizedBox(
          height: appBarHeight,
          child: Row(
            children: [
              Text(
                'Jakub Stępień',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              if (isDesktop)
                Row(children: widget.navItems)
              else
                BlocBuilder<PortfolioAppBarCubit, PortfolioAppBarState>(
                  builder: (context, state) {
                    return GestureDetector(
                      child: AnimatedIcon(
                        icon: AnimatedIcons.menu_close,
                        progress: menuIconAnimation,
                      ),
                      onTap: () => _onPressedMenuIcon(
                        context,
                        isMobileMenuVisible: state.mobileMenuVisible,
                      ),
                    );
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }

  void _onPressedMenuIcon(
    BuildContext context, {
    required bool isMobileMenuVisible,
  }) {
    context.read<PortfolioAppBarCubit>().toggleMobileMenu();
    isMobileMenuVisible
        ? animationController.reverse()
        : animationController.forward();
  }
}
