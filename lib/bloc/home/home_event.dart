part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

//fetch pokemon pagination event
class FetchHomeEvent extends HomeEvent {
  FetchHomeEvent();
} 
