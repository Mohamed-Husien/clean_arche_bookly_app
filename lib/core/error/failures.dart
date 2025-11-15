import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMessage;

  const Failure({required this.errorMessage});
}

class ServerError extends Failure {
  ServerError({required super.errorMessage});

  factory ServerError.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerError(errorMessage: "Connection timeout with ApiServer");
      case DioExceptionType.sendTimeout:
        return ServerError(errorMessage: "Send timeout with ApiServer");
      case DioExceptionType.receiveTimeout:
        return ServerError(errorMessage: "Received timeout with ApiServer");
      case DioExceptionType.badCertificate:
        return ServerError(errorMessage: "Bad Certificate  with ApiServer");
      case DioExceptionType.badResponse:
        return ServerError.fromBadResponse(
            dioException.response!.statusCode!, dioException.response!.data);
      case DioExceptionType.cancel:
        return ServerError(errorMessage: "Request to ApiServer was canceled ");
      case DioExceptionType.connectionError:
        return ServerError(errorMessage: "No internet connection ");

      case DioExceptionType.unknown:
        return ServerError(
            errorMessage: "Unexpected error , please try again later");
      default:
        return ServerError(
            errorMessage: "oops there was an error , please try again later");
    }
  }

  factory ServerError.fromBadResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerError(errorMessage: response['error']['message']);
    } else if (statusCode == 404) {
      return ServerError(
          errorMessage: 'Your request not found , please try later!');
    } else if (statusCode == 500) {
      return ServerError(
          errorMessage: "Internal server error , please try later!");
    } else {
      return ServerError(
          errorMessage: "oops there was an error , please try again later");
    }
  }
}
