class AccessToken {
  String tokenType;
  int exp;
  int iat;
  String jti;
  int userId;
  String username;
  bool isStaff;
  bool isAdmin;

  AccessToken({
    required this.tokenType,
    required this.exp,
    required this.iat,
    required this.jti,
    required this.userId,
    required this.username,
    required this.isStaff,
    required this.isAdmin,
  });

  factory AccessToken.fromJson(Map<String, dynamic> json) => AccessToken(
        tokenType: json["token_type"],
        exp: json["exp"],
        iat: json["iat"],
        jti: json["jti"],
        userId: json["user_id"],
        username: json["username"],
        isStaff: json["is_staff"],
        isAdmin: json["is_admin"],
      );

  Map<String, dynamic> toJson() => {
        "token_type": tokenType,
        "exp": exp,
        "iat": iat,
        "jti": jti,
        "user_id": userId,
        "username": username,
        "is_staff": isStaff,
        "is_admin": isAdmin,
      };
}
