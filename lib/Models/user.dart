class User {
  String? firstName;
  String? lastName;
  String? email;
  DateTime? dob;
  String? nationality;
  String? country;
  String? phNo;

  bool get doesRequiresSatisfied =>
      firstName != null &&
      lastName != null &&
      email != null &&
      dob != null &&
      nationality != null &&
      country != null &&
      firstName!.isNotEmpty &&
      lastName!.isNotEmpty &&
      email!.isNotEmpty &&
      nationality!.isNotEmpty &&
      country!.isNotEmpty;

  User(
      {this.country,
      this.dob,
      this.email,
      this.firstName,
      this.lastName,
      this.nationality,
      this.phNo});
}
