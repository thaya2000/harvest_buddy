import 'package:harvest_buddy/models/farmer.dart';
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

  // set setUserId(String? value) {
  //   userId = value;
  // }

  // set setEmail(String? value) {
  //   email = value;
  // }

  // set setPassword(String? value) {
  //   password = value;
  // }

  // set setConfirmPassword(String? value) {
  //   confirmPassword = value;
  // }

  // set setFirstName(String? value) {
  //   firstName = value;
  // }

  // set setLastName(String? value) {
  //   lastName = value;
  // }

  // set setAddress(String? value) {
  //   address = value;
  // }

  // set setPhoneNumber(String? value) {
  //   phoneNumber = value;
  // }

  // set setNicNo(String? value) {
  //   nicNo = value;
  // }

  // set setIsServiceProvider(bool? value) {
  //   isServiceProvider = value;
  // }

  // set setHarvesterType(String? value) {
  //   harvesterType = value;
  // }

  // set setRatePerAcre(double? value) {
  //   ratePerAcre = value;
  // }

  // set setHarvestingArea(String? value) {
  //   harvestingArea = value;
  // }

  factory AuthUser.fromServiceProviderData(Map<String, dynamic> data) {
    return AuthUser(
      firstName: data['firstName'] ?? "",
      lastName: data['lastName'] ?? "",
      address: data['address'] ?? "",
      nicNo: data['nicNo'] ?? "",
      phoneNumber: data['phoneNumber'] ?? "",
      harvesterType: data['harvesterType'] ?? "",
      ratePerAcre: data['ratePerAcre'] ?? 0.0,
      harvestingArea: data['harvestingArea'] ?? "",
    );
  }

  ServiceProvider toServiceProvider() {
    return ServiceProvider(
      userId: userId,
      firstName: firstName,
      lastName: lastName,
      address: address,
      phoneNumber: phoneNumber,
      nicNo: nicNo,
      harvesterType: harvesterType,
      ratePerAcre: ratePerAcre,
      harvestingArea: harvestingArea,
    );
  }

  Farmer toFarmer() {
    return Farmer(
      userId: userId,
      firstName: firstName,
      lastName: lastName,
      address: address,
      phoneNumber: phoneNumber,
      nicNo: nicNo,
    );
  }

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "password": password,
        "email": email,
        "isServiceProvider": isServiceProvider,
      };
}
