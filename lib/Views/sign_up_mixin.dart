import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:state_mgmt_cdgct/Models/user.dart';

mixin SignUpMixin {
  final GlobalKey<FormState> fkey = GlobalKey();
  String selectedGender = "female";
  final User _user = User();

  String? _emptyValidate(String? txt, String target) {
    if (txt == null || txt.isEmpty || txt.trim().isEmpty) {
      return "Please enter your $target";
    }
    return null;
  }

  String? validateFirstName(String? txt) {
    return _emptyValidate(txt, "first name");
  }

  String? validateLastName(String? txt) {
    return _emptyValidate(txt, "last name");
  }

  String? validateEmail(String? txt) {
    if (txt == null || txt.isEmpty) return "Please enter your email";
    if (!EmailValidator.validate(txt)) return "Please enter valid email";
  }

  String? validateDOB(String? txt) {
    return _emptyValidate(txt, "first name");
  }

  String? validateNationality(String? txt) {
    return _emptyValidate(txt, "first name");
  }

  String? validateCOR(String? txt) {
    return _emptyValidate(txt, "first name");
  }

  String? validateMobile(String? txt) {
    String? phNo =
        _user.phNo?.phoneNumber?.replaceAll(_user.phNo!.dialCode!, "");
    if (phNo == null || phNo.isEmpty) {
      return null;
    }

    if (phNo.length < 5) {
      return "Please enter valid phone number";
    }
  }

  void saveFirstName(String? txt) {
    _user.firstName = txt;
  }

  void saveLastName(String? txt) {
    _user.lastName = txt;
  }

  void saveEmail(String? txt) {
    _user.email = txt;
  }

  void saveDOB(String? txt) {
    _user.dob = txt;
  }

  void saveNationality(String? txt) {
    _user.nationality = txt;
  }

  void saveCOR(String? txt) {
    _user.country = txt;
  }

  void onPhoneInputChanged(PhoneNumber number) {
    _user.phNo = number;
  }

  void onSubmit() {
    if (fkey.currentState?.validate() ?? false) {
      fkey.currentState?.save();
      //_user is ready
    }
  }
}
