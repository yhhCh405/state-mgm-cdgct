import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class User {
  String? firstName;
  String? lastName;
  String? email;
  String? dob;
  String? nationality;
  String? country;
  PhoneNumber? phNo;

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
