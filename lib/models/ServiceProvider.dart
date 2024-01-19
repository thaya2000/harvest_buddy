class ServiceProvider {
  final String userId;
  final String firstName;
  final String lastName;
  final String address;
  final String phoneNumber;
  final String nicNo;
  final String harvesterType;
  final String ratePerAcre;
  final String harvestingArea;

  const ServiceProvider({
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.address,
    required this.phoneNumber,
    required this.nicNo,
    required this.harvesterType,
    required this.ratePerAcre,
    required this.harvestingArea,
  });

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
