class User {
  final String userId;
  final String email;
  final String password;
  final bool isServiceProvider;

  const User({
    required this.userId,
    required this.password,
    required this.email,
    required this.isServiceProvider,
  });

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "password": password,
        "email": email,
        "isServiceProvider": isServiceProvider,
      };
}
