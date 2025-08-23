abstract class HomeState {}

class HomeInitialState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeSuccessState extends HomeState {}

class HomeFailureState extends HomeState {
  final String error;
  HomeFailureState(this.error);
}

class NavigationChangedState extends HomeState {}

// class HomeChangeThemeAppState extends HomeStates {}

// class ChangeSelectedIndexState extends HomeStates {}
