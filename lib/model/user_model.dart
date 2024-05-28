class User {
  final String uuid;
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final bool is2faEnabled;
  final String middleName;
  final String profileImage;
  final String streetNo;
  final String streetName;
  final String city;
  final String state;
  final String country;
  final String postalCode;
  final String phoneToken;
  final bool isVerified;
  final bool hasPin;
  final Tier tier;
  final bool isBvnVerified;
  final bool isNinVerified;

  User({
    required this.uuid,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.is2faEnabled,
    required this.middleName,
    required this.profileImage,
    required this.streetNo,
    required this.streetName,
    required this.city,
    required this.state,
    required this.country,
    required this.postalCode,
    required this.phoneToken,
    required this.isVerified,
    required this.hasPin,
    required this.tier,
    required this.isBvnVerified,
    required this.isNinVerified,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      uuid: json['uuid'] ?? '',
      firstName: json['first_name'] ?? '',
      lastName: json['last_name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      is2faEnabled: json['2fa_enabled'] ?? false,
      middleName: json['middle_name'] ?? '',
      profileImage: json['profile_image'] ?? '',
      streetNo: json['street_no'] ?? '',
      streetName: json['street_name'] ?? '',
      city: json['city'] ?? '',
      state: json['state'] ?? '',
      country: json['country'] ?? '',
      postalCode: json['postal_code'] ?? '',
      phoneToken: json['phone_token'] ?? '',
      isVerified: json['is_verified'] ?? false,
      hasPin: json['pin'] ?? false,
      tier: json['tier'] != null
          ? Tier.fromJson(json['tier'])
          : Tier(
              name: '',
              minimumBalance: null,
              interestRate: null,
              monthlyCharge: '',
              withdrawalLimit: '',
              monthlyWithdrawalLimit: '',
              depositLimit: '',
              monthlyDepositLimit: '',
              cashbackPercentage: '',
              minimumDeposit: '',
            ),
      isBvnVerified: json['is_bvn_verified'] ?? false,
      isNinVerified: json['is_nin_verified'] ?? false,
    );
  }
}

class Tier {
  final String name;
  final double? minimumBalance;
  final double? interestRate;
  final String monthlyCharge;
  final String withdrawalLimit;
  final String monthlyWithdrawalLimit;
  final String depositLimit;
  final String monthlyDepositLimit;
  final String cashbackPercentage;
  final String minimumDeposit;

  Tier({
    required this.name,
    this.minimumBalance,
    this.interestRate,
    required this.monthlyCharge,
    required this.withdrawalLimit,
    required this.monthlyWithdrawalLimit,
    required this.depositLimit,
    required this.monthlyDepositLimit,
    required this.cashbackPercentage,
    required this.minimumDeposit,
  });

  factory Tier.fromJson(Map<String, dynamic> json) {
    return Tier(
      name: json['name'] ?? '',
      minimumBalance: json['minimumBalance'] != null
          ? double.tryParse(json['minimumBalance'].toString())
          : null,
      interestRate: json['interestRate'] != null
          ? double.tryParse(json['interestRate'].toString())
          : null,
      monthlyCharge: json['monthlyCharge'] ?? '',
      withdrawalLimit: json['withdrawalLimit'] ?? '',
      monthlyWithdrawalLimit: json['monthlyWithdrawalLimit'] ?? '',
      depositLimit: json['depositLimit'] ?? '',
      monthlyDepositLimit: json['monthlyDepositLimit'] ?? '',
      cashbackPercentage: json['cashbackPercentage'] ?? '',
      minimumDeposit: json['minimumDeposit'] ?? '',
    );
  }
}
