import 'package:flutter/material.dart';

class UserRoleProvider with ChangeNotifier {
  String _userRole = '';
  String _userName = '';
  String _userEmail = '';
  String _userLevel = '';
  String _userDept = '';
  String _userId = '';

  String get userRole => _userRole;
  String get userName => _userName;
  String get userEmail => _userEmail;
  String get userLevel => _userLevel;
  String get userDept => _userDept;
  String get userId => _userId;

  void setUserDetails({
    required String role,
    required String name,
    required String email,
    required String level,
    required String dept,
    required String docId,
  }) {
    _userRole = role;
    _userName = name;
    _userEmail = email;
    _userLevel = level;
    _userDept = dept;
    _userId = docId;
    notifyListeners();
  }

  void clearUserDetails() {
    _userRole = '';
    _userName = '';
    _userEmail = '';
    _userLevel = '';
    _userDept = '';
    _userId = '';
    notifyListeners();
  }
}
