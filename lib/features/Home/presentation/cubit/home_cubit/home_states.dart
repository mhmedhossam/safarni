class HomeStates {}

class HomeInitialState extends HomeStates {}

class HomeLoadingState extends HomeStates {}

class HomeSuccessState extends HomeStates {}

class HomeFailureState extends HomeStates {
  final String message;
  HomeFailureState({required this.message});
}
