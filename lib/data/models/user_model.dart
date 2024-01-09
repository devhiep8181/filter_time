import 'dart:convert';
import 'package:flutter_app/domain/entites/user.dart';

class UserModel extends User {
  const UserModel(
      {super.avatar,
      super.companyTel1,
      super.companyTel2,
      super.displayName,
      super.email,
      super.employeeId,
      super.isSystemAccount,
      super.token,
      super.tokenPhp,
      super.userName});
  @override
  List<Object?> get props => [
        avatar,
        companyTel1,
        companyTel2,
        displayName,
        email,
        employeeId,
        isSystemAccount,
        token,
        tokenPhp,
        userName
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

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
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

  factory UserModel.fromMapDataSource(String source) {
    Map<String, dynamic> map = json.decode(source);
    return UserModel(
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

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));
}
