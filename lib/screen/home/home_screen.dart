import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vorkraf_assessment/bloc/home/home_bloc.dart';
import 'package:vorkraf_assessment/model/home_model.dart';
import 'package:vorkraf_assessment/screen/home/component/home_search.dart';
import 'package:vorkraf_assessment/screen/home/component/home_title.dart';
import 'package:vorkraf_assessment/screen/home/component/sort_button.dart';
import 'package:vorkraf_assessment/screen/home/component/tumbnail.dart';
import 'package:vorkraf_assessment/utils/app_assets.dart';
import 'package:vorkraf_assessment/utils/app_colors.dart';

class HomeScreen extends StatefulWidget {
  static const String id = "home_screen";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController scrollController = ScrollController();
  final HomeBloc homeBloc = HomeBloc();
  List<ResultModel> pokemonList = [];

  @override
  void initState() {
    homeBloc.add(FetchHomeEvent());

    if (!scrollController.hasClients) {
      Future.delayed(const Duration(seconds: 3), () {
        homeBloc.add(FetchHomeEvent());
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.identityColor,
      body: SafeArea(
          child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          const HomeTitle(),
          const Row(
            children: [HomeSearch(), SortButton()],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(1.0),
              child: SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: Card(
                  color: Colors.white,
                  child: BlocProvider<HomeBloc>(
                    create: (BuildContext context) => homeBloc,
                    child: BlocBuilder<HomeBloc, HomeState>(
                        builder: (context, state) {
                      if (state is HomeLoadingMore) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (state is HomeLoaded) {
                        if (state.data.isNotEmpty == true) {
                          pokemonList.addAll(state.data);
                        } else {
                          return const Text(
                            "Data not found",
                            style: TextStyle(color: Colors.red),
                          );
                        }
                      } else if (state is HomeError) {
                        return Text(
                          state.errorMessage,
                          style: const TextStyle(color: Colors.red),
                        );
                      }
                      return pokemonListWideget();
                    }),
                  ),
                ),
              ),
            ),
          )
        ],
      )),
    );
  }

  Widget pokemonListWideget() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        controller: scrollController
          ..addListener(() {
            //load next page
            if (scrollController.offset ==
                    scrollController.position.maxScrollExtent &&
                homeBloc.haveMoreData) {
              homeBloc.haveMoreData = false;
              homeBloc.add(FetchHomeEvent());
            }
          }),
        children: [
          GridView.builder(
            physics: const ScrollPhysics(),
            shrinkWrap: true,
            itemCount: pokemonList.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 0.0,
            ),
            itemBuilder: (context, index) {
              return Tumbnail(
                  name: pokemonList[index].name!,
                  number: (index + 1).toString(),
                  image: AppAssets.ilhouette);
            },
          ),
          homeBloc.haveMoreData ? bottomLoader() : Container()
        ],
      ),
    );
  }

  Widget bottomLoader() {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Center(
        child: CircularProgressIndicator(color: Colors.red),
      ),
    );
  }
}
