class ForgotPasswordModel {
  final String email, code, password;

  ForgotPasswordModel({
    required this.email,
    required this.password,
    required this.code,
  });

  Map<String, dynamic> toJson(){
    return{
      "code": code,
      "email": email,
      "password": password,
    };
  }
}
