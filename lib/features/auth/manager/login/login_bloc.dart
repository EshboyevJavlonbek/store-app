import 'package:flutter/widgets.dart';
import 'package:store_app/data/repository/auth_repository.dart';

class LoginBloc extends ChangeNotifier {
  LoginBloc({required AuthRepository repo}) : _repo = repo {
    login();
  }

  final formKey = GlobalKey<FormState>();
  final AuthRepository _repo;

  String? _errorMessage;

  bool get hasError => _errorMessage != null;

  String? get errorMessage => _errorMessage;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<bool> login() async {
    try {
      await _repo.login(emailController.text, passwordController.text);
    } on Exception catch (e) {
      _errorMessage = e.toString();
      notifyListeners();
      return false;
    }

    _errorMessage = null;
    notifyListeners();
    return true;
  }
}
