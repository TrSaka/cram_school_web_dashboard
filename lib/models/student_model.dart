// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class StudentModel {
  final String name;
  final String lastName;
  final String password;
  final String profilePicUrl;
  final int cramSchoolID;
  final List? exams;
  StudentModel({
    required this.name,
    required this.lastName,
    required this.password,
    required this.profilePicUrl,
    required this.cramSchoolID,
    this.exams,
  });

  StudentModel copyWith({
    String? name,
    String? lastName,
    String? password,
    String? profilePicUrl,
    int? cramSchoolID,
    List? exams,
  }) {
    return StudentModel(
      name: name ?? this.name,
      lastName: lastName ?? this.lastName,
      password: password ?? this.password,
      profilePicUrl: profilePicUrl ?? this.profilePicUrl,
      cramSchoolID: cramSchoolID ?? this.cramSchoolID,
      exams: exams ?? this.exams,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'lastName': lastName,
      'password': password,
      'profilePicUrl': profilePicUrl,
      'cramSchoolID': cramSchoolID,
      'exams': exams,
    };
  }

  factory StudentModel.fromMap(Map<String, dynamic> map) {
    return StudentModel(
      name: map['name'] as String,
      lastName: map['lastName'] as String,
      password: map['password'] as String,
      profilePicUrl: map['profilePicUrl'] as String,
      cramSchoolID: map['cramSchoolID'] as int,
      exams: List.from(
        (map['exams'] as List),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory StudentModel.fromJson(String source) =>
      StudentModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'StudentModel(name: $name, lastName: $lastName, password: $password, profilePicUrl: $profilePicUrl, cramSchoolID: $cramSchoolID, exams: $exams)';
  }

  @override
  bool operator ==(covariant StudentModel other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.lastName == lastName &&
        other.password == password &&
        other.profilePicUrl == profilePicUrl &&
        other.cramSchoolID == cramSchoolID &&
        listEquals(other.exams, exams);
  }

  @override
  int get hashCode {
    return name.hashCode ^
        lastName.hashCode ^
        password.hashCode ^
        profilePicUrl.hashCode ^
        cramSchoolID.hashCode ^
        exams.hashCode;
  }
}
