// ignore_for_file: public_member_api_docs, sort_constructors_first, unnecessary_null_comparison
import 'dart:convert';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class StudentModel {
  final String name;
  final String lastName;
  final String password;
  final String profilePicUrl;
  final int cramSchoolID;
  final List? exams;
  final List? announcements;
  final int? userNumber;
  final String? uid;
  final String email;
  StudentModel({
    required this.name,
    required this.lastName,
    required this.password,
    required this.profilePicUrl,
    required this.cramSchoolID,
    required this.email,
    this.uid,
    this.exams,
    this.announcements,
    this.userNumber,
  });

  StudentModel copyWith({
    String? name,
    String? lastName,
    String? password,
    String? profilePicUrl,
    int? cramSchoolID,
    String? uid,
    String? email,
    List? exams,
    List? announcements,
    int? userNumber,
  }) {
    return StudentModel(
      name: name ?? this.name,
      lastName: lastName ?? this.lastName,
      password: password ?? this.password,
      profilePicUrl: profilePicUrl ?? this.profilePicUrl,
      cramSchoolID: cramSchoolID ?? this.cramSchoolID,
      exams: exams ?? this.exams,
      uid: uid ?? this.uid,
      email: email ?? this.email,
      announcements: announcements ?? this.announcements,
      userNumber: userNumber ?? this.userNumber,
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
      'uid': uid,
      'email': email,
      'announcements': announcements,
      'userNumber': userNumber
    };
  }

  factory StudentModel.fromMap(Map<String, dynamic> map) {
    return StudentModel(
      name: map['name'] as String,
      lastName: map['lastName'] as String,
      password: map['password'] as String,
      email: map['email'] as String,
      profilePicUrl: map['profilePicUrl'] as String,
      cramSchoolID: map['cramSchoolID'] as int,
      uid: map['uid'] as String,
      exams: List.from((map['exams'] as List)),
      announcements: List.from((map['announcement'] as List)),
      userNumber: map['userNumber'] as int,
    );
  }

  factory StudentModel.fromSnapshot(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    var document = snapshot.data();
    return StudentModel(
      email: document?['email'],
      name: document?['name'],
      cramSchoolID: document?['cramSchoolID'],
      uid: document?['uid'],
      lastName: document?['lastName'],
      password: document?['password'],
      profilePicUrl: document?['profilePicUrl'],
      userNumber: document?['userNumber'],
    );
  }

  String toJson() => json.encode(toMap());

  factory StudentModel.fromJson(String source) =>
      StudentModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'StudentModel(name: $name, lastName: $lastName, password: $password, profilePicUrl: $profilePicUrl, cramSchoolID: $cramSchoolID, exams: $exams, announcements: $announcements, userNumber: $userNumber, uid: $uid, email: $email)';
  }

  @override
  bool operator ==(covariant StudentModel other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.lastName == lastName &&
        other.password == password &&
        other.profilePicUrl == profilePicUrl &&
        other.cramSchoolID == cramSchoolID &&
        listEquals(other.exams, exams) &&
        listEquals(other.announcements, announcements) &&
        other.email == email &&
        other.userNumber == userNumber &&
        other.uid == uid;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        lastName.hashCode ^
        password.hashCode ^
        profilePicUrl.hashCode ^
        cramSchoolID.hashCode ^
        exams.hashCode ^
        email.hashCode ^
        announcements.hashCode ^
        userNumber.hashCode ^
        uid.hashCode;
  }
}
