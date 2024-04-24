import 'package:vorkraf_assessment/services/api_endpoints.dart';
import 'package:vorkraf_assessment/services/base_api_services.dart';
import 'package:vorkraf_assessment/services/pokemon_api_service.dart';

class HomeRepo {
  final BaseApiService apiService = PokemonApiService();
  static const int limit = 8;
  //get home data repo
  Future getHomeData(int offset) async {
    try {
      dynamic response =
          await apiService.getHomeResponse(ApiEndPoints().getHomeData,limit,offset);
      return response;
    } catch (e) {
      rethrow;
    }
  }

   
}
