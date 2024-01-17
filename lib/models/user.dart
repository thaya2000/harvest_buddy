class User {
  final String userId;
  final String email;
  final String password;
  final String firstName;
  final String lastName;
  final String address;
  final String phoneNumber;
  final String nicNo;

  const User({
    required this.userId,
    required this.password,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.address,
    required this.phoneNumber,
    required this.nicNo,
  });

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "password": password,
        "email": email,
        "firstName": firstName,
        "lastName": lastName,
        "address": address,
        "phoneNumber": phoneNumber,
        "nicNo": nicNo,
      };
}
