import 'package:dio/dio.dart';
import 'package:todo_app/src/core/constants/network_constants.dart';

class NetworkInit {
  final Dio dio;
  NetworkInit()
    : dio = Dio(BaseOptions(baseUrl: NetworkConstants.baseUrl));
}
