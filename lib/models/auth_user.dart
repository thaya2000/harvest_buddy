import 'package:harvest_buddy/models/service_provider.dart';

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
  double? ratePerAcre = 0;
  String? harvestingArea = "";

  AuthUser({
    this.userId,
    this.firstName,
    this.lastName,
    this.address,
    this.nicNo,
    this.phoneNumber,
    this.harvesterType,
    this.ratePerAcre,
    this.harvestingArea,
  });

  ServiceProvider toServiceProvider() {
    return ServiceProvider(
      userId: userId,
      firstName: firstName,
      lastName: lastName,
      address: address,
      phoneNumber: phoneNumber,
      nicNo: nicNo,
      harvesterType: harvesterType,
      // ratePerAcre: double.tryParse(ratePerAcre ?? "") ?? 20000.0,
      ratePerAcre: ratePerAcre,
      harvestingArea: harvestingArea,
    );
  }

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "password": password,
        "email": email,
        "isServiceProvider": isServiceProvider,
      };
}
