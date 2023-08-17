import 'package:dio/dio.dart';

abstract class RemoteDataSource {
  Future<Response<dynamic>> getExpenses();
}

class RemoteDataSourceImpl extends RemoteDataSource {
  Dio? _dio;
  static RemoteDataSourceImpl get instance => RemoteDataSourceImpl._();
  RemoteDataSourceImpl._() {
    _dio = Dio();
  }
    

  @override
  Future<Response<dynamic>> getExpenses() async {
    return await _dio!.get("https://o5977.wiremockapi.cloud/expenses");
  }
}
