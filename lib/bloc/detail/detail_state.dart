part of 'detail_bloc.dart';

@immutable
abstract class DetailState {}

// initial state
class DetailInitial extends DetailState {}

//loading state
class DetailLoading extends DetailState {}

//on data loaded state
class DetailLoaded extends DetailState {
  late final DetailModel data;
  late final SpeciesModel speciesdata;
  late final int nextPage;
  late final int prevPage;
  DetailLoaded(this.data,this.speciesdata,this.nextPage,this.prevPage);
}

//error state
class DetailError extends DetailState {
  late final String errorMessage;
  DetailError(this.errorMessage);
}
