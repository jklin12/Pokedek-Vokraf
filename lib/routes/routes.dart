import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vorkraf_assessment/bloc/home/home_bloc.dart';
import 'package:vorkraf_assessment/screen/detail/detail_screen.dart';

import '../screen/home/home_screen.dart';

class Routes {
  Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      //home routes
      case HomeScreen.id:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<HomeBloc>.value(
            value: HomeBloc(),
            child: const HomeScreen(),
          ),
        );
      case DetailScreen.id:
        return MaterialPageRoute(
          builder: (context) {
            return DetailScreen(
              dataId: args as String
            );
          },
        );
      default:
        return _errorRoute();
    }
  }

  //handling error route
  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('Error while loading new page'),
        ),
      );
    });
  }
}
