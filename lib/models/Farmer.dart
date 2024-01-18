class Farmer {
  final String userId;
  final String firstName;
  final String lastName;
  final String address;
  final String phoneNumber;
  final String nicNo;

  const Farmer({
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.address,
    required this.phoneNumber,
    required this.nicNo,
  });

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "firstName": firstName,
        "lastName": lastName,
        "address": address,
        "phoneNumber": phoneNumber,
        "nicNo": nicNo,
      };
}
