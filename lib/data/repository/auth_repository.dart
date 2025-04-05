import 'package:store_app/core/client.dart';
import 'package:store_app/core/secure_storage.dart';
import 'package:store_app/data/model/user_model.dart';

class AuthRepository {
  AuthRepository({required this.client});

  final ApiClient client;

  String? jwt;

  Future<void> login(String email, String password) async {
    final String token = await client.login(email, password);
    await SecureStorage.deleteToken();
    await SecureStorage.deleteCredentials();
    await SecureStorage.saveCredentials(login: email, password: password);
    await SecureStorage.saveToken(token);
    jwt = token;
  }

  Future<bool> signUp({
    required String fullName,
    required String email,
    required String password,
  }) async {
    final result = await client.signUp(
      UserModel(
        fullName: fullName,
        email: email,
        password: password,
      ),
    );
    return result;
  }

  Future<void> logout() async {
    await SecureStorage.deleteToken();
    await SecureStorage.deleteCredentials();
  }

  Future<bool> refreshToken() async {
    var credentials = await SecureStorage.getCredentials();
    if (credentials['login'] == null || credentials['password'] == null) {
      return false;
    }
    jwt = await client.login(credentials['login']!, credentials['password']!);
    await SecureStorage.deleteToken();
    await SecureStorage.saveToken(jwt!);
    return true;
  }
}
