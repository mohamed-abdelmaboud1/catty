import 'package:dio/dio.dart';

class ApiInterceptor extends Interceptor {
  final String? _token;

  ApiInterceptor(this._token);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // if (_token != null && _token.isNotEmpty) {
    options.headers['Authorization'] =
        'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI1YjNlNDA0Zi1mNTBmLTRmODYtZjIwMy0wOGRlMDdjM2ZlMTMiLCJqdGkiOiJlMzI2NzNiOC01ZTQ2LTQ1YzEtOTlkNy1lNzM4MWY4ZmZlNDAiLCJlbWFpbCI6Im1lZGFmZTkzOTVAYXJxc2lzLmNvbSIsIm5hbWUiOiJNb2hhbWVkIFJhc2hhZCIsInJvbGVzIjoiIiwicGljdHVyZSI6IiIsImV4cCI6MTc2MDQwMDUwNywiaXNzIjoiZXNob3AubmV0IiwiYXVkIjoiZXNob3AubmV0In0.LNNoybBu3yv5woQ1pRWKrpCoH-Be4-KF4DuetpBunFM';
    // options.headers['Authorization'] = 'Bearer $_token';
    // }
    options.data = {...?options.data, "page": 1, "pageSize": 10};
    options.headers['Content-Type'] = 'application/json';
    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // You can log or handle token expiration here if needed.
    super.onError(err, handler);
  }
}
