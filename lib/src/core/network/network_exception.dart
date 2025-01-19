// ignore_for_file: must_be_immutable

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
// import 'package:sembolbi_mobile_app/src/core/config/router/app_router.dart';

/// It takes a DioException object and returns a custom error message
class NetworkExceptions extends Equatable implements Exception {
  NetworkExceptions.fromDioError(DioException dioError) {
    message = 'Something went wrong';
    status = dioError.response?.statusCode ?? -1;
    message = dioError.response?.data['error'] as String? ?? ''; // for error model

    if (status == 401) {
      //! Yetkisiz İşlem - Token expired
      // GetIt.I.get<LocalManager>().clearAllValues();
    }
    switch (dioError.type) {
      case DioExceptionType.cancel:
        message = 'Request to API server was cancelled';
        break;

      case DioExceptionType.connectionTimeout:
        message = 'Connection timeout with API server';
        break;

      case DioExceptionType.receiveTimeout:
        message = 'Receive timeout in connection with API server';
        break;

      case DioExceptionType.sendTimeout:
        message = 'Send timeout in connection with API server';
        break;

      case DioExceptionType.connectionError:
        if (dioError.message!.contains('SocketException')) {
          message = 'No Internet';
          break;
        } else {
          message = 'Şuanda işleminizi gerçekleştiremiyoruz. Lütfen daha sonra tekrar deneyiniz.';
          break;
        }
      case DioExceptionType.badCertificate:
        message = 'Bad Certificate';
        break;

      case DioExceptionType.badResponse:
        message = message;
        break;

      case DioExceptionType.unknown:
        message = 'Unexpected error occurred';
        break;
    }
  }

  late String message;
  late int status;

  @override
  List<Object> get props => [message];
}
