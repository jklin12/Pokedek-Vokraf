import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vorkraf_assessment/bloc/detail/detail_bloc.dart';
import 'package:vorkraf_assessment/model/detail_model.dart';
import 'package:vorkraf_assessment/model/species_model.dart';
import 'package:vorkraf_assessment/screen/detail/component/about_detail.dart';
import 'package:vorkraf_assessment/screen/detail/component/bg_image.dart';
import 'package:vorkraf_assessment/screen/detail/component/next_btn.dart';
import 'package:vorkraf_assessment/screen/detail/component/pokemon_image.dart';
import 'package:vorkraf_assessment/screen/detail/component/prev_btn.dart';
import 'package:vorkraf_assessment/screen/detail/component/stats_detail.dart';
import 'package:vorkraf_assessment/screen/detail/component/type_card.dart';
import 'package:vorkraf_assessment/screen/detail/loading_screen.dart';
import 'package:vorkraf_assessment/utils/app_style.dart';
import 'package:vorkraf_assessment/utils/pokemon_color.dart';

class DetailScreen extends StatefulWidget {
  static const String id = "detail_screen";
  final String dataId;

  const DetailScreen({
    super.key,
    required this.dataId,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final DetailBloc detailBloc = DetailBloc();
  late DetailModel detailData;
  late SpeciesModel speciesData;
  int nextPage = 0;
  int prevPage = 0;

  @override
  void initState() {
    detailBloc.add(FetchDetailEvent(widget.dataId));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: BlocProvider<DetailBloc>(
          create: (BuildContext context) => detailBloc,
          child:
              BlocBuilder<DetailBloc, DetailState>(builder: (context, state) {
            if (state is DetailLoading) {
              return const LoadingScreen();
            } else if (state is DetailLoaded) {
              detailData = state.detailData;
              speciesData = state.speciesdata;
              return Scaffold(
                  extendBodyBehindAppBar: true,
                  backgroundColor: PokemonColor.getColor(
                      detailData.types!.first.type!.name!),
                  appBar: AppBar(
                    iconTheme: const IconThemeData(color: Colors.white),
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    title: Text(
                      detailData.name ?? '',
                      style: AppStyles.headline.copyWith(color: Colors.white),
                    ),
                    actions: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "#${detailData.id.toString().padLeft(3, '0')}",
                          style:
                              AppStyles.subtitle1.copyWith(color: Colors.white),
                        ),
                      )
                    ],
                  ),
                  body: Stack(
                    children: [
                      const BgImage(),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.85,
                          child: Column(
                            children: [
                              imageWidget(state),
                              Typecard(
                                detailData: detailData,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              titleWidget("About"),
                              const SizedBox(
                                height: 10,
                              ),
                              AboutDetail(
                                detailData: detailData,
                                speciesData: speciesData,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              titleWidget("Base Stats"),
                              const SizedBox(
                                height: 10,
                              ),
                              StatsDetail(detailModel: detailData)
                            ],
                          ),
                        ),
                      )
                    ],
                  ));
            } else if (state is DetailError) {
              return Text(
                state.errorMessage,
                style: const TextStyle(color: Colors.red),
              );
            } else {
              return const LoadingScreen();
            }
          })),
    );
  }

  Widget imageWidget(DetailLoaded state) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        PrevBtn(
          dataId: detailData.id!,
          onTap: () {
            detailBloc.add(FetchDetailEvent("${state.prevPage}"));
          },
        ),
        PokemonImage(url: detailData.sprites!.frontDefault!),
        NextBtn(
          dataId: detailData.id!,
          onTap: () {
            detailBloc.add(FetchDetailEvent("${state.nextPage}"));
          },
        )
      ],
    );
  }

  Widget titleWidget(String title) {
    return Text(
      title,
      style: AppStyles.subtitle1.copyWith(
          color: PokemonColor.getColor(detailData.types!.first.type!.name!)),
    );
  }
}
