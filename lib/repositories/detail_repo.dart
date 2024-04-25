import 'package:vorkraf_assessment/services/api_endpoints.dart';
import 'package:vorkraf_assessment/services/base_api_services.dart';
import 'package:vorkraf_assessment/services/pokemon_api_service.dart';

class DetailRepo {
  final BaseApiService apiService = PokemonApiService();

  //get detail data repo
  Future getDetailData(String id) async {
    try {
      dynamic response =
          await apiService.getDetailResponse(ApiEndPoints().getPokemonData,id);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  //get species data repo
  Future getSpeciesData(String id) async {
    try {
      dynamic response =
          await apiService.getDetailResponse(ApiEndPoints().getSpeciesData,id);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
