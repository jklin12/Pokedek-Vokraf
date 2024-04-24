
part of 'detail_bloc.dart';

@immutable
abstract class DetailEvent {}

//fetch data pokemno event
class FetchDetailEvent extends DetailEvent {
  final String id;
  FetchDetailEvent(this.id);
}
