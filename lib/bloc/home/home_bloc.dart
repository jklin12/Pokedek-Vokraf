import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vorkraf_assessment/model/home_model.dart';
import 'package:vorkraf_assessment/repositories/home_repo.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final homeRepo = HomeRepo();
  int page = 0;
  bool haveMoreData = false;
  HomeBloc() : super(HomeInitial()) {
    //init get data
    on<FetchHomeEvent>(fetchPokemonData); 
  }
 

  FutureOr<void> fetchPokemonData(
      HomeEvent event, Emitter<HomeState> emit) async {
    if (event is FetchHomeEvent) {
      if (page == 0) {
        emit(HomeLoading());
      } 
      await homeRepo
          .getHomeData(page)
          //.onError((error, stackTrace) => emit(HomeError(error.toString())))
          .then((value) async {
            
        HomeModel homeModel = HomeModel.fromJson(value);
        
        if (homeModel.next != null) {
          page = page + 8;
          haveMoreData = true;
        }
        //emit data from api
        emit(HomeLoaded(homeModel.result!));
      });
    }
  }
}
