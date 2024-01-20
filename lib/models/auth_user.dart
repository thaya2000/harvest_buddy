class AuthUser {
  String? userId = "";
  String? email = "";
  String? password = "";
  String? confirmPassword = "";
  String? firstName = "";
  String? lastName = "";
  String? address = "";
  String? phoneNumber = "";
  String? nicNo = "";
  bool? isServiceProvider = false;
  String? harvesterType = "";
  String? ratePerAcre = "";
  String? harvestingArea = "";

  AuthUser({
    this.firstName,
    this.lastName,
    this.address,
    this.nicNo,
    this.phoneNumber,
    this.harvesterType,
    this.ratePerAcre,
    this.harvestingArea,
  });

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "password": password,
        "email": email,
        "isServiceProvider": isServiceProvider,
      };
}
