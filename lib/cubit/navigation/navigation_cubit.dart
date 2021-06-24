import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  //

  NavigationCubit() : super(NavigationMainState());

  void navigateToMainScreen() async {
    emit(NavigationMainState());
  }

  void navigateToShoppingCartScreen() async {
    emit(NavigationShoppingCartScreenState());
  }

  //
}
