import 'dart:convert';

import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String? userName;
  final String? displayName;
  final String? email;
  final bool isSystemAccount;
  final String? avatar;
  final String? companyTel1;
  final String? companyTel2;
  final String? employeeId;
  final String? token;
  final String? tokenPhp;

  const User({
    this.userName,
    this.displayName,
    this.email,
    this.isSystemAccount = false,
    this.avatar,
    this.companyTel1,
    this.companyTel2,
    this.employeeId,
    this.token,
    this.tokenPhp,
  });

  @override
  List<Object?> get props => [
        userName,
        displayName,
        email,
        isSystemAccount,
        avatar,
        companyTel1,
        companyTel2,
        employeeId,
        token,
        tokenPhp,
      ];

  Map<String, dynamic> toMap() {
    return {
      'userName': userName,
      'displayName': displayName,
      'email': email,
      'isSystemAccount': isSystemAccount,
      'avatar': avatar,
      'companyTel1': companyTel1,
      'companyTel2': companyTel2,
      'employeeId': employeeId,
      'token': token,
      'tokenPhp': tokenPhp,
    };
  }

  factory User.fromMap(String source) {
    Map<String, dynamic> map = json.decode(source);
    return User(
      userName: map['userName'],
      displayName: map['displayName'],
      email: map['email'],
      isSystemAccount: map['isSystemAccount'] ?? false,
      avatar: map['avatar'],
      companyTel1: map['companyTel1'],
      companyTel2: map['companyTel2'],
      employeeId: map['employeeId'],
      token: map['token'],
      tokenPhp: map['tokenPhp'],
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));
}
