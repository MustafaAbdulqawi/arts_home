// import 'package:arts_home/core/constants_methods.dart';
// import 'package:arts_home/data/remote/data_providers/my_dio.dart';
// import 'package:arts_home/data/remote/responses/movies_response.dart';
// import 'package:dio/dio.dart';
//
// import '../../../core/end_point.dart';
//
// class MoviesRequest {
//   Future moviesRequest({
//     required String apiKey,
//   }) async {
//     try {
//       Response response = await MyDio.getData(endPoint: popularMovies, query: {
//         ' api_key': apiKey,
//       });
//       printTest('moviesRequestStatusCode ${response.statusCode}');
//       printResponse('moviesResponse ${response.data}');
//       return MoviesResponse.fromJson(response.data);
//     } catch (error) {
//       printError('moviesRequest $error');
//     }
//   }
// }

import 'package:arts_home/core/constants_methods.dart';
import 'package:arts_home/data/remote/data_providers/my_dio.dart';
import 'package:dio/dio.dart';

import '../../../core/end_point.dart';
import '../responses/movies_response.dart';

class MoviesRequest{
  Future moviesRequest({
    required String apiKey
  }) async{
    try{
      Response response = await MyDio.getData(
          endPoint: popularMovies,
          query: {
            'api_key': apiKey,
          }
      );
      printTest('moviesRequestStatusCode ${response.statusCode}');
      printResponse('moviesResponse ${response.data}');
      return MoviesResponse.fromJson(response.data);
    }catch(error){
      printError('moviesRequest $error');
    }
  }
}
