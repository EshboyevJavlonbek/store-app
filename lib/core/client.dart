import 'package:dio/dio.dart';
import 'package:store_app/core/exceptions/auth_exception.dart';
import 'package:store_app/core/interceptor.dart';
import 'package:store_app/data/model/user_model.dart';

class ApiClient {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: 'http://192.168.11.41:8888/api/v1',
      validateStatus: (status) => true,
    ),
  )..interceptors.add(AuthInterceptor());

  Future<T> genericGetRequest<T>(String path,
      {Map<String, dynamic>? queryParams}) async {
    var response = await dio.get(path, queryParameters: queryParams);
    if (response.statusCode == 200) {
      return response.data as T;
    } else {
      throw DioException(
          requestOptions: response.requestOptions, response: response);
    }
  }

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

  Future<bool> forgotPassword(String email) async {
    var response =
        await dio.post("/auth/reset-password/email", data: {"email": email});

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> enterCode(String email, String code) async {
    var response = await dio.post(
      "/auth/reset-password/verify",
      data: {"email": email, "code": code},
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> resetPassword(String email, String code, String password) async {
    var response = await dio.post(
      "/auth/reset-password/reset",
      data: {
        "email": email,
        "code": code,
        "password": password,
      },
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> saveItem({required int productId}) async{
    var response = await dio.post('/auth/save/$productId');
    if (response.statusCode == 200) {
      return true;
    }else{
      return false;
    }
  }

  Future<bool> unSaveItem({required int productId}) async{
    var response = await dio.post('/auth/unsave/$productId');
    if (response.statusCode == 200) {
      return true;
    }else{
      return false;
    }
  }
}
