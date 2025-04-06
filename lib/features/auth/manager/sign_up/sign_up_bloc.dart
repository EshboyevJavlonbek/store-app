import 'package:flutter/widgets.dart';
import 'package:store_app/data/repository/auth_repository.dart';

class SignUpBloc extends ChangeNotifier {
  SignUpBloc({required AuthRepository repo}) : _repo = repo;

  final formKey = GlobalKey<FormState>();
  final AuthRepository _repo;

  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<bool> signUp() async {
    var result = await _repo.signUp(
      fullName: fullNameController.text,
      email: emailController.text,
      password: passwordController.text,
    );
    return result;
  }
}
