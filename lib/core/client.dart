import 'package:dio/dio.dart';
import 'package:store_app/core/exceptions/auth_exception.dart';
import 'package:store_app/core/interceptor.dart';
import 'package:store_app/data/model/user_model.dart';

class ApiClient {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: 'http://192.168.100.139:8888/api/v1',
      validateStatus: (status) => true,
    ),
  )..interceptors.add(AuthInterceptor());

  Future<String> login(String email, String password) async {
    var response = await dio
        .post('/auth/login', data: {"login": email, "password": password});
    if (response.statusCode == 200) {
      Map<String, String> data = Map<String, String>.from(response.data);
      return data['accessToken']!;
    } else {
      throw AuthException(
          massage: "login qilib bo'lmadi, xullasi nimadur noto'g'ri ketgan.");
    }
  }

  Future<bool> signUp(UserModel model) async {
    var response = await dio.post(
      '/auth/register',
      data: model.toJson(),
    );
    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }
}
