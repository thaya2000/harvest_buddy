class Farmer {
  String? userId = "";
  String? firstName = "";
  String? lastName = "";
  String? address = "";
  String? phoneNumber = "";
  String? nicNo = "";

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "firstName": firstName,
        "lastName": lastName,
        "address": address,
        "phoneNumber": phoneNumber,
        "nicNo": nicNo,
      };
}
