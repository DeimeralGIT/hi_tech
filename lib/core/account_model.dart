class AccountModel {
  String userID;
  String password;

  AccountModel({
    required this.userID,
    required this.password,
  });

  factory AccountModel.fromJson(Map<String, dynamic> data) {
    return AccountModel(
      userID: data["user_id"] ?? "",
      password: data["password"] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "user_id": userID,
      "password": password,
    };
  }
}
