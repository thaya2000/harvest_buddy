class ServiceProvider {
  String? userId = "";
  String? firstName = "";
  String? lastName = "";
  String? address = "";
  String? phoneNumber = "";
  String? nicNo = "";
  String? harvesterType = "";
  double? ratePerAcre = 20000.0;
  String? harvestingArea = "";

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "firstName": firstName,
        "lastName": lastName,
        "address": address,
        "phoneNumber": phoneNumber,
        "nicNo": nicNo,
        "harvesterType": harvesterType,
        "ratePerAcre": ratePerAcre,
        "harvestingArea": harvestingArea,
      };
}
