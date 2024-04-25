part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

// initial state
class HomeInitial extends HomeState {}

//loading state
class HomeLoading extends HomeState {}

//on data loaded state
class HomeLoaded extends HomeState {
  late final List<ResultModel> data;
  HomeLoaded(this.data);
}

//error state
class HomeError extends HomeState {
  late final String errorMessage;
  HomeError(this.errorMessage);
} 