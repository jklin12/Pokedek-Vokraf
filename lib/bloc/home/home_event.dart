part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

//fetch data pokemno event
class FetchHomeEvent extends HomeEvent {
  FetchHomeEvent();
} 
