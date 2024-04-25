abstract class BaseApiService {
  final String baseUrl = "pokeapi.co"; 
 
  Future<dynamic> getPaginationResponse(String url,int limit, int offset);   
  Future<dynamic> getDetailResponse(String url,String id);   
}
