part of 'navigation_cubit.dart';

abstract class NavigationState extends Equatable {
  const NavigationState();

  @override
  List<Object> get props => [];
}

class NavigationMainState extends NavigationState {}

class NavigationShoppingCartScreenState extends NavigationState {}
