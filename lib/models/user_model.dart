class UserModel {
  String email;
  String userid;
  bool running;
  int amount;

  UserModel({
    required this.running,
    required this.amount,
    required this.email,
    required this.userid,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        running: json['running'] ?? false,
        amount: json['amount'] ?? 0,
        email: json['email'] ?? "",
        userid: json['userid'] ?? "",
      );
}
