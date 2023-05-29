class SignInResponseModel {
  String refresh;
  String access;

  SignInResponseModel({
    required this.refresh,
    required this.access,
  });

  factory SignInResponseModel.fromJson(Map<String, dynamic> json) =>
      SignInResponseModel(
        refresh: json["refresh"],
        access: json["access"],
      );

  Map<String, dynamic> toJson() => {
        "refresh": refresh,
        "access": access,
      };
}
