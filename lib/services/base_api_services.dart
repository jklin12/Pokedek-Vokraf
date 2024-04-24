abstract class BaseApiService {
  final String baseUrl = "pokeapi.co"; 
 
  Future<dynamic> getHomeResponse(String url,int limit, int offset);   
  Future<dynamic> getDetailResponse(String url,String id);   
}
