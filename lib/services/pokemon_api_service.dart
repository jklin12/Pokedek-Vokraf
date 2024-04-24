
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:vorkraf_assessment/services/app_exception.dart';
import 'package:vorkraf_assessment/services/base_api_services.dart';
import 'package:http/http.dart' as http;

class PokemonApiService extends BaseApiService {
 

  //get pagination response
  @override
  Future getHomeResponse(String url,int limit,int offset) async {
    dynamic responseJson;
    try {
      var query = {"limit": "$limit", "offset": "$offset"};
      var uri = Uri.http(baseUrl, url,query);
      if (kDebugMode) {
        print(uri.toString());
        print(uri.queryParametersAll.toString());
      }
      final response = await http.get(uri);
      responseJson = returnResponse(response);
    } catch (e) {
      if (e is AppException) {
        throw FetchDataException(e.toString());
     
      } else {
        throw FetchDataException("Something went wrong: ${e.toString()}");
      }
    }
    return responseJson;
  }

  @override
  Future getDetailResponse(String url,String id) async {
    dynamic responseJson;
    try { 
      var uri = Uri.http(baseUrl, "$url/$id");
      if (kDebugMode) {
        print(uri.toString());
        print(uri.queryParametersAll.toString());
      }
      final response = await http.get(uri);
      responseJson = returnResponse(response);
    } catch (e) {
      if (e is AppException) {
        throw FetchDataException(e.toString());
     
      } else {
        throw FetchDataException("Something went wrong: ${e.toString()}");
      }
    }
    return responseJson;
  }

  //handling api response
  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.toString());
      case 401:
      case 403:
      case 404:
        dynamic responseJson = jsonDecode(response.body);
        throw UnauthorisedException(responseJson['message']);
      case 500:
      default:
        throw FetchDataException(
            'Error occurred while communication with server with status code : ${response.statusCode}');
    }
  }

   
}