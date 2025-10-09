
import 'package:dio/dio.dart';

abstract class Failure {
  final String message;

  Failure(this.message);
}

class ServerFailure extends Failure {
  ServerFailure(super.message);

  factory ServerFailure.fromDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('connectionTimeout with api server');
      case DioExceptionType.sendTimeout:
        return ServerFailure('sendTimeout  with api server');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('receiveTimeout  with api server');
      case DioExceptionType.badCertificate:
        return ServerFailure('badCertificate  with api server');
      case DioExceptionType.badResponse:
      return ServerFailure.fromResponse(e.response!.statusCode!, e.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure('Request to Api Server was canceled');
      case DioExceptionType.connectionError:
        return ServerFailure('No Internet connection');
      case DioExceptionType.unknown:
        return ServerFailure('Opps, there was an error  with api server');
    }
  }
  factory ServerFailure.fromResponse(int statusCode , dynamic response){
    if(statusCode==404){
      return ServerFailure("your request Not Found");
    }else if(statusCode== 500){
      return ServerFailure("Sorry, there was an error from the server");
    }else if(statusCode==404||statusCode==401||statusCode==403){
      return ServerFailure(response['message']);
    }else{
      return ServerFailure('sorry there was an error , please try again later ');
    }
  }
}