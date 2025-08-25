abstract class HomeState {}

class HomeInitialState extends HomeState {}

/// HomePage
class HomeLoadingState extends HomeState {}

class HomeSuccessState extends HomeState {}

class HomeFailureState extends HomeState {
  final String error;
  HomeFailureState(this.error);
}

/// Navigation
class NavigationChangedState extends HomeState {}

/// Theme Mode
class ChangeThemeAppState extends HomeState {}
