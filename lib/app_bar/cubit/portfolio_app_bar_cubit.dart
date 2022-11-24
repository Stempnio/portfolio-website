import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'portfolio_app_bar_state.dart';

class PortfolioAppBarCubit extends Cubit<PortfolioAppBarState> {
  PortfolioAppBarCubit()
      : super(const PortfolioAppBarState(mobileMenuVisible: false));

  void toggleMobileMenu() {
    emit(
      PortfolioAppBarState(mobileMenuVisible: !state.mobileMenuVisible),
    );
  }
}
