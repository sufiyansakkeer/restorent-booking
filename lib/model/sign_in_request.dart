class SignInRequestModel {
  String email;
  String password;

  SignInRequestModel({
    required this.email,
    required this.password,
  });

  factory SignInRequestModel.fromJson(Map<String, dynamic> json) =>
      SignInRequestModel(
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
      };
}
