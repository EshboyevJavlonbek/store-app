class UserModel {
  final String fullName,email,password;

  UserModel({
    required this.fullName,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson(){
    return{
      "fullName": fullName,
      "email": email,
      "password": password,
    };
  }
}
