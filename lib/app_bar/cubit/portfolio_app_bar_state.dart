part of 'portfolio_app_bar_cubit.dart';

class PortfolioAppBarState extends Equatable {
  const PortfolioAppBarState({required this.mobileMenuVisible});

  final bool mobileMenuVisible;

  @override
  List<Object?> get props => [mobileMenuVisible];
}
