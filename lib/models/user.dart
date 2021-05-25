class User {
  int? id;
  String? fullName;
  String? accountId;
  String? email;
  String? mobileNumber;
  String? country;
  String? profileImgUrl;
  //0: guest, 1: participant
  int? userType;
  String? gender;
  DateTime? dateOfBirth;
  String? countryFlagUrl;
  int? notificationCount;

  User({
    this.id,
    this.fullName,
    this.accountId,
    this.email,
    this.mobileNumber,
    this.country,
    this.profileImgUrl,
    this.userType,
    this.gender,
    this.dateOfBirth,
    this.countryFlagUrl,
    this.notificationCount,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['id'] ?? null,
        fullName: json['fullname'] ?? null,
        accountId: json['account_id'] ?? null,
        email: json['email'] ?? null,
        mobileNumber: json['phone'] ?? null,
        country: json['country'] ?? null,
        profileImgUrl: json['profile_image'] == null ||
                json['profile_image']['url'] == null
            ? null
            : json['profile_image']['url'],
        userType: json['user_type'] ?? null,
        gender: json['gender'] ?? null,
        dateOfBirth: json['date_of_birth'] == null
            ? null
            : DateTime.parse(json['date_of_birth']),
        countryFlagUrl:
            json['country_flag'] == null || json['country_flag']['url'] == null
                ? null
                : json['country_flag']['url'],
        notificationCount: json['notification_count'] ?? null,
      );
}
