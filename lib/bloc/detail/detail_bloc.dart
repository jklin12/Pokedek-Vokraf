import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vorkraf_assessment/model/detail_model.dart';
import 'package:vorkraf_assessment/model/species_model.dart';
import 'package:vorkraf_assessment/repositories/detail_repo.dart';

part 'detail_event.dart';
part 'detail_state.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  final detailRepo = DetailRepo();
  late DetailModel detailModel;
  late SpeciesModel speciesModel;

  DetailBloc() : super(DetailInitial()) {
    //init get data
    on<FetchDetailEvent>(fetchPokemonData);
  }

  FutureOr<void> fetchPokemonData(
      DetailEvent event, Emitter<DetailState> emit) async {
    //emit loading event
    if (event is FetchDetailEvent) {
      emit(DetailLoading());
      await detailRepo
          .getDetailData(event.id)
          .onError((error, stackTrace) => emit(DetailError(error.toString())))
          .then((value) async {
        detailModel = DetailModel.fromJson(value);
        //emit data from api
      });
      await detailRepo
          .getSpeciesData(event.id)
          .onError((error, stackTrace) => emit(DetailError(error.toString())))
          .then((value) async {
        speciesModel = SpeciesModel.fromJson(value);
        //emit data from api
      });

      emit(DetailLoaded(detailModel, speciesModel, (detailModel.id! + 1),
          (detailModel.id! - 1)));
    }
  }
}
